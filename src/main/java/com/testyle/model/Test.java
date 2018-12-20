package com.testyle.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Test {
    long testID = -1;
    String testName;
    long soluID=-1;
    String soluName;
    long devID=-1;
    String devName;
    long leaderID=-1;
    String userName;
    Date addtime=new Date();

    public String getTestName() {
        return testName;
    }

    public void setTestName(String testName) {
        this.testName = testName;
    }

    List<TestUser> testUserList;

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

    public String getDevName() {
        return devName;
    }

    public void setDevName(String devName) {
        this.devName = devName;
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

    public long getDevID() {
        return devID;
    }

    public void setDevID(long devID) {
        this.devID = devID;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    public long getLeaderID() {
        return leaderID;
    }

    public void setLeaderID(long leaderID) {
        this.leaderID = leaderID;
    }
}
