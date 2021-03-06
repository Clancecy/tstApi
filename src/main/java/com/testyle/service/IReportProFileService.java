package com.testyle.service;

import com.testyle.model.ReportProFile;

import java.util.List;

public interface IReportProFileService {
    List<ReportProFile> select(ReportProFile reportProFile);
    int insert(ReportProFile reportProFile);
    int delete(long reportID);
    int update(ReportProFile reportProFile);
    int insertList(List<ReportProFile> reportProFiles);
    long selOne(ReportProFile reportProFile);
    int updateList(List<ReportProFile> reportProFiles);
    List<ReportProFile> selectByTask(List<Long> taskIDs);
}
