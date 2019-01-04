package com.testyle.service.impl;

import com.testyle.dao.IDeviceFileDao;
import com.testyle.model.DeviceFile;
import com.testyle.service.IDeviceFileService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("deviceFile")
public class DeviceFileServiceImpl implements IDeviceFileService {
    @Resource
    private IDeviceFileDao deviceFileDao;
    @Override
    public List<DeviceFile> select(DeviceFile deviceFile) {
        return deviceFileDao.select(deviceFile);
    }

    @Override
    public int insert(DeviceFile deviceFile) {
        return deviceFileDao.insert(deviceFile);
    }

    @Override
    public int insert(List<DeviceFile> deviceFileList) {
        return deviceFileDao.insertList(deviceFileList);
    }

    @Override
    public int update(DeviceFile deviceFile) {
        return deviceFileDao.update(deviceFile);
    }

    @Override
    public int delete(DeviceFile deviceFile) {
        return deviceFileDao.delete(deviceFile);
    }
}
