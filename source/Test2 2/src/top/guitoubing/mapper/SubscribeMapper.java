package top.guitoubing.mapper;

import top.guitoubing.pojo.SubscribeKey;

import java.math.BigDecimal;

public interface SubscribeMapper {
    int deleteByPrimaryKey(SubscribeKey key);

    int insert(SubscribeKey record);

    int insertSelective(SubscribeKey record);

    int selectFollowed(BigDecimal fid, BigDecimal uid);
}