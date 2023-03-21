package xyz.yaunsine.dao;

import xyz.yaunsine.dao.entity.Type;

import java.util.List;

public interface TypeMapper {
    int deleteByPrimaryKey(Integer typeid);

    int insert(Type record);

    int insertSelective(Type record);

    Type selectByPrimaryKey(Integer typeid);

    int updateByPrimaryKeySelective(Type record);

    int updateByPrimaryKey(Type record);

    List<Type> selectAll();
}