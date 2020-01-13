package top.guitoubing.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.guitoubing.mapper.*;
import top.guitoubing.pojo.*;
import top.guitoubing.service.MovieService;
import top.guitoubing.service.UserService;

import java.math.BigDecimal;
import java.util.*;

@Service
class UserServiceImpl implements UserService {

    @Autowired
    MovieLovedMapper movieLovedMapper;

    @Autowired
    MovieTagMapper movieTagMapper;

    @Autowired
    SubscribeMapper subscribeMapper;

    @Autowired
    UserMapper userMapper;

    @Autowired
    TagMapper tagMapper;

    @Autowired
    MovieMapper movieMapper;

    @Autowired
    PictureMapper pictureMapper;

    @Autowired
    RegionMapper regionMapper;

    @Autowired
    TypeMapper typeMapper;

    @Autowired
    DetailMapper detailMapper;

    @Autowired
    TagLovedMapper tagLovedMapper;
//
//    @Autowired
//    MessageMapper messageMapper;

    @Override
    public User get(String tel) {
        return userMapper.selectByTel(tel);
    }

    @Override
    public BigDecimal getMaxId() {
        return userMapper.selectMaxId().add(BigDecimal.ONE);
    }

    @Override
    public void register(User user) {
        userMapper.insert(user);
    }

    @Override
    public void update(User user) {
        userMapper.updateByPrimaryKey(user);
    }

    @Override
    public List<TagData> tags(BigDecimal id) {
        List<TagData> tagData = new ArrayList<>();
        List<Tag> tags = tagMapper.selectByUser(id);
        for (Tag tag : tags){
            tagData.add(new TagData(tag, getMovieData(movieMapper.selectByTag(tag.getId()))));
        }
        return tagData;
    }

    @Override
    public List<ProfileTagData> tagsProfile(BigDecimal id) {
        List<ProfileTagData> tagData = new ArrayList<>();
        List<Tag> tags = tagMapper.selectByUser(id);
        for (Tag tag : tags){
            tagData.add(new ProfileTagData(tag, pictureMapper.selectByTag(tag.getId()).getResource()));
        }
        return tagData;
    }

    @Override
    public List<ProfileTagData> tagsLovedProfile(BigDecimal id) {
        List<ProfileTagData> tagData = new ArrayList<>();
        List<Tag> tags = tagMapper.selectByUserLoved(id);
        for (Tag tag : tags){
            tagData.add(new ProfileTagData(tag, pictureMapper.selectByTag(tag.getId()).getResource()));
        }
        return tagData;
    }


    @Override
    public List<TagData> tagsLoved(BigDecimal id){
        List<TagData> tagData = new ArrayList<>();
        List<Tag> tags = tagMapper.selectByUserLoved(id);
        for (Tag tag : tags){
            tagData.add(new TagData(tag, getMovieData(movieMapper.selectByTag(tag.getId()))));
        }
        return tagData;
    }

    @Override
    public Map<BigDecimal, String> getLovedTagCovers(BigDecimal id){
        Map<BigDecimal, String> covers= new HashMap<BigDecimal, String>();
        List<Tag> tagData = tagMapper.selectByUserLoved(id);
        for(Tag x: tagData){
            BigDecimal i = x.getCoverPic();
            String url = pictureMapper.selectByPrimaryKey(i).getResource();
            covers.put(x.getId(),url);
        }
        return covers;
    }

    @Override
    public List<MovieData> getMovieData(List<Movie> movies){
        List<MovieData> movieDatas = new ArrayList<>();
        for (Movie movie : movies){
            movieDatas.add(movieDetail(movie));
        }
        return movieDatas;
    }

    @Override
    public List<Movie> getMovieByKey(List<String> keys){
        List<Movie> movies = new ArrayList<>();
        for (String key : keys){
            movies.addAll(movieMapper.selectByName(key));
        }
        return movies;
    }

    @Override
    public List<MovieData> getMovieDataByKey(List<String> keys) {
        List<MovieData> movieData = new ArrayList<>();
        for (String key : keys){
            movieData.addAll(getMovieData(movieMapper.selectByName(key)));
        }
        return movieData;
    }

    @Override
    public boolean loveMovie(BigDecimal uid, BigDecimal mid) {
        List<Movie> movies = movieMapper.selectByUser(uid);
        for (Movie movie : movies){
            if (mid.equals(movie.getId())){
                return true;
            }
        }
        return false;
    }

    @Override
    public MovieData movieDetail(Movie movie){
        MovieData movieData = new MovieData();
        movieData.setId(Integer.parseInt(String.valueOf(movie.getId())));
        movieData.setMovie(movie);
        movieData.setCover(pictureMapper.selectByPrimaryKey(movie.getCover()).getResource());
        if (detailMapper.selectByPrimaryKey(Long.parseLong(String.valueOf(movie.getId()))) == null){
            movieData.setDetail("该电影还没有详情哦！");
        }else {
            movieData.setDetail(detailMapper.selectByPrimaryKey(Long.parseLong(String.valueOf(movie.getId()))).getContent());
        }
        movieData.setPicture(pictureMapper.selectByPrimaryKey(movie.getCover()).getResource());
        if (movie.getBackground() != null){
            movieData.setBackgroud(pictureMapper.selectByPrimaryKey(movie.getBackground()).getResource());
        }
        movieData.setRegion(regionMapper.selectByPrimaryKey(movie.getRegion()).getDetail());
        movieData.setType(typeMapper.selectByPrimaryKey(movie.getType()).getDetail());
        return movieData;
    }

    @Override
    public User get(BigDecimal id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public void addTagLoved(BigDecimal uid, BigDecimal tid) {
        tagLovedMapper.insert(new TagLovedKey(tid, uid));
    }

    @Override
    public void updateTag(Tag tag) {
        tagMapper.updateByPrimaryKey(tag);
    }

    @Override
    public Tag getTag(BigDecimal id) {
        return tagMapper.selectByPrimaryKey(id);
    }

    @Override
    public void addTag(Tag tag) {
        tag.setId(tagMapper.maxId().add(BigDecimal.ONE));
        tagMapper.insert(tag);
    }

    @Override
    public int countFollower(BigDecimal id) {
        return userMapper.countFollower(id);
    }

    @Override
    public int countFollowed(BigDecimal id) {
        return userMapper.countFollowed(id);
    }

    @Override
    public List<User> selectFollower(BigDecimal id) {
        return userMapper.selectFollower(id);
    }

    @Override
    public List<User> selectFollowed(BigDecimal id) {
        return userMapper.selectFollowed(id);
    }

    @Override
    public boolean checkFollowed(BigDecimal fid, BigDecimal uid) {
        return subscribeMapper.selectFollowed(fid, uid) == 1;
    }

    @Override
    public void addSubscribe(SubscribeKey subscribeKey) {
        subscribeMapper.insert(subscribeKey);
    }

    @Override
    public void deleteSubscribe(SubscribeKey subscribeKey) {
        subscribeMapper.deleteByPrimaryKey(subscribeKey);
    }

    @Override
    public void addMovieLoved(MovieLovedKey movieLovedKey) {
        movieLovedMapper.insert(movieLovedKey);
    }

    @Override
    public void addMovieTag(BigDecimal movie_id, BigDecimal tag_id) {
        MovieTag x = new MovieTag();
        x.setMovieId(movie_id);
        x.setTagId(tag_id);
        x.setIntro("好");
        movieTagMapper.insert(x);
    }

//    @Override
//    public List<MessageData> getMessageData(BigDecimal id) {
//        List<Message> messages = messageMapper.selectByToUser(id);
//        List<MessageData> messageData = new ArrayList<>();
//        for (Message message : messages){
//            messageData.add(getMessageDataFromMessage(message));
//        }
//        return messageData;
//    }
//
//    @Override
//    public MessageData getMessageDataFromMessage(Message message) {
//        MessageData messageData = new MessageData();
//        messageData.setId(message.getId());
//        messageData.setMessage(message);
//        messageData.setUser(userMapper.selectByPrimaryKey(message.getFrom()));
//        return messageData;
//    }
}
