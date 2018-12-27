package com.testyle.service;

import com.testyle.model.Tag;

import java.util.List;

public interface ITagService {
    List<Tag> select(Tag tag);
    List<Tag> select(List<Long> tagIDs);
    int insert(Tag tag);
    int delete(Tag tag);
    int update(Tag tag);
}
