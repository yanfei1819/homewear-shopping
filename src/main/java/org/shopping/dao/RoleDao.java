package org.shopping.dao;

import org.apache.ibatis.annotations.Mapper;
import org.shopping.entity.Role;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by shiyanfei on 2018-05-04.
 */
@Repository(value = "RoleDao")
@Mapper
public interface RoleDao {
    int roleAccount();
    List<Role> findRoles();
}
