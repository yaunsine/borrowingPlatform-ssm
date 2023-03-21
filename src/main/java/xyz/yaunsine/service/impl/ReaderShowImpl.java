package xyz.yaunsine.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.yaunsine.dao.CardMapper;
import xyz.yaunsine.dao.UserMapper;
import xyz.yaunsine.dao.entity.Borrow;
import xyz.yaunsine.dao.entity.Borrower;
import xyz.yaunsine.dao.entity.Card;
import xyz.yaunsine.dao.entity.User;
import xyz.yaunsine.service.IReader;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service("readerService")
public class ReaderShowImpl implements IReader {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private CardMapper cardMapper;
    @Override
    public List<Borrower> showReader() {
        List<User> allUser = userMapper.getAllUser();
        List<Borrower> blist = new ArrayList<>();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        for(User user:allUser){
            Borrower borrower = new Borrower();
            Integer userid = user.getUserid();
            Card card = cardMapper.getCardByUid(userid);
            borrower.setNickname(user.getNickname());
            borrower.setRealname(user.getRealname());
            borrower.setGender(user.getGender());
            borrower.setEmail(user.getEmail());
            borrower.setUserid(user.getUserid());
            borrower.setPhone(user.getPhone());
            if(card!=null){
                borrower.setStime(df.format(card.getStime()));
                borrower.setEtime(df.format(card.getEtime()));
            }

            blist.add(borrower);
        }
        return blist;
    }

    @Override
    public int register(User user) {
            int row = -1;
        User userByPhone = userMapper.getUserByPhone(user.getPhone());
        if(userByPhone==null){
            //增加用户
            row = userMapper.insert(user);
        }
        return row;
    }

    @Override
    public User login(User user) {
        return userMapper.selectUserByUser(user);
    }

    @Override
    public int updateMyInfo(User user) {
        return userMapper.updateUserByUser(user);
    }
}
