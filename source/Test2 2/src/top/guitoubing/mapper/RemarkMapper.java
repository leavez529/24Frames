package top.guitoubing.mapper;

import java.math.BigDecimal;
import java.util.List;

import top.guitoubing.pojo.Remark;

public interface RemarkMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(Remark record);

    int insertSelective(Remark record);

    Remark selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(Remark record);

    int updateByPrimaryKey(Remark record);

    List<Remark> selectByMovie(BigDecimal id);

    BigDecimal maxId();
}