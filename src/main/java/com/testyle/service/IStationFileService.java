package com.testyle.service;

import com.testyle.model.StationFile;

import java.util.List;

public interface IStationFileService {
    List<StationFile> select(StationFile stationFile);
    int insert(StationFile stationFile);
    int insert(List<StationFile> stationFileList);
    int update(StationFile stationFile);
    int delete(StationFile stationFile);
}
