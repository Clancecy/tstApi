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
    String builder;
    long leaderID=-1;
    String leader;
    Date endtime;
    String url;
    int status=-1;
    Date addtime=new Date();

    String taskRate;

    List<TestUser> testUserList;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public long getTestID() {
        return testID;
    }

    public void setTestID(long testID) {
        this.testID = testID;
    }

    public String getTestNumber() {
        return testNumber;
    }

    public void setTestNumber(String testNumber) {
        this.testNumber = testNumber;
    }

    public long getSoluID() {
        return soluID;
    }

    public void setSoluID(long soluID) {
        this.soluID = soluID;
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

    public String getSoluName() {
        return soluName;
    }

    public void setSoluName(String soluName) {
        this.soluName = soluName;
    }

    public long getBuilderID() {
        return builderID;
    }

    public void setBuilderID(long builderID) {
        this.builderID = builderID;
    }

    public String getBuilder() {
        return builder;
    }

    public void setBuilder(String builder) {
        this.builder = builder;
    }

    public long getLeaderID() {
        return leaderID;
    }

    public void setLeaderID(long leaderID) {
        this.leaderID = leaderID;
    }

    public String getLeader() {
        return leader;
    }

    public void setLeader(String leader) {
        this.leader = leader;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    public List<TestUser> getTestUserList() {
        return testUserList;
    }

    public void setTestUserList(List<TestUser> testUserList) {
        this.testUserList = testUserList;
    }

    public String getTaskRate() {
        return taskRate;
    }

    public void setTaskRate(String taskRate) {
        this.taskRate = taskRate;
    }
}
