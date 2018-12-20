package com.testyle.dao;

import com.testyle.model.DevType;

import java.util.List;

public interface IDevTypeDao {
    List<DevType> select(DevType devType);
    int insert(DevType devType);
    int delete(long typeID);
    int update(DevType devType);
}
