package xyz.yaunsine.service;

import org.springframework.stereotype.Service;
import xyz.yaunsine.dao.entity.Book;
import xyz.yaunsine.dao.entity.Type;
import xyz.yaunsine.dao.entity.TypeBook;

import java.util.List;

public interface IBook {
    int addBook(Book book);
    List<Book> findAllBook();
    List<TypeBook> getByTypeid(List<Type> types);
    List<Book> findBooksByTypeId(Integer typeid);
}
