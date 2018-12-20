package com.testyle.service;

import com.testyle.model.ReportTask;

import java.util.List;

public interface IReportTaskService {
    List<ReportTask> select(ReportTask reportTask);
    int insert(ReportTask reportTask);
    int delete(long reportID);
    int update(ReportTask reportTask);
    int insertList(List<ReportTask> reportTasks);
    long selOne(ReportTask reportTask);
    int updateList(List<ReportTask> reportTasks);
}
