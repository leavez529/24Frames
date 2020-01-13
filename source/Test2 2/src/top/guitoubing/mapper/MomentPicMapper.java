package top.guitoubing.mapper;

import top.guitoubing.pojo.MomentPicKey;

public interface MomentPicMapper {
    int deleteByPrimaryKey(MomentPicKey key);

    int insert(MomentPicKey record);

    int insertSelective(MomentPicKey record);
}