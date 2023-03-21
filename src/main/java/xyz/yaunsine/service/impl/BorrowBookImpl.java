package xyz.yaunsine.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import xyz.yaunsine.dao.BookMapper;
import xyz.yaunsine.dao.BorrowMapper;
import xyz.yaunsine.dao.entity.Book;
import xyz.yaunsine.dao.entity.Borrow;
import xyz.yaunsine.dao.entity.MyBorrow;
import xyz.yaunsine.service.IBorrowService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Service("borrowService")
public class BorrowBookImpl implements IBorrowService {
    @Autowired
    private BookMapper bookMapper;
    @Autowired
    private BorrowMapper borrowMapper;
    @Override
    public int borrowbook(Integer bookid,Integer userid) {
        Book book = bookMapper.selectByPrimaryKey(bookid);
        int row = -1;
        if(book.getCounts()>0){
            bookMapper.updateCountsMinus(bookid);
            Borrow borrow = new Borrow();
            borrow.setBookid(bookid);
            borrow.setUserid(userid);
            //获取当前时间
            Calendar today = Calendar.getInstance();
            int year = today.get(Calendar.YEAR);
            int month = today.get(Calendar.MONTH)+1;
            int date = today.get(Calendar.DATE);
            String now = year+"-"+month+"-"+date;
            String outdate = year+"-"+(month+1)+"-"+date;
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            try {
                borrow.setStarttime(df.parse(now));
                borrow.setEndtime(df.parse(outdate));
                borrow.setStat(1);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            row = borrowMapper.insert(borrow);
        }else {
            row = 0;
        }
        return row;
    }

    @Override
    public List<MyBorrow> getMyBorrow(Integer userid) {
        List<Borrow> borrows = borrowMapper.selectByUserid(userid);
        List<MyBorrow> myBorrows = new ArrayList<>();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        if(borrows!=null){
            for(Borrow borrow:borrows){
                MyBorrow myBorrow = new MyBorrow();
                myBorrow.setStarttime(df.format(borrow.getStarttime()));
                myBorrow.setEndtime(df.format(borrow.getEndtime()));
                myBorrow.setBorrowid(borrow.getId());
                myBorrow.setStat(borrow.getStat());
                myBorrow.setUserid(borrow.getUserid());
                Integer bookid = borrow.getBookid();
                Book book = bookMapper.selectByPrimaryKey(borrow.getBookid());
                myBorrow.setBookname(book.getBookname());
                myBorrow.setIsbn(book.getIsbn());
                myBorrow.setImgurl(book.getImgurl());
                myBorrow.setAuthor(book.getAuthor());
                myBorrow.setTypeid(book.getTypeid());
                myBorrow.setPublisher(book.getPublisher());
                myBorrow.setBookid(bookid);
                myBorrows.add(myBorrow);
            }

        }

        return myBorrows;
    }

    @Override
    public int ReturnBook(Integer bookid, Integer borrowid) {
        int row = -1;
//        row = bookMapper.updateCountsAdd(bookid);
        row = borrowMapper.updateStatReturn(borrowid);
        return row;
    }

    @Override
    public List<Borrow> queryAllBorrow() {
        return borrowMapper.selectAll();
    }


}
