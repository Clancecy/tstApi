package com.testyle.service.impl;

import com.testyle.dao.IStationFileDao;
import com.testyle.model.StationFile;
import com.testyle.service.IStationFileService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("stationFile")
public class StationFileServiceImpl implements IStationFileService {
    @Resource
    private IStationFileDao stationFileDao;
    @Override
    public List<StationFile> select(StationFile stationFile) {
        return stationFileDao.select(stationFile);
    }

    @Override
    public int insert(StationFile stationFile) {
        return stationFileDao.insert(stationFile);
    }

    @Override
    public int insert(List<StationFile> stationFileList) {
        return stationFileDao.insertList(stationFileList);
    }

    @Override
    public int update(StationFile stationFile) {
        return stationFileDao.update(stationFile);
    }

    @Override
    public int delete(StationFile stationFile) {
        return stationFileDao.delete(stationFile);
    }
}
