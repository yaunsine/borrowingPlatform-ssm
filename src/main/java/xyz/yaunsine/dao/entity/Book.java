package xyz.yaunsine.dao.entity;

import java.util.Date;

public class Book {
    private Integer bookid;

    private String bookname;

    private String author;

    private String isbn;

    private Integer typeid;

    private String imgurl;

    private String publisher;

    private Date subtime;

    private Integer counts;

    public Integer getBookid() {
        return bookid;
    }

    public void setBookid(Integer bookid) {
        this.bookid = bookid;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname == null ? null : bookname.trim();
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn == null ? null : isbn.trim();
    }

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl == null ? null : imgurl.trim();
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher == null ? null : publisher.trim();
    }

    public Date getSubtime() {
        return subtime;
    }

    public void setSubtime(Date subtime) {
        this.subtime = subtime;
    }

    public void setCounts(Integer counts) {
        this.counts = counts;
    }

    public Integer getCounts() {
        return counts;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bookid=" + bookid +
                ", bookname='" + bookname + '\'' +
                ", author='" + author + '\'' +
                ", isbn='" + isbn + '\'' +
                ", typeid=" + typeid +
                ", imgurl='" + imgurl + '\'' +
                ", publisher='" + publisher + '\'' +
                ", subtime=" + subtime +
                ", counts=" + counts +
                '}';
    }
}