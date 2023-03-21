package xyz.yaunsine.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import xyz.yaunsine.dao.*;
import xyz.yaunsine.dao.entity.Admin;
import xyz.yaunsine.dao.entity.Card;
import xyz.yaunsine.dao.entity.User;
import xyz.yaunsine.service.IAdminService;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@Service("adminService")
public class AdminServiceImpl implements IAdminService {
    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private CardMapper cardMapper;

    @Autowired
    private BorrowMapper borrowMapper;

    @Autowired
    private BookMapper bookMapper;

    @Override
    public Admin login(Admin admin) {
        return adminMapper.login(admin);
    }

    @Override
    public int addReader(User user) {
        int row = -1;
        //增加用户
        row = userMapper.insert(user);
        //查询id
        int userid = userMapper.selectUserid(user);
        Card card = new Card();
        Calendar today = Calendar.getInstance();
        int year = today.get(Calendar.YEAR);
        int month = today.get(Calendar.MONTH)+1;
        int date = today.get(Calendar.DATE);
        String now = year+"-"+month+"-"+date;
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

        try {
            //设置开始时间
            card.setStime(df.parse(now));
            //设置到期时间
            if(month>11){
                year++;
                month = 1;
            }else{
                month++;
            }
            Date endDate = df.parse(year+"-"+month+"-"+date);
            card.setEtime(endDate);
            card.setName(user.getRealname());
            card.setUserid(userid);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        System.out.println(card);
        int addresult = -1;
        addresult = cardMapper.insert(card);
        return addresult;
    }

    @Override
    public int confirmReturnBook(Integer bookid,Integer borrowid) {
        int row = -1;
        row = bookMapper.updateCountsAdd(bookid);
        row = borrowMapper.updateStatConfirmReturn(borrowid);
        return row;
    }

    @Override
    public int deleteReturnBookById(Integer id) {
        return borrowMapper.deleteById(id);
    }

}
