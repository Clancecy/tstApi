package com.testyle.dao;

import com.testyle.model.SoluPro;

import java.util.List;

public interface ISoluProDao {
    List<SoluPro> select(SoluPro soluPro);
    int insert(SoluPro soluPro);
    int delete(long SoluID);
    int update(SoluPro soluPro);
    int insertList(List<SoluPro> soluPros);
    long selOne(SoluPro soluPro);
    int updateList(List<SoluPro> soluPros);
}
