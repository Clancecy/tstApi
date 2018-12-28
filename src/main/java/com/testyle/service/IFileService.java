package com.testyle.service;

import com.testyle.model.File;

import java.util.List;

public interface IFileService {
    List<File> select(File file);
    int insert(File file);
    int insert(List<File> fileList);
    int update(File file);
    int delete(File file);
}
