package top.guitoubing.mapper;

import top.guitoubing.pojo.MovieTag;
import top.guitoubing.pojo.MovieTagKey;

public interface MovieTagMapper {
    int deleteByPrimaryKey(MovieTagKey key);

    int insert(MovieTag record);

    int insertSelective(MovieTag record);

    MovieTag selectByPrimaryKey(MovieTagKey key);

    int updateByPrimaryKeySelective(MovieTag record);

    int updateByPrimaryKey(MovieTag record);
}