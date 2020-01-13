package top.guitoubing.mapper;

import top.guitoubing.pojo.Detail;

public interface DetailMapper {
    int deleteByPrimaryKey(Long movieId);

    int insert(Detail record);

    int insertSelective(Detail record);

    Detail selectByPrimaryKey(Long movieId);

    int updateByPrimaryKeySelective(Detail record);

    int updateByPrimaryKey(Detail record);
}