package top.guitoubing.mapper;

import java.math.BigDecimal;
import java.util.List;

import top.guitoubing.pojo.Moment;

public interface MomentMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(Moment record);

    int insertSelective(Moment record);

    Moment selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(Moment record);

    int updateByPrimaryKey(Moment record);

    List<Moment> getMyMomentsByUserId(BigDecimal id);

    List<Moment> getMomentsByUserId(BigDecimal id);

    BigDecimal getMaxId();
}