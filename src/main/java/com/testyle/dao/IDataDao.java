package com.testyle.dao;

import com.testyle.model.Data;
import com.testyle.model.Project;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface IDataDao {
    List<Data> select(Data data);
    int insert(Data data);
    int delete(@Param("table")String table, @Param("taskID")long taskID);
    int update(Data data);
    int insertList(@Param("table") String table,@Param("dataList")List<Data> dataList);
    long selOne(Data data);
    int updateList(@Param("table") String table,@Param("list")List<Data> dataList);

    List<Map<String,Object>> getRecord(long proID);
    List<Map<String,Object>> getItem(long recordID);
}
