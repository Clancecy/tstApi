package com.testyle.service;

import com.testyle.model.AnalysisItem;

import java.util.List;

public interface IAnalysisItemService {
    List<AnalysisItem> select(AnalysisItem analysisItem);
    int insert(AnalysisItem analysisItem);
    int delete(long analyID);
    int update(AnalysisItem analysisItem);
    int insertList(List<AnalysisItem> analysisItems);
    long selOne(AnalysisItem analysisItem);
    int updateList(List<AnalysisItem> analysisItems);
}
