package top.guitoubing.mapper;

import java.math.BigDecimal;
import top.guitoubing.pojo.Actor;

public interface ActorMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(Actor record);

    int insertSelective(Actor record);

    Actor selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(Actor record);

    int updateByPrimaryKey(Actor record);
}