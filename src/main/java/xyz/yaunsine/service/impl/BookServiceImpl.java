package xyz.yaunsine.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.yaunsine.dao.BookMapper;
import xyz.yaunsine.dao.entity.Book;
import xyz.yaunsine.dao.entity.Type;
import xyz.yaunsine.dao.entity.TypeBook;
import xyz.yaunsine.service.IBook;

import java.util.ArrayList;
import java.util.List;

@Service("bookService")
public class BookServiceImpl implements IBook {
    @Autowired
    private BookMapper bookMapper;
    @Override
    public int addBook(Book book) {
        int row = -1;
        row = bookMapper.insert(book);
        return row;
    }

    @Override
    public List<Book> findAllBook() {
        List<Book> books = bookMapper.selectAll();
        return books;
    }

    @Override
    public List<TypeBook> getByTypeid(List<Type> types) {
        List<TypeBook> typeBooks = new ArrayList<>();
        for (Type type:types){
            Integer typeid = type.getTypeid();
            int count = bookMapper.selectCountById(typeid);
            TypeBook typeBook = new TypeBook();
            typeBook.setTypeid(typeid);
            typeBook.setBookcounts(count);
            typeBooks.add(typeBook);
        }
        return typeBooks;
    }

    @Override
    public List<Book> findBooksByTypeId(Integer typeid) {
        return bookMapper.selectByTypeid(typeid);
    }

}
