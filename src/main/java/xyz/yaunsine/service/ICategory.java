package xyz.yaunsine.service;

import xyz.yaunsine.dao.entity.Type;

import java.util.List;

public interface ICategory {
    int addItem(Type type);

    List<Type> getAllType();
}
