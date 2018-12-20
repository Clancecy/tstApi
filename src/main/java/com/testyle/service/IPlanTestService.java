package com.testyle.service;

import com.testyle.model.PlanTest;

import java.util.List;

public interface IPlanTestService {
    List<PlanTest> select(PlanTest planTest);
    int insert(PlanTest planTest);
    int delete(long planID);
    int update(PlanTest planTest);
    int insertList(List<PlanTest> planTests);
    long selOne(PlanTest planTest);
    int updateList(List<PlanTest> planTests);
}
