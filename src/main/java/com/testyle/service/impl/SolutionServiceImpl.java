package com.testyle.service.impl;

import com.testyle.dao.ISolutionDao;
import com.testyle.model.Solution;
import com.testyle.service.ISolutionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("solutionService")
public class SolutionServiceImpl implements ISolutionService {
    @Resource
    private ISolutionDao solutionDao;

    @Override
    public List<Solution> select(Solution solution) {
        return solutionDao.select(solution);
    }

    @Override
    public Solution select(long soluID) {
        return solutionDao.selectByID(soluID);
    }

    @Override
    public int insert(Solution solution) {
        return solutionDao.insert(solution);
    }

    @Override
    public int delete(long SoluID) {
        return solutionDao.delete(SoluID);
    }

    @Override
    public int update(Solution solution) {
        return solutionDao.update(solution);
    }

    @Override
    public long selOne(Solution solution) {
        return solutionDao.selOne(solution);
    }
}
