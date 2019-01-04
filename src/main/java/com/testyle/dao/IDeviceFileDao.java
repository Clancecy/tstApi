package com.testyle.dao;

import com.testyle.model.DeviceFile;

import java.util.List;

public interface IDeviceFileDao {
    List<DeviceFile> select(DeviceFile deviceFile);
    int insert(DeviceFile deviceFile);
    int insertList(List<DeviceFile> deviceFileList);
    int update(DeviceFile deviceFile);
    int delete(DeviceFile deviceFile);
}
