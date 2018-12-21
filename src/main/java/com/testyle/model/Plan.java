package com.testyle.model;

import java.util.Date;
import java.util.List;

public class Plan {
    long planID=-1;
    String planName;
//    long staID=-1;
    int cycType=-1; //0：不循环，1：每天，2：每周，3：每月，4：每个季度，5：每年
//    Date firsttime=new Date();
//    Date cyctime=new Date();
    int status=0; //0未执行，1已执行，2停止执行
    Date addtime=new Date();
    List<PlanTest> planTestList;


    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public List<PlanTest> getPlanTestList() {
        return planTestList;
    }

    public void setPlanTestList(List<PlanTest> planTestList) {
        this.planTestList = planTestList;
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

    public int getCycType() {
        return cycType;
    }

    public void setCycType(int cycType) {
        this.cycType = cycType;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}
