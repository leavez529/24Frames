package top.guitoubing.mapper;

import top.guitoubing.pojo.MoviePic;

public interface MoviePicMapper {
    int insert(MoviePic record);

    int insertSelective(MoviePic record);
}