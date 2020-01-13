package top.guitoubing.mapper;

import top.guitoubing.pojo.CooperationKey;

public interface CooperationMapper {
    int deleteByPrimaryKey(CooperationKey key);

    int insert(CooperationKey record);

    int insertSelective(CooperationKey record);
}