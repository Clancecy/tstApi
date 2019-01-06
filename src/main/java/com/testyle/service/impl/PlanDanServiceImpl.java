package com.testyle.service.impl;

import com.testyle.dao.IPlanDanDao;
import com.testyle.model.PlanDan;
import com.testyle.service.IPlanDanService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("planDanService")
public class PlanDanServiceImpl implements IPlanDanService {

    @Resource
    private IPlanDanDao planDanDao;

    @Override
    public List<PlanDan> select(PlanDan planDan) {
        return planDanDao.select(planDan);
    }

    @Override
    public int insert(PlanDan planDan) {
        return planDanDao.insert(planDan);
    }

    @Override
    public int delete(long planID) {
        return planDanDao.delete(planID);
    }

    @Override
    public int update(PlanDan planDan) {
        return planDanDao.update(planDan);
    }

    @Override
    public List<PlanDan> selectList(List<Long> planIDs) {
        return planDanDao.selectList(planIDs);
    }

    @Override
    public PlanDan select(long planDanID) {
        return planDanDao.selectByID(planDanID);
    }
}
