package com.testyle.dao;

import com.testyle.model.TaskDan;

import java.util.List;

public interface ITaskDanDao {
    List<TaskDan> select(TaskDan taskDan);
    int insert(TaskDan taskDan);
    int delete(long taskDanID);
    int update(TaskDan taskDan);
    List<TaskDan> selectList(List<Long> taskDanIDs);
}
