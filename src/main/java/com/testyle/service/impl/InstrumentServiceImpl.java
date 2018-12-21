package com.testyle.service.impl;

import com.testyle.dao.IInstrumentDao;
import com.testyle.model.Instrument;
import com.testyle.service.IInstrumentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("instrumentService")
public class InstrumentServiceImpl implements IInstrumentService {

    @Resource
    private IInstrumentDao instrumentDao;
    @Override
    public List<Instrument> select(Instrument instrument) {
        return instrumentDao.select(instrument);
    }

    @Override
    public int insert(Instrument instrument) {
        return instrumentDao.insert(instrument);
    }

    @Override
    public int delete(long insID) {
        return instrumentDao.delete(insID);
    }

    @Override
    public int update(Instrument instrument) {
        return instrumentDao.update(instrument);
    }

    @Override
    public Instrument selectByID(long insID) {
        return instrumentDao.selectByID(insID);
    }
}
