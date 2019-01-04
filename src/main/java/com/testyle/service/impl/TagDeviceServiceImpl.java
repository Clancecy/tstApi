package com.testyle.service.impl;

import com.testyle.dao.ITagDeviceDao;
import com.testyle.model.TagDevice;
import com.testyle.service.ITagDeviceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("tagDevice")
public class TagDeviceServiceImpl implements ITagDeviceService {

    @Resource
    private ITagDeviceDao tagDeviceDao;
    @Override
    public List<TagDevice> select(TagDevice tagDevice) {
        return tagDeviceDao.select(tagDevice);
    }

    @Override
    public int insert(List<TagDevice> deviceList) {
        return tagDeviceDao.insert(deviceList);
    }

    @Override
    public int insert(TagDevice tagDevice) {
        return tagDeviceDao.insertList(tagDevice);
    }

    @Override
    public int update(TagDevice tagDevice) {
        return tagDeviceDao.update(tagDevice);
    }

    @Override
    public int delete(TagDevice tagDevice) {
        return tagDeviceDao.delete(tagDevice);
    }
}
