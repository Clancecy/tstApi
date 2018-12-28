package com.testyle.service.impl;

import com.testyle.dao.IFileDao;
import com.testyle.model.File;
import com.testyle.service.IFileService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("fileService")
public class FileServiceImpl implements IFileService {
    @Resource
    private IFileDao fileDao;
    @Override
    public List<File> select(File file) {
        return fileDao.select(file);
    }

    @Override
    public int insert(File file) {
        return fileDao.insert(file);
    }

    @Override
    public int insert(List<File> fileList) {
        return fileDao.insertList(fileList);
    }

    @Override
    public int update(File file) {
        return fileDao.update(file);
    }

    @Override
    public int delete(File file) {
        return fileDao.delete(file);
    }
}
