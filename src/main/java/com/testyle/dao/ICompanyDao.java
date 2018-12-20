package com.testyle.dao;

import com.testyle.model.Company;

import java.util.List;

public interface ICompanyDao {
    Company selectCompany(long companyID);
    int insert(Company company);
    long checkCompany(Company company);
    int delete(long compID);
    List<Company> select(Company company);
    int update(Company company);
}
