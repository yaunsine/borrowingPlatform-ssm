package xyz.yaunsine.dao;

import xyz.yaunsine.dao.entity.Borrow;

import java.util.List;

public interface BorrowMapper {
    int insert(Borrow record);

    int insertSelective(Borrow record);

    List<Borrow> selectByUserid(Integer userid);

    int updateStatReturn(Integer id);

    List<Borrow> selectAll();

    int updateStatConfirmReturn(Integer borrowid);

    int deleteById(Integer id);
}