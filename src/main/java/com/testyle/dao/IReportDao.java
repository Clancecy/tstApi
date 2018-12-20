package com.testyle.dao;

import com.testyle.model.Report;
import com.testyle.model.Test;

import java.util.List;

public interface IReportDao {
    List<Report> select(Report report);
    int insert(Report report);
    int delete(long reportID);
    int update(Report report);
}
