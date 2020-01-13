package top.guitoubing.mapper;

import java.math.BigDecimal;
import top.guitoubing.pojo.Type;

public interface TypeMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(Type record);

    int insertSelective(Type record);

    Type selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(Type record);

    int updateByPrimaryKey(Type record);
}