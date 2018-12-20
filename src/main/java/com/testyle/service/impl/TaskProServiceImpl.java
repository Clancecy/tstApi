package com.testyle.service.impl;

import com.testyle.dao.ITaskProDao;
import com.testyle.dao.ITestUserDao;
import com.testyle.model.TaskPro;
import com.testyle.model.TestUser;
import com.testyle.service.ITaskProService;
import com.testyle.service.ITestUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("taskProService")
public class TaskProServiceImpl implements ITaskProService {

    @Resource
    private ITaskProDao taskProDao;

    @Override
    public List<TaskPro> select(TaskPro taskPro) {
        return taskProDao.select(taskPro);
    }

    @Override
    public int insert(TaskPro taskPro) {
        return taskProDao.insert(taskPro);
    }

    @Override
    public int delete(long taskID) {
        return taskProDao.delete(taskID);
    }

    @Override
    public int update(TaskPro taskPro) {
        return taskProDao.update(taskPro);
    }

    @Override
    public int insertList(List<TaskPro> taskPros) {
        return taskProDao.insertList(taskPros);
    }

    @Override
    public long selOne(TaskPro taskPro) {
        return taskProDao.selOne(taskPro);
    }

    @Override
    public int updateList(List<TaskPro> taskPros) {
        return taskProDao.updateList(taskPros);
    }
}
