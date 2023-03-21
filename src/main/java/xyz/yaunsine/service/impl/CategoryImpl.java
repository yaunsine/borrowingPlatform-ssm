package xyz.yaunsine.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.yaunsine.dao.TypeMapper;
import xyz.yaunsine.dao.entity.Type;
import xyz.yaunsine.service.ICategory;

import java.util.List;

@Service("category")
public class CategoryImpl implements ICategory {
    @Autowired
    private TypeMapper typeMapper;
    @Override
    public int addItem(Type type) {
        return typeMapper.insert(type);
    }

    @Override
    public List<Type> getAllType() {
        return typeMapper.selectAll();
    }
}
