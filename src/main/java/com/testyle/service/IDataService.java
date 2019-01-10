package com.testyle.service;

import com.testyle.model.Data;

import java.util.List;
import java.util.Map;

public interface IDataService {
    List<Data> select(Data data);
    int insert(Data data);
    int delete(String table,long taskID);
    int update(Data data);
    int insertList(String table,List<Data> dataList);
    long selOne(Data data);
    int updateList(String table,List<Data> dataList);
    List<Map<String,Object>> getRecord(long proID);
    List<Map<String,Object>> getItem(long recordID);
}
