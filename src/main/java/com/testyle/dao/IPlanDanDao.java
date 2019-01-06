package com.testyle.dao;

import com.testyle.model.PlanDan;

import java.util.List;

public interface IPlanDanDao {
    List<PlanDan> select(PlanDan planDan);
    int insert(PlanDan planDan);
    int delete(long planDanID);
    int update(PlanDan planDan);
    List<PlanDan> selectList(List<Long> planDanIDs);
    PlanDan selectByID(long planDanID);
}
