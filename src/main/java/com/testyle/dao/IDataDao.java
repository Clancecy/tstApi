package com.testyle.dao;

import com.testyle.model.Data;
import com.testyle.model.Project;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IDataDao {
    List<Data> select(Data data);
    int insert(Data data);
    int delete(@Param("table")String table, @Param("dataID")long dataID);
    int update(Data data);
    int insertList(@Param("table") String table,@Param("dataList")List<Data> dataList);
    long selOne(Data data);
    int updateList(@Param("table") String table,@Param("list")List<Data> dataList);
}
