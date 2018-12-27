package com.testyle.service.impl;

import com.testyle.dao.IDefaultDataDao;
import com.testyle.model.DefaultData;
import com.testyle.service.IDefaultDataService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("defalutDataService")
public class DefaultDataServiceImpl implements IDefaultDataService {

    @Resource
    private IDefaultDataDao dataDao;

    @Override
    public List<DefaultData> select(DefaultData data) {
        return dataDao.select(data);
    }

    @Override
    public int insert(DefaultData data) {
        return dataDao.insert(data);
    }

    @Override
    public int delete(String table,long dataID) {
        return dataDao.delete(table,dataID);
    }

    @Override
    public int update(DefaultData data) {
        return dataDao.update(data);
    }

    @Override
    public int insertList(String table,List<DefaultData> dataList) {
        return dataDao.insertList(table,dataList);
    }

    @Override
    public long selOne(DefaultData data) {
        return dataDao.selOne(data);
    }

    @Override
    public int updateList(String table,List<DefaultData> dataList) {
        return dataDao.updateList(table,dataList);
    }


}
