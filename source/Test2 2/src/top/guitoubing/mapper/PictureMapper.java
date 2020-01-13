package top.guitoubing.mapper;

import java.math.BigDecimal;
import java.util.List;

import top.guitoubing.pojo.Picture;

public interface PictureMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(Picture record);

    int insertSelective(Picture record);

    Picture selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(Picture record);

    int updateByPrimaryKey(Picture record);

    List<Picture> selectByMovie(BigDecimal id);

    List<Picture> selectByMoment(BigDecimal id);

    Picture selectByTag(BigDecimal id);

    BigDecimal getMaxId();
}