package top.guitoubing.mapper;

import top.guitoubing.pojo.MomentLovedKey;

public interface MomentLovedMapper {
    int deleteByPrimaryKey(MomentLovedKey key);

    int insert(MomentLovedKey record);

    int insertSelective(MomentLovedKey record);
}