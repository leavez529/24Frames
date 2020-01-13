package top.guitoubing.mapper;

import top.guitoubing.pojo.MovieMusicKey;

public interface MovieMusicMapper {
    int deleteByPrimaryKey(MovieMusicKey key);

    int insert(MovieMusicKey record);

    int insertSelective(MovieMusicKey record);
}