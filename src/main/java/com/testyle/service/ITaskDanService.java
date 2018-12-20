package com.testyle.service;

import com.testyle.model.TaskDan;

import java.util.List;

public interface ITaskDanService {
    List<TaskDan> select(TaskDan taskDan);
    int insert(TaskDan taskDan);
    int delete(long taskDanID);
    int update(TaskDan taskDan);
    List<TaskDan> selectList(List<Long> taskDanIDs);
}
