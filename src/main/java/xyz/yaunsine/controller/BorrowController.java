package xyz.yaunsine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import xyz.yaunsine.dao.entity.Card;
import xyz.yaunsine.dao.entity.MyBorrow;
import xyz.yaunsine.dao.entity.User;
import xyz.yaunsine.service.IBorrowService;
import xyz.yaunsine.service.ICardService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/borrowController")
public class BorrowController {
    @Autowired
    @Qualifier("borrowService")
    private IBorrowService borrowService;

    @Autowired
    @Qualifier("cardService")
    private ICardService cardService;

    @RequestMapping("/rentbook")
    public String rentbook(HttpServletRequest request, HttpServletResponse response){
        System.out.println("借阅图书");
        User user = (User) request.getSession().getAttribute("user");
        if(user == null){

//            DialogNotice.dialog("未登陆，点击确定为您跳转登录页面……",response);
            System.out.println("未登陆");
            return "redirect:/view/login.jsp";
        }else {
            Card card = cardService.queryCard(user.getUserid());
            if(card!=null){
                System.out.println("借阅图书");
                Integer bookid = Integer.parseInt(request.getParameter("bookid"));
                System.out.println(bookid);

                int row = borrowService.borrowbook(bookid, user.getUserid());
                if(row==1){
                    DialogNotice.dialog("借阅成功",response);
                }else if(row == 0){
                    DialogNotice.dialog("该图书已被借光！请借阅其他书籍",response);
                }
                return "redirect:/index.jsp";
            }else {
                DialogNotice.dialog("请办理借书证！",response);
                return "redirect:/index.jsp";
            }

        }
    }
    @RequestMapping("/getMyRented")
    public ModelAndView getMyRented(HttpServletRequest request, HttpServletResponse response){
        User user = (User) request.getSession().getAttribute("user");
        if(user == null){
            System.out.println("未登陆");
            return new ModelAndView("redirect:/view/login.jsp");
        }else {
            ModelAndView view = new ModelAndView("myrented");
            List<MyBorrow> myBorrow = borrowService.getMyBorrow(user.getUserid());
            view.addObject("myBorrow",myBorrow);
            return view;
        }
    }
    @RequestMapping("/returnBook")
    public void returnBook(HttpServletResponse response, HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        if(user == null){
            DialogNotice.dialog("账号登录已经失效",response);
        }else {
            Integer bookid = Integer.valueOf(request.getParameter("bookid"));
            Integer borrowid = Integer.valueOf(request.getParameter("borrowid"));
            int row = borrowService.ReturnBook(bookid, borrowid);
            DialogNotice.dialog("已提交还书申请",response);
        }

    }
}
