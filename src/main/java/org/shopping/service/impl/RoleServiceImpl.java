package org.shopping.service.impl;

import org.shopping.dao.RoleDao;
import org.shopping.entity.Role;
import org.shopping.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by shiyanfei on 2018-05-04.
 */
@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDao roleDao;


    @Override
    public int roleAccount() {
        return roleDao.roleAccount();
    }

    @Override
    public List<Role> findRoles() {
        return roleDao.findRoles();
    }
}
