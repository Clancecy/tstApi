package com.testyle.service.impl;


import com.testyle.dao.ITestUserDao;
import com.testyle.model.TestUser;
import com.testyle.service.ITestUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("testUserService")
public class TestUserServiceImpl implements ITestUserService {

    @Resource
    private ITestUserDao testUserDao;

    @Override
    public List<TestUser> select(TestUser testUser) {
        return testUserDao.select(testUser);
    }

    @Override
    public int insert(TestUser testUser) {
        return testUserDao.insert(testUser);
    }

    @Override
    public int delete(long testID) {
        return testUserDao.delete(testID);
    }

    @Override
    public int update(TestUser testUser) {
        return testUserDao.update(testUser);
    }

    @Override
    public int insertList(List<TestUser> testUsers) {
        return testUserDao.insertList(testUsers);
    }

    @Override
    public long selOne(TestUser testUser) {
        return testUserDao.selOne(testUser);
    }

    @Override
    public int updateList(List<TestUser> testUsers) {
        return testUserDao.updateList(testUsers);
    }
}
