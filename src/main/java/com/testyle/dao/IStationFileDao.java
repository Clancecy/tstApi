package com.testyle.dao;

import com.testyle.model.StationFile;

import java.util.List;

public interface IStationFileDao {
    List<StationFile> select(StationFile stationFile);
    int insert(StationFile stationFile);
    int insertList(List<StationFile> stationFileList);
    int update(StationFile stationFile);
    int delete(StationFile stationFile);
}
