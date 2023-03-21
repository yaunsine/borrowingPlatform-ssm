package xyz.yaunsine.service;

import xyz.yaunsine.dao.entity.Borrower;
import xyz.yaunsine.dao.entity.User;

import java.util.List;

public interface IReader {
    public List<Borrower> showReader();
    public int register(User user);
    public User login(User user);
    public int updateMyInfo(User user);
}
