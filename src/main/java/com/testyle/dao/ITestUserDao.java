package com.testyle.dao;

import com.testyle.model.TestUser;

import java.util.List;

public interface ITestUserDao {
    List<TestUser> select(TestUser testUser);
    int insert(TestUser testUser);
    int delete(long ID);
    int update(TestUser testUser);
    int insertList(List<TestUser> testUsers);
    long selOne(TestUser testUser);
    int updateList(List<TestUser> testUsers);
}
