package top.guitoubing.mapper;

import top.guitoubing.pojo.DirectorPicKey;

public interface DirectorPicMapper {
    int deleteByPrimaryKey(DirectorPicKey key);

    int insert(DirectorPicKey record);

    int insertSelective(DirectorPicKey record);
}