package com.testyle.service;

import com.testyle.model.Analysis;

import java.util.List;

public interface IAnalysisService {
    List<Analysis> select(Analysis analysis);
    Analysis select(long analyID);
    int update(Analysis analysis);
    int insert(Analysis analysis);
    int delete(long analyID);
}
