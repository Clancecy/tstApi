package com.testyle.service.impl;

import com.testyle.dao.IUserDao;
import com.testyle.model.User;
import com.testyle.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("userService")
public class UserServiceImpl implements IUserService {

    @Resource
    private IUserDao userDao;

    public User selectUser(long userId) {
        return this.userDao.selectUser(userId);
    }

    public int addUser(User user) {
        return this.userDao.addUser(user);
    }

    public long checkUser(User user) {
        return userDao.checkUser(user);
    }

    public int deleteUser(long userID) {
        return userDao.deleteUser(userID);
    }

    @Override
    public List<User> select(User user) {
        return userDao.select(user);
    }

    @Override
    public int update(User user) {
        return userDao.update(user);
    }

    @Override
    public List<User> select(List<Long> userIDs) {
        return userDao.selectList(userIDs);
    }


}
