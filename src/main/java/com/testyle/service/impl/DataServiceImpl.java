package com.testyle.service.impl;

import com.testyle.dao.IDataDao;
import com.testyle.model.Data;
import com.testyle.service.IDataService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


@Service("dataService")
public class DataServiceImpl implements IDataService {

    @Resource
    private IDataDao dataDao;

    @Override
    public List<Data> select(Data data) {
        return dataDao.select(data);
    }

    @Override
    public int insert(Data data) {
        return dataDao.insert(data);
    }

    @Override
    public int delete(String table,long taskID) {
        return dataDao.delete(table,taskID);
    }

    @Override
    public int update(Data data) {
        return dataDao.update(data);
    }

    @Override
    public int insertList(String table,List<Data> dataList) {
        return dataDao.insertList(table,dataList);
    }

    @Override
    public long selOne(Data data) {
        return dataDao.selOne(data);
    }

    @Override
    public int updateList(String table,List<Data> dataList) {
        return dataDao.updateList(table,dataList);
    }

    @Override
    public List<Map<String, Object>> getRecord(long proID) {
        return dataDao.getRecord(proID);
    }

    @Override
    public List<Map<String, Object>> getItem(long recordID) {
        return dataDao.getItem(recordID);
    }


}
