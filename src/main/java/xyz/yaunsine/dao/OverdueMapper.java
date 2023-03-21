package xyz.yaunsine.dao;

import xyz.yaunsine.dao.entity.Overdue;

public interface OverdueMapper {
    int insert(Overdue record);

    int insertSelective(Overdue record);
}