package com.testyle.dao;

import com.testyle.model.DefaultData;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IDefaultDataDao {
    List<DefaultData> select(DefaultData data);
    int insert(DefaultData data);
    int delete(@Param("table") String table, @Param("devID") long devID);
    int update(DefaultData data);
    int insertList(@Param("table") String table, @Param("dataList") List<DefaultData> dataList);
    long selOne(DefaultData data);
    int updateList(@Param("table") String table, @Param("list") List<DefaultData> dataList);
}
