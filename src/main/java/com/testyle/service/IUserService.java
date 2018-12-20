package com.testyle.service;

import com.testyle.model.User;

import java.util.List;

public interface IUserService {
    User selectUser(long userId);
    int addUser(User user);
    long checkUser(User user);
    int deleteUser(long userID);
    List<User> select(User user);
    int update(User user);
}
