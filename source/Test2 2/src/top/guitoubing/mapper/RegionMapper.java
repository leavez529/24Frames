package top.guitoubing.mapper;

import java.math.BigDecimal;
import top.guitoubing.pojo.Region;

public interface RegionMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(Region record);

    int insertSelective(Region record);

    Region selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(Region record);

    int updateByPrimaryKey(Region record);
}