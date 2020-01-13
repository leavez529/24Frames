package top.guitoubing.mapper;

import java.math.BigDecimal;
import java.util.List;

import top.guitoubing.pojo.User;

public interface UserMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(BigDecimal id);

    User selectByTel(String tel);

    BigDecimal selectMaxId();

    List<BigDecimal> selectByLovedMoment(BigDecimal id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    int countFollower(BigDecimal id);

    int countFollowed(BigDecimal id);

    List<User> selectFollower(BigDecimal id);

    List<User> selectFollowed(BigDecimal id);

}