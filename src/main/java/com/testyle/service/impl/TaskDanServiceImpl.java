package com.testyle.service.impl;

import com.testyle.dao.ITaskDanDao;
import com.testyle.model.TaskDan;
import com.testyle.service.ITaskDanService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("taskDanService")
public class TaskDanServiceImpl implements ITaskDanService {

    @Resource
    private ITaskDanDao taskDanDao;

    @Override
    public List<TaskDan> select(TaskDan taskDan) {
        return taskDanDao.select(taskDan);
    }

    @Override
    public int insert(TaskDan taskDan) {
        return taskDanDao.insert(taskDan);
    }

    @Override
    public int delete(long planID) {
        return taskDanDao.delete(planID);
    }

    @Override
    public int update(TaskDan taskDan) {
        return taskDanDao.update(taskDan);
    }

    @Override
    public List<TaskDan> selectList(List<Long> planIDs) {
        return taskDanDao.selectList(planIDs);
    }
}
