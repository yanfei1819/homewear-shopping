package org.shopping.service;

import org.apache.ibatis.annotations.Param;
import org.shopping.entity.Homewear;

import java.util.List;

/**
 * Created by dell on 2018/4/27.
 */
public interface HomewearService {

    List<Homewear> findAll();

    Homewear findById(@Param("id") int id);

    int add(Homewear homewear);

    int update(Homewear homewear);

    int deleteById(@Param("id") int id);
}
