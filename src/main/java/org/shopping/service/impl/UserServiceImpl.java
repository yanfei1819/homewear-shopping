package org.shopping.service.impl;

import org.shopping.dao.UserDao;
import org.shopping.entity.User;
import org.shopping.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


/**
 * Created by dell on 2018-04-26.
 */
@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;

    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }

    @Override
    public List<User> findAllByCondition(String mobile) {
        return userDao.findAllByCondition(mobile);
    }

    @Override
    public User login(String username, String password) {
        return userDao.login(username,password);
    }

    @Override
    public User findById(int id) {
        return userDao.findById(id);
    }

    @Override
    public User findByName(String name) {
        return userDao.findByName(name);
    }

    @Override
    public int add(User user) {
        return userDao.add(user);
    }

    @Override
    public int update(User user) {

        return userDao.update(user);
    }

    @Override
    public int deleteById(int userId) {

        return userDao.deleteById(userId);
    }

    @Override
    public int findCount() {
        return userDao.findCount();
    }
}
