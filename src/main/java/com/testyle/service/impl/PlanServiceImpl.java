package com.testyle.service.impl;

import com.testyle.dao.IPlanDao;
import com.testyle.model.Plan;
import com.testyle.service.IPlanService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("planService")
public class PlanServiceImpl implements IPlanService {

    @Resource
    private IPlanDao planDao;

    @Override
    public List<Plan> select(Plan plan) {
        return planDao.select(plan);
    }

    @Override
    public int insert(Plan plan) {
        return planDao.insert(plan);
    }

    @Override
    public int delete(long planID) {
        return planDao.delete(planID);
    }

    @Override
    public int update(Plan plan) {
        return planDao.update(plan);
    }

    @Override
    public List<Plan> selectList(List<Long> planIDs) {
        return planDao.selectList(planIDs);
    }

    @Override
    public Plan selectByID(long planID) {
        return planDao.selectByID(planID);
    }
}
