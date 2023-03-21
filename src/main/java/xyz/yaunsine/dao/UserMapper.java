package xyz.yaunsine.dao;

import xyz.yaunsine.dao.entity.User;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    int selectUserid(User user);

    List<User> getAllUser();

    User getUserByPhone(String phone);
    //登陆查询
    User selectUserByUser(User user);
    //修改用户信息
    int updateUserByUser(User user);
}