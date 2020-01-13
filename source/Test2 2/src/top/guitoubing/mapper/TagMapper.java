package top.guitoubing.mapper;

import java.math.BigDecimal;
import java.util.List;

import top.guitoubing.pojo.Tag;

public interface TagMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(Tag record);

    int insertSelective(Tag record);

    Tag selectByPrimaryKey(BigDecimal id);

    List<Tag> selectByUser(BigDecimal id);

    List<Tag> selectByUserLoved(BigDecimal id);

    int updateByPrimaryKeySelective(Tag record);

    int updateByPrimaryKey(Tag record);

    BigDecimal maxId();
}