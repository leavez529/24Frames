package top.guitoubing.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.guitoubing.mapper.*;
import top.guitoubing.pojo.*;
import top.guitoubing.service.MomentService;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Service
public class MomentServiceImpl implements MomentService {
    @Autowired
    MomentMapper momentMapper;

    @Autowired
    CommentMapper commentMapper;

    @Autowired
    PictureMapper pictureMapper;

    @Autowired
    UserMapper userMapper;

    @Autowired
    MomentLovedMapper momentLovedMapper;

    @Autowired
    MomentPicMapper momentPicMapper;

    @Override
    public Moment get(BigDecimal id) {
        return momentMapper.selectByPrimaryKey(id);
    }

    @Override
    public BigDecimal getMaxId() {
        return momentMapper.getMaxId().add(BigDecimal.ONE);
    }

    @Override
    public void addMoment(Moment moment) {
        momentMapper.insert(moment);
    }

    @Override
    public void addMomentPic(MomentPicKey momentPicKey) {
        momentPicMapper.insert(momentPicKey);
    }

    @Override
    /*
        根据用户ID获得该用户的所有动态
     */
    public List<Moment> getMyMoments(BigDecimal id) {
        return momentMapper.getMyMomentsByUserId(id);
    }

    @Override
    /*
        根据用户ID获得该用户关注的用户的所有动态
     */
    public List<Moment> getMoments(BigDecimal id) {
        return momentMapper.getMomentsByUserId(id);
    }

    @Override
    /*
        用户评论某一动态
     */
    public void comment(BigDecimal user_id, BigDecimal moment_id, String str) {
        BigDecimal id = commentMapper.getMaxId();
        id = id.add(BigDecimal.ONE);
        Comment comment = new Comment(id, str, moment_id, user_id);
        commentMapper.insert(comment);
    }

    @Override
    /*
        分享一个动态
     */
    public void share(BigDecimal user_id, String str, List<String> pic) {
//        Moment max = momentMapper.getMaxId();
//        BigDecimal moment_id = max.getId();
//        for(String )
    }

    @Override
    public MomentData getMomentDataByMoment(Moment moment) {
        MomentData momentData = new MomentData();
        momentData.setId(moment.getId());
        momentData.setMoment(moment);
        momentData.setUser(userMapper.selectByPrimaryKey(moment.getUserId()));
        List<CommentData> commentData = new ArrayList<>();
        List<Comment> comments = commentMapper.selectByMomentId(moment.getId());
        for (Comment comment : comments){
            commentData.add(new CommentData(comment.getId(), comment, userMapper.selectByPrimaryKey(comment.getUserId())));
        }
        momentData.setCommentData(commentData);
        List<Picture> pictures = pictureMapper.selectByMoment(moment.getId());
        if (pictures.size() != 0){
            momentData.setCover(pictures.get(0).getResource());
        }
        momentData.setLovers(userMapper.selectByLovedMoment(moment.getId()));
        return momentData;
    }

    @Override
    public List<MomentData> getMomentData(List<Moment> moments) {
        List<MomentData> momentData = new ArrayList<>();
        for (Moment moment : moments){
            momentData.add(getMomentDataByMoment(moment));
        }
        return momentData;
    }

    @Override
    public void addLove(MomentLovedKey momentLovedKey) {
        momentLovedMapper.insert(momentLovedKey);
    }

    @Override
    public void cancelLove(MomentLovedKey momentLovedKey) {
        momentLovedMapper.deleteByPrimaryKey(momentLovedKey);
    }


}
