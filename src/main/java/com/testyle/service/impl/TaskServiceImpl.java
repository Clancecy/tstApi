package com.testyle.service.impl;

import com.testyle.dao.ITaskDao;
import com.testyle.dao.ITestDao;
import com.testyle.model.Data;
import com.testyle.model.Task;
import com.testyle.model.Test;
import com.testyle.service.ITaskService;
import com.testyle.service.ITestService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;


@Service("taskService")
public class TaskServiceImpl implements ITaskService {

    @Resource
    private ITaskDao taskDao;

    @Override
    public List<Task> select(Task task) {
        return taskDao.select(task);
    }

    @Override
    public int insert(Task task) {
        return taskDao.insert(task);
    }

    @Override
    public int delete(long taskID) {
        return taskDao.delete(taskID);
    }

    @Override
    public int update(Task task) {
        return taskDao.update(task);
    }

    @Override
    public List<Task> selectList(List<Long> taskIDs) {
        return taskDao.selectList(taskIDs);
    }

    @Override
    public long getCount(Task task) {
        return taskDao.getCount(task);
    }

    @Override
    public Task select(long taskID) {
        return taskDao.selectByID(taskID);
    }

    @Override
    public List<Task> select(List<Long> taskIDs, Date atime, Date btime) {
        return taskDao.selectByMap(taskIDs,atime,btime);
    }
}
