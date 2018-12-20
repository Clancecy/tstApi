package com.testyle.service;

import com.testyle.model.Instrument;

import java.util.List;

public interface IInstrumentService {
    List<Instrument> select(Instrument instrument);
    int insert(Instrument instrument);
    int delete(long insID);
    int update(Instrument instrument);
}
