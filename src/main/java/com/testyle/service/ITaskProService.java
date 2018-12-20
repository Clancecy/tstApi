package com.testyle.service;

import com.testyle.model.TaskPro;

import java.util.List;

public interface ITaskProService {
    List<TaskPro> select(TaskPro taskPro);
    int insert(TaskPro taskPro);
    int delete(long taskID);
    int update(TaskPro taskPro);
    int insertList(List<TaskPro> taskPros);
    long selOne(TaskPro taskPro);
    int updateList(List<TaskPro> taskPros);
}
