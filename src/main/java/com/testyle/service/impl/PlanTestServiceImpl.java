package com.testyle.service.impl;

import com.testyle.dao.IPlanTestDao;
import com.testyle.model.PlanTest;
import com.testyle.service.IPlanTestService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("planTestService")
public class PlanTestServiceImpl implements IPlanTestService {

    @Resource
    private IPlanTestDao planTestDao;

    @Override
    public List<PlanTest> select(PlanTest planTest) {
        return planTestDao.select(planTest);
    }

    @Override
    public int insert(PlanTest planTest) {
        return planTestDao.insert(planTest);
    }

    @Override
    public int delete(long taskID) {
        return planTestDao.delete(taskID);
    }

    @Override
    public int update(PlanTest planTest) {
        return planTestDao.update(planTest);
    }

    @Override
    public int insertList(List<PlanTest> planTests) {
        return planTestDao.insertList(planTests);
    }

    @Override
    public long selOne(PlanTest planTest) {
        return planTestDao.selOne(planTest);
    }

    @Override
    public int updateList(List<PlanTest> planTests) {
        return planTestDao.updateList(planTests);
    }
}
