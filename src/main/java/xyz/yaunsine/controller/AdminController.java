package xyz.yaunsine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import xyz.yaunsine.dao.entity.*;
import xyz.yaunsine.service.IAdminService;
import xyz.yaunsine.service.IReader;
import xyz.yaunsine.service.impl.BorrowBookImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/adminController")
public class AdminController {
    @Autowired
    @Qualifier("adminService")
    private IAdminService adminService;
    @Autowired
    @Qualifier("readerService")
    private IReader readerService;
    @Autowired
    @Qualifier("borrowService")
    private BorrowBookImpl borrowService;
    @RequestMapping("/login")
    public String login(String phone,String password, String sf, HttpSession session, HttpServletResponse response){
//        System.out.println(admin);

            if("管理员".equals(sf)){
                Admin admin = new Admin();
                admin.setPhone(phone);
                admin.setPassword(password);
                Admin ad = adminService.login(admin);
                if(ad != null){
                    System.out.println("管理员身份--");
                    session.setAttribute("admin",ad);
                    return "/main";
                }
                else {
                    DialogNotice.dialog("管理员账号不存在",response);
                    return "/login";
                }
            }else if("普通用户".equals(sf)){
                User user = new User();
                user.setPhone(phone);
                user.setPassword(password);
                User loginuser = readerService.login(user);
                if(loginuser == null){
                    DialogNotice.dialog("用户不存在",response);
                    return "/login";
                }else {
                    System.out.println("普通用户身份--");
                    session.setAttribute("user",loginuser);
                    return "redirect:/index.jsp";
                }

            }else {
                System.out.println("未选择用户--");
                return "/login";
            }

    }
    @RequestMapping("/addReader")
    public String addreader(User user){
        if("male".equals(user.getGender())){
            user.setGender("男");
        }else{
            user.setGender("女");
        }
        user.setNickname("爱读书的小伙计");
        adminService.addReader(user);
        return "addreader";
    }
    @RequestMapping("/RentedBook")
    public ModelAndView getMyRented(HttpServletRequest request, HttpServletResponse response){
        User user = (User) request.getSession().getAttribute("user");
        List<Borrow> borrows = borrowService.queryAllBorrow();
        ModelAndView view = new ModelAndView("rentedbook");
        List<MyBorrow> borrowList =  new ArrayList<>();
        List<Borrower> users = readerService.showReader();

        for(Borrower borrowuser:users){
            List<MyBorrow> myBorrow = borrowService.getMyBorrow(borrowuser.getUserid());
            for(MyBorrow borrowitem:myBorrow){
                borrowitem.setRealname(borrowuser.getRealname());
                String endtime = borrowitem.getEndtime();
                DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    Date etime = df.parse(endtime);
                    Date now = new Date();
                    if(borrowitem.getStat()!=3&&now.getTime()>etime.getTime()){
                        long overdue = (now.getTime() - etime.getTime())/(1000*3600*24);
                        System.out.println(overdue+"days");
                        borrowitem.setOverduefine(overdue*0.1F);
                    }else {
                        borrowitem.setOverduefine(0F);
                    }
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }
            borrowList.addAll(myBorrow);
        }

        view.addObject("borrowList",borrowList);
        return view;
    }
    @RequestMapping("/comfirmReturnBook")
    public String comfirmReturnBook(HttpServletRequest request, HttpServletResponse response){

        System.out.println("确认归还图书");
        Integer bookid = Integer.parseInt(request.getParameter("bookid"));
        Integer borrowid = Integer.parseInt(request.getParameter("borrowid"));
        adminService.confirmReturnBook(bookid, borrowid);
        back(response);
        return "rentedbook";
    }
    public void back(HttpServletResponse response){
        try {
            response.setContentType("text/html; charset=UTF-8"); //转码
            PrintWriter out = response.getWriter();
            out.flush();
            out.println("<script>");
            out.println("history.back();");
            out.println("</script>");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/overDueRentingBook")
    public ModelAndView overDueRentingBook(HttpServletRequest request, HttpServletResponse response){
        User user = (User) request.getSession().getAttribute("user");
        List<Borrow> borrows = borrowService.queryAllBorrow();
        ModelAndView view = new ModelAndView("overdue");
        List<MyBorrow> borrowList =  new ArrayList<>();
        List<Borrower> users = readerService.showReader();

        for(Borrower borrowuser:users){
            List<MyBorrow> myBorrow = borrowService.getMyBorrow(borrowuser.getUserid());
            for(MyBorrow borrowitem:myBorrow){
                borrowitem.setRealname(borrowuser.getRealname());
                String endtime = borrowitem.getEndtime();
                DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    Date etime = df.parse(endtime);
                    Date now = new Date();
                    if(borrowitem.getStat()!=3&&now.getTime()>etime.getTime()){
                        long overdue = (now.getTime() - etime.getTime())/(1000*3600*24);
                        System.out.println(overdue+"days");
                        borrowitem.setOverduefine(overdue*0.1F);
                    }else {
                        borrowitem.setOverduefine(0F);
                    }
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }
            borrowList.addAll(myBorrow);
        }

        view.addObject("borrowList",borrowList);
        return view;
    }
    @RequestMapping("returnHistory")
    public ModelAndView returnHistory(HttpServletRequest request, HttpServletResponse response){
        User user = (User) request.getSession().getAttribute("user");
        List<Borrow> borrows = borrowService.queryAllBorrow();
        ModelAndView view = new ModelAndView("beforefine");
        List<MyBorrow> borrowList =  new ArrayList<>();
        List<Borrower> users = readerService.showReader();

        for(Borrower borrowuser:users){
            List<MyBorrow> myBorrow = borrowService.getMyBorrow(borrowuser.getUserid());
            for(MyBorrow borrowitem:myBorrow){
                borrowitem.setRealname(borrowuser.getRealname());
                String endtime = borrowitem.getEndtime();
                DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    Date etime = df.parse(endtime);
                    Date now = new Date();
                    if(borrowitem.getStat()!=3&&now.getTime()>etime.getTime()){
                        long overdue = (now.getTime() - etime.getTime())/(1000*3600*24);
                        System.out.println(overdue+"days");
                        borrowitem.setOverduefine(overdue*0.1F);
                    }else {
                        borrowitem.setOverduefine(0F);
                    }
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }
            borrowList.addAll(myBorrow);
        }

        view.addObject("borrowList",borrowList);
        return view;
    }
    @RequestMapping("/deleteHistory")
    public String deleteHistory(HttpServletRequest request,HttpServletResponse response){
        Integer borrowid = Integer.valueOf(request.getParameter("id"));
        adminService.deleteReturnBookById(borrowid);
        back(response);
        return "beforefine";
    }
    @RequestMapping("/exitM")
    public String exitM(HttpSession session,HttpServletResponse response){
        // 销毁session
        session.invalidate();
        response.setContentType("text/html; charset=UTF-8"); //转码
        PrintWriter out = null;
        try {
            out = response.getWriter();
            out.print("<script>window.parent.location.href='../view/login.jsp';</script>");
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "redirect:/view/login.jsp";
    }
}
