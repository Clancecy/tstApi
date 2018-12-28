package com.testyle.service.impl;

import com.testyle.dao.ITagStationDao;
import com.testyle.model.TagStation;
import com.testyle.service.ITagStationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("tagStation")
public class TagStationServiceImpl implements ITagStationService {

    @Resource
    private ITagStationDao tagStationDao;
    @Override
    public List<TagStation> select(TagStation tagStation) {
        return tagStationDao.select(tagStation);
    }

    @Override
    public int insert(List<TagStation> stationList) {
        return tagStationDao.insert(stationList);
    }

    @Override
    public int insert(TagStation tagStation) {
        return tagStationDao.insertList(tagStation);
    }

    @Override
    public int update(TagStation tagStation) {
        return tagStationDao.update(tagStation);
    }

    @Override
    public int delete(TagStation tagStation) {
        return tagStationDao.delete(tagStation);
    }
}
