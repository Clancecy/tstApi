package com.testyle.model;

import java.util.Date;

public class PlanDan {
    long planDanID=-1;
    String planDanName;
    String planDanNumber;
    long planID=-1;
    int status=0;
    Date date=new Date();

    public long getPlanDanID() {
        return planDanID;
    }

    public void setPlanDanID(long planDanID) {
        this.planDanID = planDanID;
    }

    public String getPlanDanName() {
        return planDanName;
    }

    public void setPlanDanName(String planDanName) {
        this.planDanName = planDanName;
    }

    public String getPlanDanNumber() {
        return planDanNumber;
    }

    public void setPlanDanNumber(String planDanNumber) {
        this.planDanNumber = planDanNumber;
    }

    public long getPlanID() {
        return planID;
    }

    public void setPlanID(long planID) {
        this.planID = planID;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
