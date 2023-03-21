package xyz.yaunsine.dao;

import xyz.yaunsine.dao.entity.Card;

public interface CardMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Card record);

    int insertSelective(Card record);

    Card selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Card record);

    int updateByPrimaryKey(Card record);

    Card getCardByUid(Integer userid);
}