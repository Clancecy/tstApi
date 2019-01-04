package com.testyle.dao;

import com.testyle.model.InstrumentFile;

import java.util.List;

public interface IInstrumentFileDao {
    List<InstrumentFile> select(InstrumentFile instrumentFile);
    int insert(InstrumentFile instrumentFile);
    int insertList(List<InstrumentFile> instrumentFileList);
    int update(InstrumentFile instrumentFile);
    int delete(InstrumentFile instrumentFile);
}
