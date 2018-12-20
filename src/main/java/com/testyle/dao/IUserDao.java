package com.testyle.dao;

import com.testyle.model.User;

import java.util.List;

public interface IUserDao {
    User selectUser(long userID);
    int addUser(User user);
    long checkUser(User user);
    int deleteUser(long userID);
    List<User> select(User user);
    int update(User user);
}
