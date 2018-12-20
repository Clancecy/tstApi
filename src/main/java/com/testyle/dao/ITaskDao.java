package com.testyle.dao;

import com.testyle.model.Task;

import java.util.List;

public interface ITaskDao {
    List<Task> select(Task task);
    int insert(Task task);
    int delete(long taskID);
    int update(Task task);
    List<Task> selectList(List<Long>taskIDs);
}
