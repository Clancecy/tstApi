package com.testyle.dao;

import com.alibaba.fastjson.JSON;
import com.testyle.common.Utils;
import com.testyle.model.Record;
import com.testyle.model.Station;
import com.testyle.model.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class IStationDaoTest {
    @Autowired
    private IStationDao stationDao;
    @Autowired
    private IUserDao userDao;
    @Test
    public void testSeleteAll(){
        System.out.println(JSON.toJSONString(stationDao.selectAll()));
    }

    @Test
    public void testRead(){
        Utils utils=new Utils();
        List<Record> excelRecords= utils.readExcel("E:\\file2\\直流电阻模板20180301.xlsx");
        System.out.println(JSON.toJSONString(excelRecords));
    }
    @Test
    public void tesele(){
       Station station=stationDao.selectStation(11);
        System.out.println(JSON.toJSONString(station));
    }
    @Test
    public void teuser(){
        User user=userDao.selectUser(1);
        System.out.println(JSON.toJSONString(user));
    }

}
