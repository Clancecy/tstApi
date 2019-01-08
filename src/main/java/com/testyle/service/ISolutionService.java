package com.testyle.service;

import com.testyle.model.Solution;

import java.util.List;

public interface ISolutionService {
    List<Solution> select(Solution solution);
    Solution select(long soluID);
    int insert(Solution solution);
    int delete(long SoluID);
    int update(Solution solution);
    long selOne(Solution solution);
}
