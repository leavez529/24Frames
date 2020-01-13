package top.guitoubing.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.guitoubing.mapper.MovieMapper;
import top.guitoubing.mapper.RemarkMapper;
import top.guitoubing.mapper.UserMapper;
import top.guitoubing.pojo.Remark;
import top.guitoubing.pojo.RemarkData;
import top.guitoubing.service.RemarkService;

import java.math.BigDecimal;

@Service
public class RemarkServiceImpl implements RemarkService {

    @Autowired
    RemarkMapper remarkMapper;

    @Autowired
    UserMapper userMapper;

    @Autowired
    MovieMapper movieMapper;

    @Override
    public RemarkData getRemarkData(BigDecimal id) {
        RemarkData remarkData = new RemarkData();
        Remark remark = remarkMapper.selectByPrimaryKey(id);
        remarkData.setRemark(remark);
        remarkData.setUsername(userMapper.selectByPrimaryKey(remark.getUserId()).getUsername());
        remarkData.setMovieName(movieMapper.selectByPrimaryKey(remark.getMovieId()).getName());
        return remarkData;
    }

    @Override
    public BigDecimal getMaxId() {
        return remarkMapper.maxId().add(BigDecimal.ONE);
    }

    @Override
    public void addRemark(Remark remark) {
        remarkMapper.insert(remark);
    }
}
