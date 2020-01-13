package top.guitoubing.mapper;

import top.guitoubing.pojo.MovieLovedKey;

import java.math.BigDecimal;

public interface MovieLovedMapper {
    int deleteByPrimaryKey(MovieLovedKey key);

    int insert(MovieLovedKey record);

    int insertSelective(MovieLovedKey record);

    BigDecimal getLoved(BigDecimal movie_id);
}