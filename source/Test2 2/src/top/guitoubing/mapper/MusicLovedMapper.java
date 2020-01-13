package top.guitoubing.mapper;

import top.guitoubing.pojo.MusicLovedKey;

public interface MusicLovedMapper {
    int deleteByPrimaryKey(MusicLovedKey key);

    int insert(MusicLovedKey record);

    int insertSelective(MusicLovedKey record);
}