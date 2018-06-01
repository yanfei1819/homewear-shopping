package org.shopping.service;

import org.shopping.entity.User;
import java.util.List;

/**
 * Created by dell on 2018/4/26.
 */
public interface UserService {

    List<User> findAll();

    List<User> findAllByCondition(String mobile);

    User login(String username,String password);

    User findById(int id);

    User findByName(String name);

    int add(User user);

    int update(User user);

    int deleteById(int userId);

    int findCount();
}
