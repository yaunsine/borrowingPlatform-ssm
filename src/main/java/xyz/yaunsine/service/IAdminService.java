package xyz.yaunsine.service;

import xyz.yaunsine.dao.entity.Admin;
import xyz.yaunsine.dao.entity.User;

public interface IAdminService {
    public Admin login(Admin admin);

    //添加图书证
    public int addReader(User user);
    //确认归还图书
    int confirmReturnBook(Integer bookid,Integer borrowid);

    int deleteReturnBookById(Integer id);
}
