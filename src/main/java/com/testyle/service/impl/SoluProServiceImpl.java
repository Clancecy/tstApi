package com.testyle.service.impl;

import com.testyle.dao.ISoluProDao;
import com.testyle.model.SoluPro;
import com.testyle.service.ISoluProService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("soluProService")
public class SoluProServiceImpl implements ISoluProService {

    @Resource
    private ISoluProDao soluProDao;


    @Override
    public List<SoluPro> select(SoluPro soluPro) {
        return soluProDao.select(soluPro);
    }

    @Override
    public int insert(SoluPro soluPro) {
        return soluProDao.insert(soluPro);
    }

    @Override
    public int delete(long soluID) {
        return soluProDao.delete(soluID);
    }

    @Override
    public int update(SoluPro soluPro) {
        return soluProDao.update(soluPro);
    }

    @Override
    public int insertList(List<SoluPro> soluPros) {
        return soluProDao.insertList(soluPros);
    }

    @Override
    public long selOne(SoluPro soluPro) {
        return soluProDao.selOne(soluPro);
    }

    @Override
    public int updateList(List<SoluPro> soluPros) {
        return soluProDao.updateList(soluPros);
    }
}
