package com.testyle.service;

import com.testyle.model.DeviceFile;

import java.util.List;

public interface IDeviceFileService {
    List<DeviceFile> select(DeviceFile deviceFile);
    int insert(DeviceFile deviceFile);
    int insert(List<DeviceFile> deviceFileList);
    int update(DeviceFile deviceFile);
    int delete(DeviceFile deviceFile);
}
