package xyz.yaunsine.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.yaunsine.dao.CardMapper;
import xyz.yaunsine.dao.entity.Borrow;
import xyz.yaunsine.dao.entity.Card;
import xyz.yaunsine.dao.entity.User;
import xyz.yaunsine.service.ICardService;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

@Service("cardService")
public class CardServiceImpl implements ICardService {
    @Autowired
    private CardMapper cardMapper;
    @Override
    public int addCard(User user) {
        Card card = new Card();
        card.setUserid(user.getUserid());
        card.setName(user.getRealname());
        //获取当前时间
        Calendar today = Calendar.getInstance();
        int year = today.get(Calendar.YEAR);
        int month = today.get(Calendar.MONTH)+1;
        int date = today.get(Calendar.DATE);
        String now = year+"-"+month+"-"+date;
        String outdate = (year+1)+"-"+month+"-"+date;
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        try {
            card.setStime(df.parse(now));
            card.setEtime(df.parse(outdate));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        int row = -1;
        Card cardByUid = cardMapper.getCardByUid(user.getUserid());
        if(cardByUid==null){
            row = cardMapper.insert(card);
        }
        return row;
    }

    @Override
    public Card queryCard(Integer id) {
        return cardMapper.selectByPrimaryKey(id);
    }
}
