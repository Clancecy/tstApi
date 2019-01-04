package com.testyle.dao;

import com.testyle.model.TagDevice;

import java.util.List;

public interface ITagDeviceDao {
    List<TagDevice> select(TagDevice tagDevice);
    int insert(List<TagDevice> deviceList);
    int insertList(TagDevice tagDevice);
    int update(TagDevice tagDevice);
    int delete(TagDevice tagDevice);
}
