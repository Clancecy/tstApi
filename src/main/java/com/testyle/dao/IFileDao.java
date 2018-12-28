package com.testyle.dao;

import com.testyle.model.File;

import java.util.List;

public interface IFileDao {
    List<File> select(File file);
    int insert(File file);
    int insertList(List<File> fileList);
    int update(File file);
    int delete(File file);
}
