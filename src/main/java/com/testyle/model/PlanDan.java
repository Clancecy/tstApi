package com.testyle.model;

import java.util.Date;

public class PlanDan {
    long planDanID=-1;
    String planDanNumber;
    int cycType=0;
    Date cyctime=new Date();
    long staID=-1;
    long planID=-1;
    String planName;
    long builderID=-1;
    String builder;
    long leaderID=-1;
    String leader;
    int status=0;
    Date addtime=new Date();
    Date endtime;
    String testRate;
    String taskRate;

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

    public int getCycType() {
        return cycType;
    }

    public void setCycType(int cycType) {
        this.cycType = cycType;
    }

    public Date getCyctime() {
        return cyctime;
    }

    public void setCyctime(Date cyctime) {
        this.cyctime = cyctime;
    }

    public long getStaID() {
        return staID;
    }

    public void setStaID(long staID) {
        this.staID = staID;
    }

    public long getPlanID() {
        return planID;
    }

    public void setPlanID(long planID) {
        this.planID = planID;
    }

    public String getPlanName() {
        return planName;
    }

    public void setPlanName(String planName) {
        this.planName = planName;
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

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public String getTestRate() {
        return testRate;
    }

    public void setTestRate(String testRate) {
        this.testRate = testRate;
    }

    public String getTaskRate() {
        return taskRate;
    }

    public void setTaskRate(String taskRate) {
        this.taskRate = taskRate;
    }
}
