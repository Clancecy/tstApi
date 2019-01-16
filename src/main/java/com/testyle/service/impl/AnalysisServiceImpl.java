package com.testyle.service.impl;

import com.testyle.dao.IAnalysisDao;
import com.testyle.model.Analysis;
import com.testyle.service.IAnalysisService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("analysisService")
public class AnalysisServiceImpl implements IAnalysisService {
    @Resource
    IAnalysisDao analysisDao;
    @Override
    public List<Analysis> select(Analysis analysis) {
        return analysisDao.select(analysis);
    }

    @Override
    public Analysis select(long analyID) {
        return analysisDao.selectByID(analyID);
    }

    @Override
    public int update(Analysis analysis) {
        return analysisDao.update(analysis);
    }

    @Override
    public int insert(Analysis analysis) {
        return analysisDao.insert(analysis);
    }

    @Override
    public int delete(long analyID) {
        return analysisDao.delete(analyID);
    }
}
