package com.testyle.service.impl;

import com.testyle.dao.IAnalysisItemDao;
import com.testyle.model.AnalysisItem;
import com.testyle.service.IAnalysisItemService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("analysisItemService")
public class AnalysisItemServiceImpl implements IAnalysisItemService {

    @Resource
    private IAnalysisItemDao analysisItemDao;

    @Override
    public List<AnalysisItem> select(AnalysisItem analysisItem) {
        return analysisItemDao.select(analysisItem);
    }

    @Override
    public int insert(AnalysisItem analysisItem) {
        return analysisItemDao.insert(analysisItem);
    }

    @Override
    public int delete(long taskID) {
        return analysisItemDao.delete(taskID);
    }

    @Override
    public int update(AnalysisItem analysisItem) {
        return analysisItemDao.update(analysisItem);
    }

    @Override
    public int insertList(List<AnalysisItem> analysisItems) {
        return analysisItemDao.insertList(analysisItems);
    }

    @Override
    public long selOne(AnalysisItem analysisItem) {
        return analysisItemDao.selOne(analysisItem);
    }

    @Override
    public int updateList(List<AnalysisItem> analysisItems) {
        return analysisItemDao.updateList(analysisItems);
    }
}
