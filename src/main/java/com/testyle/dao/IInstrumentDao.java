package com.testyle.dao;

import com.testyle.model.Instrument;

import java.util.List;

public interface IInstrumentDao {
    List<Instrument> select(Instrument instrument);
    int insert(Instrument instrument);
    int delete(long insID);
    int update(Instrument instrument);
}
