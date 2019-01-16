package com.testyle.dao;

import com.testyle.model.Analysis;

import java.util.List;

public interface IAnalysisDao {
    List<Analysis> select(Analysis analysis);
    Analysis selectByID(long analyID);
    int update(Analysis analysis);
    int insert(Analysis analysis);
    int delete(long analyID);
}
