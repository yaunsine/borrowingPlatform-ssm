package xyz.yaunsine.dao;

import xyz.yaunsine.dao.entity.Book;

import java.util.List;

public interface BookMapper {
    int deleteByPrimaryKey(Integer bookid);

    int insert(Book record);

    int insertSelective(Book record);

    Book selectByPrimaryKey(Integer bookid);

    int updateByPrimaryKeySelective(Book record);

    int updateByPrimaryKey(Book record);

    List<Book> selectAll();

    int selectCountById(Integer typeid);

    List<Book> selectByTypeid(Integer typeid);

    int updateCountsMinus(Integer bookid);

    int updateCountsAdd(Integer bookid);
}