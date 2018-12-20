package com.testyle.service.impl;

import com.testyle.dao.IESDao;
import com.testyle.model.ES;
import com.testyle.service.IESService;

import javax.annotation.Resource;

public class ESServiceImpl implements IESService {

    @Resource
    private IESDao iesDao;

    @Override
    public String getUrl() {
        return iesDao.getUrl();
    }

    @Override
    public int update(ES es) {
        return iesDao.update(es);
    }
}
