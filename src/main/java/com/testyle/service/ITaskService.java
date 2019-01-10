package com.testyle.service;

import com.testyle.model.Task;

import java.util.List;

public interface ITaskService {
    List<Task> select(Task task);
    int insert(Task task);
    int delete(long taskID);
    int update(Task task);
    List<Task> selectList(List<Long>taskIDs);
    long getCount(Task task);
    Task select(long taskID);
}
