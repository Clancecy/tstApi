package com.testyle.service;

import com.testyle.model.TaskUser;

import java.util.List;

public interface ITaskUserService {
    List<TaskUser> select(TaskUser taskUser);
    int insert(TaskUser taskUser);
    int delete(long taskID);
    int update(TaskUser taskUser);
    int insertList(List<TaskUser> taskUsers);
    long selOne(TaskUser taskUser);
    int updateList(List<TaskUser> taskUsers);
}
