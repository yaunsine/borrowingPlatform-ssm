package xyz.yaunsine.controller;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class DialogNotice {
    public static void dialog(String context, HttpServletResponse response){
        try {
            response.setContentType("text/html; charset=UTF-8"); //转码
            PrintWriter out = response.getWriter();
            out.flush();
            out.println("<script>");
            out.println("alert('"+context+"!');");
            out.println("history.back();");
            out.println("</script>");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
