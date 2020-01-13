package top.guitoubing.mapper;

import top.guitoubing.pojo.Director;

import java.math.BigDecimal;
import java.util.List;

public interface DirectorMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(Director record);

    int insertSelective(Director record);

    Director selectByPrimaryKey(BigDecimal id);

    List<Director> selectByMovie(BigDecimal id);

    int updateByPrimaryKeySelective(Director record);

    int updateByPrimaryKey(Director record);
}