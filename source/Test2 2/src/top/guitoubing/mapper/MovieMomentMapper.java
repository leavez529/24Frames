package top.guitoubing.mapper;

import top.guitoubing.pojo.MovieMomentKey;

public interface MovieMomentMapper {
    int deleteByPrimaryKey(MovieMomentKey key);

    int insert(MovieMomentKey record);

    int insertSelective(MovieMomentKey record);
}