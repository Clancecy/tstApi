package com.testyle.service.impl;

import com.testyle.dao.IInstrumentFileDao;
import com.testyle.model.InstrumentFile;
import com.testyle.service.IInstrumentFileService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("instrumentFile")
public class InstrumentFileServiceImpl implements IInstrumentFileService {
    @Resource
    private IInstrumentFileDao instrumentFileDao;
    @Override
    public List<InstrumentFile> select(InstrumentFile instrumentFile) {
        return instrumentFileDao.select(instrumentFile);
    }

    @Override
    public int insert(InstrumentFile instrumentFile) {
        return instrumentFileDao.insert(instrumentFile);
    }

    @Override
    public int insert(List<InstrumentFile> instrumentFileList) {
        return instrumentFileDao.insertList(instrumentFileList);
    }

    @Override
    public int update(InstrumentFile instrumentFile) {
        return instrumentFileDao.update(instrumentFile);
    }

    @Override
    public int delete(InstrumentFile instrumentFile) {
        return instrumentFileDao.delete(instrumentFile);
    }
}
