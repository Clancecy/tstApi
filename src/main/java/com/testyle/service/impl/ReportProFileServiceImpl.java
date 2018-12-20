package com.testyle.service.impl;

import com.testyle.dao.IReportProFileDao;
import com.testyle.model.ReportProFile;
import com.testyle.service.IReportProFileService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("reportProFileService")
public class ReportProFileServiceImpl implements IReportProFileService {
    @Resource
    private IReportProFileDao reportProFileDao;

    @Override
    public List<ReportProFile> select(ReportProFile reportProFile) {
        return reportProFileDao.select(reportProFile);
    }

    @Override
    public int insert(ReportProFile reportProFile) {
        return reportProFileDao.insert(reportProFile);
    }

    @Override
    public int delete(long reportID) {
        return reportProFileDao.delete(reportID);
    }

    @Override
    public int update(ReportProFile reportProFile) {
        return reportProFileDao.update(reportProFile);
    }

    @Override
    public int insertList(List<ReportProFile> reportProFiles) {
        return reportProFileDao.insertList(reportProFiles);
    }

    @Override
    public long selOne(ReportProFile reportProFile) {
        return reportProFileDao.selOne(reportProFile);
    }

    @Override
    public int updateList(List<ReportProFile> reportProFiles) {
        return reportProFileDao.updateList(reportProFiles);
    }

    @Override
    public List<ReportProFile> selectByTask(List<Long> taskIDs) {
        return reportProFileDao.selectByTask(taskIDs);
    }
}
