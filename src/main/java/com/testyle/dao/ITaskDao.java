package com.testyle.dao;

import com.testyle.model.Task;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface ITaskDao {
    List<Task> select(Task task);
    int insert(Task task);
    int delete(long taskID);
    int update(Task task);
    List<Task> selectList(List<Long>taskIDs);
    long getCount(Task task);
    Task selectByID(long taskID);

    List<Task> selectByMap(@Param("list") List<Long> taskIDs, @Param("atime")Date atime,@Param("btime") Date btime);
}
