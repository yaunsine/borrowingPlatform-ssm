package xyz.yaunsine.service;

import xyz.yaunsine.dao.entity.Card;
import xyz.yaunsine.dao.entity.User;

public interface ICardService {
    public int addCard(User user);
    public Card queryCard(Integer id);
}
