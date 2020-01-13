package top.guitoubing.mapper;

import top.guitoubing.pojo.RemarkLovedKey;

public interface RemarkLovedMapper {
    int deleteByPrimaryKey(RemarkLovedKey key);

    int insert(RemarkLovedKey record);

    int insertSelective(RemarkLovedKey record);
}