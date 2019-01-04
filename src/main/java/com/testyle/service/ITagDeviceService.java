package com.testyle.service;

import com.testyle.model.TagDevice;

import java.util.List;

public interface ITagDeviceService {
    List<TagDevice> select(TagDevice tagDevice);
    int insert(List<TagDevice> deviceList);
    int insert(TagDevice tagDevice);
    int update(TagDevice tagDevice);
    int delete(TagDevice tagDevice);
}
