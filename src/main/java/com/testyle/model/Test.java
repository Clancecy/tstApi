package com.testyle.model;

import java.util.Date;
import java.util.List;

public class Test {
    long testID = -1;
    String testNumber;
    long soluID=-1;
    long planDanID=-1;
    String planDanNumber;
    String soluName;
    long builderID=-1;
    String userName;
    Date addtime=new Date();

    List<TestUser> testUserList;

    public String getTestNumber() {
        return testNumber;
    }

    public void setTestNumber(String testNumber) {
        this.testNumber = testNumber;
    }

    public long getPlanDanID() {
        return planDanID;
    }

    public void setPlanDanID(long planDanID) {
        this.planDanID = planDanID;
    }

    public String getPlanDanNumber() {
        return planDanNumber;
    }

    public void setPlanDanNumber(String planDanNumber) {
        this.planDanNumber = planDanNumber;
    }

    public List<TestUser> getTestUserList() {
        return testUserList;
    }

    public void setTestUserList(List<TestUser> testUserList) {
        this.testUserList = testUserList;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getSoluName() {
        return soluName;
    }

    public void setSoluName(String soluName) {
        this.soluName = soluName;
    }


    public long getTestID() {
        return testID;
    }

    public void setTestID(long testID) {
        this.testID = testID;
    }

    public long getSoluID() {
        return soluID;
    }

    public void setSoluID(long soluID) {
        this.soluID = soluID;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    public long getBuilderID() {
        return builderID;
    }

    public void setBuilderID(long builderID) {
        this.builderID = builderID;
    }
}
