package com.testyle.service.impl;

import com.testyle.dao.ITaskFileDao;
import com.testyle.model.TaskFile;
import com.testyle.service.ITaskFileService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("taskFile")
public class TaskFileServiceImpl implements ITaskFileService {
    @Resource
    private ITaskFileDao taskFileDao;
    @Override
    public List<TaskFile> select(TaskFile taskFile) {
        return taskFileDao.select(taskFile);
    }

    @Override
    public int insert(TaskFile taskFile) {
        return taskFileDao.insert(taskFile);
    }

    @Override
    public int insert(List<TaskFile> taskFileList) {
        return taskFileDao.insertList(taskFileList);
    }

    @Override
    public int update(TaskFile taskFile) {
        return taskFileDao.update(taskFile);
    }

    @Override
    public int delete(TaskFile taskFile) {
        return taskFileDao.delete(taskFile);
    }
}
