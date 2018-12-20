package com.testyle.service;

import com.testyle.model.SoluPro;
import com.testyle.model.TestUser;

import java.util.List;

public interface ITestUserService {
    List<TestUser> select(TestUser testUser);
    int insert(TestUser testUser);
    int delete(long testID);
    int update(TestUser testUser);
    int insertList(List<TestUser> testUsers);
    long selOne(TestUser testUser);
    int updateList(List<TestUser> testUsers);
}
