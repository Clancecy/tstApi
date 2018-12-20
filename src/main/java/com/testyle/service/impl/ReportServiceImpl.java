package com.testyle.service.impl;

import com.testyle.dao.IReportDao;
import com.testyle.dao.ITestDao;
import com.testyle.model.Report;
import com.testyle.model.Test;
import com.testyle.service.IReportService;
import com.testyle.service.ITestService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("reportService")
public class ReportServiceImpl implements IReportService {

    @Resource
    private IReportDao reportDao;

    @Override
    public List<Report> select(Report report) {
        return reportDao.select(report);
    }

    @Override
    public int insert(Report report) {
        return reportDao.insert(report);
    }

    @Override
    public int delete(long reportID) {
        return reportDao.delete(reportID);
    }

    @Override
    public int update(Report report) {
        return reportDao.update(report);
    }
}
