package top.guitoubing.mapper;

import top.guitoubing.pojo.StaringKey;

public interface StaringMapper {
    int deleteByPrimaryKey(StaringKey key);

    int insert(StaringKey record);

    int insertSelective(StaringKey record);
}