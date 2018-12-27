package com.testyle.dao;

import com.testyle.model.Tag;

import java.util.List;

public interface ITagDao {
    List<Tag> select(Tag tag);
    List<Tag> select(List<Long> tagIDs);
    int insert(Tag tag);
    int delete(Tag tag);
    int update(Tag tag);
}
