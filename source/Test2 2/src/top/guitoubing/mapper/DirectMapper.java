package top.guitoubing.mapper;

import top.guitoubing.pojo.DirectKey;

public interface DirectMapper {
    int deleteByPrimaryKey(DirectKey key);

    int insert(DirectKey record);

    int insertSelective(DirectKey record);
}