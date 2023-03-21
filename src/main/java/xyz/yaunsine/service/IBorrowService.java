package xyz.yaunsine.service;

import xyz.yaunsine.dao.entity.Borrow;
import xyz.yaunsine.dao.entity.MyBorrow;

import java.util.List;

public interface IBorrowService {
    int borrowbook(Integer bookid,Integer userid);
    List<MyBorrow> getMyBorrow(Integer userid);
    int ReturnBook(Integer bookid,Integer borrowid);

    List<Borrow> queryAllBorrow();
}
