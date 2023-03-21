package xyz.yaunsine.dao.entity;

import java.util.Date;

public class MyBorrow {
    private Integer borrowid;

    private Integer bookid;

    private String bookname;

    private String author;

    private String isbn;

    private Integer typeid;

    private String imgurl;

    private String publisher;

    private String starttime;

    private String endtime;

    private Integer stat;

    private String realname;

    private Integer userid;

    private Float overduefine;

    public Integer getBorrowid() {
        return borrowid;
    }

    public void setBorrowid(Integer borrowid) {
        this.borrowid = borrowid;
    }

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
        this.bookname = bookname;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
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
        this.imgurl = imgurl;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public void setStat(Integer stat) {
        this.stat = stat;
    }

    public Integer getStat() {
        return stat;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getRealname() {
        return realname;
    }

    public void setOverduefine(Float overduefine) {
        this.overduefine = overduefine;
    }

    public Float getOverduefine() {
        return overduefine;
    }

    @Override
    public String toString() {
        return "MyBorrow{" +
                "borrowid=" + borrowid +
                ", bookid=" + bookid +
                ", bookname='" + bookname + '\'' +
                ", author='" + author + '\'' +
                ", isbn='" + isbn + '\'' +
                ", typeid=" + typeid +
                ", imgurl='" + imgurl + '\'' +
                ", publisher='" + publisher + '\'' +
                ", starttime=" + starttime +
                ", endtime=" + endtime +
                '}';
    }
}
