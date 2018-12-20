package com.testyle.service;

import com.testyle.model.Report;

import java.util.List;

public interface IReportService {
    List<Report> select(Report report);
    int insert(Report report);
    int delete(long reportID);
    int update(Report report);
}
