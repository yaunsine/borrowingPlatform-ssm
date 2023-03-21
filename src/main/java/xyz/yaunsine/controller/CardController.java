package xyz.yaunsine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import xyz.yaunsine.dao.entity.User;
import xyz.yaunsine.service.ICardService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("cardController")
public class CardController {
    @Autowired
    @Qualifier("cardService")
    private ICardService cardService;
    @RequestMapping("addCard")
    public String getCard(HttpServletRequest request, HttpServletResponse response){
        User user = (User) request.getSession().getAttribute("user");
        int row = -1;
        if(user!=null){
            if(user.getRealname()!=null&&user.getPhone()!=null&&user.getEmail()!=null&&user.getNickname()!=null){

                row = cardService.addCard(user);
                if(row==-1){
                    DialogNotice.dialog("不可重复办理借书证",response);
                }else {
                    DialogNotice.dialog("办理成功！",response);
                }
            }else {
                DialogNotice.dialog("请完善个人信息后重试！",response);
            }

            return "redirect:/applycard";
        }else{
            DialogNotice.dialog("登录已经失效！",response);
            return "login";
        }

    }
}
