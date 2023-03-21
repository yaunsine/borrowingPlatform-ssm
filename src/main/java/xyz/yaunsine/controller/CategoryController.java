package xyz.yaunsine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import xyz.yaunsine.dao.BookMapper;
import xyz.yaunsine.dao.entity.Type;
import xyz.yaunsine.dao.entity.TypeBook;
import xyz.yaunsine.service.IBook;
import xyz.yaunsine.service.ICategory;

import java.util.List;

@Controller
@RequestMapping("/categoryController")
public class CategoryController {
    @Autowired
    @Qualifier("bookService")
    private IBook bookService;
    @Autowired
    @Qualifier("category")
    private ICategory category;
    @RequestMapping("/addItem")
    public String addItem(Type type){
        System.out.println("增加图书类型----");
        category.addItem(type);
        return "addbooktype";
    }
    @RequestMapping("/getType")
    @ResponseBody
    public List<Type> getType(){
        List<Type> allType = category.getAllType();
        return allType;
    }
    @RequestMapping("/getTypeBookCounts")
    @ResponseBody
    public List<TypeBook> getTypeBookCounts(){
        List<Type> types = category.getAllType();

        return bookService.getByTypeid(types);
    }
}
