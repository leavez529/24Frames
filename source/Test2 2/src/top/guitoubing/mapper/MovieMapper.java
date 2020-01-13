package top.guitoubing.mapper;

import java.math.BigDecimal;
import java.util.List;

import top.guitoubing.pojo.Movie;

public interface MovieMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(Movie record);

    int insertSelective(Movie record);

    Movie selectByPrimaryKey(BigDecimal id);

    List<Movie> selectByType(String type);

    List<Movie> selectByRegion(String region);

    List<Movie> selectByDirector(String director);

    List<Movie> selectByTag(BigDecimal id);

    List<Movie> selectByUser(BigDecimal id);

    List<Movie> selectByName(String name);

    int updateByPrimaryKeySelective(Movie record);

    int updateByPrimaryKey(Movie record);


}