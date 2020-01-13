package top.guitoubing.mapper;

import top.guitoubing.pojo.ActorPicKey;

public interface ActorPicMapper {
    int deleteByPrimaryKey(ActorPicKey key);

    int insert(ActorPicKey record);

    int insertSelective(ActorPicKey record);
}