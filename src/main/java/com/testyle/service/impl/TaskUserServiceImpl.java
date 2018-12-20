package com.testyle.service.impl;

import com.testyle.dao.ITaskUserDao;
import com.testyle.model.TaskUser;
import com.testyle.service.ITaskUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("taskUserService")
public class TaskUserServiceImpl implements ITaskUserService {

    @Resource
    private ITaskUserDao taskUserDao;

    @Override
    public List<TaskUser> select(TaskUser taskUser) {
        return taskUserDao.select(taskUser);
    }

    @Override
    public int insert(TaskUser taskUser) {
        return taskUserDao.insert(taskUser);
    }

    @Override
    public int delete(long taskID) {
        return taskUserDao.delete(taskID);
    }

    @Override
    public int update(TaskUser taskUser) {
        return taskUserDao.update(taskUser);
    }

    @Override
    public int insertList(List<TaskUser> taskUsers) {
        return taskUserDao.insertList(taskUsers);
    }

    @Override
    public long selOne(TaskUser taskUser) {
        return taskUserDao.selOne(taskUser);
    }

    @Override
    public int updateList(List<TaskUser> taskUsers) {
        return taskUserDao.updateList(taskUsers);
    }
}
