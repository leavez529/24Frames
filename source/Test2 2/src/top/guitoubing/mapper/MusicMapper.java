package top.guitoubing.mapper;

import java.math.BigDecimal;
import java.util.List;

import top.guitoubing.pojo.Music;

public interface MusicMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(Music record);

    int insertSelective(Music record);

    Music selectByPrimaryKey(BigDecimal id);

    List<Music> selectByMovie(BigDecimal id);

    int updateByPrimaryKeySelective(Music record);

    int updateByPrimaryKey(Music record);
}