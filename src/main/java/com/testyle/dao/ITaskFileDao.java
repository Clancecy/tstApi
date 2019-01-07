package com.testyle.dao;

import com.testyle.model.TaskFile;

import java.util.List;

public interface ITaskFileDao {
    List<TaskFile> select(TaskFile taskFile);
    int insert(TaskFile taskFile);
    int insertList(List<TaskFile> taskFileList);
    int update(TaskFile taskFile);
    int delete(TaskFile taskFile);
}
