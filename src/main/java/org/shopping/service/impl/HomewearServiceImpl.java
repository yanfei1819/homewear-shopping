package org.shopping.service.impl;

import org.shopping.dao.HomewearDao;
import org.shopping.entity.Homewear;
import org.shopping.service.HomewearService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by dell on 2018-04-27.
 */
@Service
public class HomewearServiceImpl implements HomewearService {

    @Resource
    private HomewearDao homewearDao;

    @Override
    public List<Homewear> findAll() {
        return homewearDao.findAll();
    }

    @Override
    public Homewear findById(int id) {
        return homewearDao.findById(id);
    }

    @Override
    public int add(Homewear homewear) {
        return homewearDao.add(homewear);
    }

    @Override
    public int update(Homewear homewear) {
        return homewearDao.update(homewear);
    }

    @Override
    public int deleteById(int id) {
        return homewearDao.deleteById(id);
    }
}
