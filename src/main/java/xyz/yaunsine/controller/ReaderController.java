package xyz.yaunsine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import xyz.yaunsine.dao.entity.Borrower;
import xyz.yaunsine.dao.entity.Card;
import xyz.yaunsine.dao.entity.User;
import xyz.yaunsine.service.IReader;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/readerController")
public class ReaderController {
    @Autowired
    @Qualifier("readerService")
    private IReader reader;
    @RequestMapping("/show")
    @ResponseBody
    public List<Borrower> show(){
        System.out.println("查询读者信息==");
        List<Borrower> borrowers = reader.showReader();
        return borrowers;
    }
    @RequestMapping("/register")
    public String register(User user,HttpServletRequest request, HttpServletResponse response){
        user.setNickname("爱读书的小伙计");
        int row = reader.register(user);
        if(row != -1){
            dialog("注册成功",response);
        }else {
            dialog("手机号已被注册",response);
        }

        return "redirect:/login";
    }
    @RequestMapping("/toapply")
    public ModelAndView toapply(HttpServletRequest request, HttpServletResponse response){
        User user = (User) request.getSession().getAttribute("user");
        if(user == null){
            System.out.println("未登陆");
            return new ModelAndView("login");
        }else {
            ModelAndView view = new ModelAndView("applycard");
            view.addObject("user",user);
            return view;
        }
    }
    @RequestMapping("/tomyinfo")
    public ModelAndView tomyinfo(HttpServletRequest request, HttpServletResponse response){
        User user = (User) request.getSession().getAttribute("user");
        if(user == null){
            System.out.println("未登陆");
            return new ModelAndView("login");
        }else {
            ModelAndView view = new ModelAndView("myinfo");
            view.addObject("user",user);
            return view;
        }
    }
    @RequestMapping("/updateinfo")
    public String updateinfo(User user,HttpServletRequest request,HttpServletResponse response){
        int row = -1;
        User user_request = (User) request.getSession().getAttribute("user");
        user.setUserid(user_request.getUserid());
        row = reader.updateMyInfo(user);
        if(row == 1){
            dialog("修改成功",response);
            User loginuser = reader.login(user_request);
            request.getSession().setAttribute("user",loginuser);
            return "redirect:/view/myinfo.jsp";
        }else {
            dialog("修改失败",response);
            return "myinfo";
        }
    }
    public void dialog(String context,HttpServletResponse response){
        try {

            response.setContentType("text/html; charset=UTF-8"); //转码
            PrintWriter out = response.getWriter();
            out.flush();
            out.println("<script>");
            out.println("alert('"+context+"!');");
            out.println("history.go(-1);");
//            out.println("window.location.href= '/view/myinfo.jsp'");
            out.println("</script>");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public String islogin(String targetPath,HttpServletRequest request, HttpServletResponse response){
        User user = (User) request.getSession().getAttribute("user");
        if(user == null){
            System.out.println("未登陆");
            return "login";
        }else {
            System.out.println(targetPath);
            return targetPath;
        }
    }
    @RequestMapping("/exit")
    public String exit(HttpServletRequest request){
        request.getSession().setAttribute("user",null);
        return "redirect:/view/login.jsp";
    }
}
