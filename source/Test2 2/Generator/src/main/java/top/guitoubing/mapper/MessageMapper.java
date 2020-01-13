package top.guitoubing.mapper;

import java.math.BigDecimal;
import top.guitoubing.pojo.Message;

public interface MessageMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(Message record);

    int insertSelective(Message record);

    Message selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(Message record);

    int updateByPrimaryKey(Message record);
}