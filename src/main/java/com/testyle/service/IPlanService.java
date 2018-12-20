package com.testyle.service;

import com.testyle.model.Plan;

import java.util.List;

public interface IPlanService {
    List<Plan> select(Plan plan);
    int insert(Plan plan);
    int delete(long planID);
    int update(Plan plan);
    List<Plan> selectList(List<Long> planIDs);
}
