package com.testyle.dao;

import com.testyle.model.DevAttrVal;
import com.testyle.model.Device;

import java.util.List;

public interface IDevAttrValDao {
    List<DevAttrVal> select(DevAttrVal devAttrVal);
    int insert(DevAttrVal devAttrVal);
    int delete(long devID);
    int update(DevAttrVal devAttrVal);
    int insertList(List<DevAttrVal> devAttrVals);
}
