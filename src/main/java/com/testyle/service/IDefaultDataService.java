package com.testyle.service;

import com.testyle.model.DefaultData;

import java.util.List;

public interface IDefaultDataService {
    List<DefaultData> select(DefaultData data);
    int insert(DefaultData data);
    int delete(String table, long dataID);
    int update(DefaultData data);
    int insertList(String table, List<DefaultData> dataList);
    long selOne(DefaultData data);
    int updateList(String table, List<DefaultData> dataList);
}
