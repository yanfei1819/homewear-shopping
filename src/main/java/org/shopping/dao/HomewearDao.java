package org.shopping.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.shopping.entity.Homewear;
import org.shopping.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by dell on 2018-04-27.
 */
@Repository(value = "HomewearDao")
@Mapper
public interface HomewearDao {

    List<Homewear> findAll();

    Homewear findById(@Param("id") int id);

    int add(Homewear homewear);

    int update(Homewear homewear);

    int deleteById(@Param("id") int id);
}
