package top.guitoubing.mapper;

import top.guitoubing.pojo.TagLovedKey;

public interface TagLovedMapper {
    int deleteByPrimaryKey(TagLovedKey key);

    int insert(TagLovedKey record);

    int insertSelective(TagLovedKey record);
}