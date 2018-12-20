package com.testyle.service.impl;

import com.testyle.dao.ICompanyDao;
import com.testyle.model.Company;
import com.testyle.service.ICompanyService;

import javax.annotation.Resource;
import java.util.List;

public class CompanyServiceImpl implements ICompanyService {
    @Resource
    private ICompanyDao companyDao;
    @Override
    public Company selectCompany(long companyID) {
        return companyDao.selectCompany(companyID);
    }

    @Override
    public int insert(Company company) {
        return companyDao.insert(company);
    }

    @Override
    public long checkCompany(Company company) {
        return companyDao.checkCompany(company);
    }

    @Override
    public int delete(long compID) {
        return companyDao.delete(compID);
    }

    @Override
    public List<Company> select(Company company) {
        return companyDao.select(company);
    }

    @Override
    public int update(Company company) {
        return companyDao.update(company);
    }
}
