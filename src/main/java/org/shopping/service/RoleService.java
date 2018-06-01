package org.shopping.service;

import org.shopping.entity.Role;

import java.util.List;

/**
 * Created by shiyanfei on 2018/5/4.
 */
public interface RoleService {
    int roleAccount();
    List<Role> findRoles();
}
