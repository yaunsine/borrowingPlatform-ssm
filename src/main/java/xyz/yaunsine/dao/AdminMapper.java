package xyz.yaunsine.dao;

import xyz.yaunsine.dao.entity.Admin;

public interface AdminMapper {
    int insert(Admin record);

    int insertSelective(Admin record);
//    登录
    Admin login(Admin admin);
}