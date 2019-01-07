package com.testyle.service;

import com.testyle.model.TaskFile;

import java.util.List;

public interface ITaskFileService {
    List<TaskFile> select(TaskFile taskFile);
    int insert(TaskFile taskFile);
    int insert(List<TaskFile> taskFileList);
    int update(TaskFile taskFile);
    int delete(TaskFile taskFile);
}
