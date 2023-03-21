package xyz.yaunsine.dao.entity;

public class TypeBook {
    private Integer bookcounts;
    private Integer typeid;

    public Integer getBookcounts() {
        return bookcounts;
    }

    public void setBookcounts(Integer bookcounts) {
        this.bookcounts = bookcounts;
    }

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    @Override
    public String toString() {
        return "TypeBook{" +
                "bookcounts=" + bookcounts +
                ", typeid=" + typeid +
                '}';
    }
}
