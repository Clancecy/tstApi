package com.testyle.dao;

import com.testyle.model.Solution;

import java.util.List;

public interface ISolutionDao {
    List<Solution> select(Solution solution);
    int insert(Solution solution);
    int delete(long SoluID);
    int update(Solution solution);
    long selOne(Solution solution);
}
