package com.testyle.service.impl;

import com.testyle.dao.ITagDao;
import com.testyle.model.Tag;
import com.testyle.service.ITagService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("tag")
public class TagServiceImpl implements ITagService {

    @Resource
    private ITagDao tagDao;
    @Override
    public List<Tag> select(Tag tag) {
        return tagDao.select(tag);
    }

    @Override
    public List<Tag> select(List<Long> tagIDs) {
        return tagDao.selectByList(tagIDs);
    }

    @Override
    public int insert(Tag tag) {
        return tagDao.insert(tag);
    }

    @Override
    public int delete(Tag tag) {
        return tagDao.delete(tag);
    }

    @Override
    public int update(Tag tag) {
        return tagDao.update(tag);
    }
}
