package com.testyle.service;

import com.testyle.model.SoluPro;

import java.util.List;

public interface ISoluProService {
    List<SoluPro> select(SoluPro soluPro);
    int insert(SoluPro soluPro);
    int delete(long soluID);
    int update(SoluPro soluPro);
    int insertList(List<SoluPro> soluPros);
    long selOne(SoluPro soluPro);
    int updateList(List<SoluPro> soluPros);
}
