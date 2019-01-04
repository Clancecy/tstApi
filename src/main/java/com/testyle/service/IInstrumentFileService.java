package com.testyle.service;

import com.testyle.model.InstrumentFile;

import java.util.List;

public interface IInstrumentFileService {
    List<InstrumentFile> select(InstrumentFile instrumentFile);
    int insert(InstrumentFile instrumentFile);
    int insert(List<InstrumentFile> instrumentFileList);
    int update(InstrumentFile instrumentFile);
    int delete(InstrumentFile instrumentFile);
}
