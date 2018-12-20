package com.testyle.dao;

import com.testyle.model.TaskPro;

import java.util.List;

public interface ITaskProDao {
    List<TaskPro> select(TaskPro taskPro);
    int insert(TaskPro taskPro);
    int delete(long taskID);
    int update(TaskPro taskPro);
    int insertList(List<TaskPro> taskPros);
    long selOne(TaskPro taskPro);
    int updateList(List<TaskPro> taskPros);
}
