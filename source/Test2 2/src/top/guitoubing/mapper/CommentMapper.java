package top.guitoubing.mapper;

import java.math.BigDecimal;
import java.util.List;

import top.guitoubing.pojo.Comment;

public interface CommentMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(Comment record);

    int insertSelective(Comment record);

    Comment selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);

    BigDecimal getMaxId();

    List<Comment> selectByMomentId(BigDecimal id);
}