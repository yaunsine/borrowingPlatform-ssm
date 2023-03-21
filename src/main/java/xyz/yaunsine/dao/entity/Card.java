package xyz.yaunsine.dao.entity;

import java.util.Date;

public class Card {
    private Integer id;

    private Integer userid;

    private String name;

    private Date stime;

    private Date etime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Date getStime() {
        return stime;
    }

    public void setStime(Date stime) {
        this.stime = stime;
    }

    public Date getEtime() {
        return etime;
    }

    public void setEtime(Date etime) {
        this.etime = etime;
    }

    @Override
    public String toString() {
        return "Card{" +
                "id=" + id +
                ", userid=" + userid +
                ", name='" + name + '\'' +
                ", stime=" + stime +
                ", etime=" + etime +
                '}';
    }
}