package xyz.yaunsine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import xyz.yaunsine.dao.entity.Book;
import xyz.yaunsine.service.IBook;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/bookController")
public class BookController {
    @Autowired
    @Qualifier("bookService")
    private IBook bookService;
    @RequestMapping("/addBook")
    public String addBook(Book book, HttpSession session, @RequestParam("image") CommonsMultipartFile file){
        //得到服务器上传路径
        ServletContext application = session.getServletContext();
        String realPath = application.getRealPath("img");
        System.out.println(realPath);
        //得到上传的图片名称
        String filename = file.getOriginalFilename();
        System.out.println(filename);
        //得到扩展名
        String extendname = filename.substring(filename.lastIndexOf("."), filename.length());
        //取得唯一的uuid
        String uuid = UUID.randomUUID().toString();
        String onlyname = uuid+extendname;
        System.out.println(onlyname);
        Calendar today = Calendar.getInstance();
        int year = today.get(Calendar.YEAR);
        int month = today.get(Calendar.MONTH)+1;
        int date = today.get(Calendar.DATE);
        String now = year+"-"+month+"-"+date;
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

        try {
            book.setSubtime(df.parse(now));
            //重定向输出图片
            file.transferTo(new File(realPath,onlyname));
            //存入路径
            book.setImgurl(onlyname);
            //存入数据库
            bookService.addBook(book);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }
        System.out.println(book);
        return "addbooknotice";
    }
    @RequestMapping("/showBook")
    @ResponseBody
    public List<Book> showBook(){
        List<Book> books = bookService.findAllBook();
        return books;
    }
    @RequestMapping("/showTypeBook/{id}.html")
    public ModelAndView detail2(@PathVariable("id")int id) {
        System.out.println(id);
        List<Book> books = bookService.findBooksByTypeId(id);
        ModelAndView view = new ModelAndView("typebooksearch");
        view.addObject("booklist",books);
        for (Book book:books) {
            System.out.println(book);
        }
        return view;
    }
}
