package com.testyle.model;

import java.util.Date;

public class PlanDan {
    long planDanID=-1;
    String planDanNumber;
    int cycType=0;
    Date cycTime=new Date();
    long staID=-1;
    long planID=-1;
    String planName;
    int status=0;
    Date date=new Date();

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

    public Date getCycTime() {
        return cycTime;
    }

    public void setCycTime(Date cycTime) {
        this.cycTime = cycTime;
    }

    public long getStaID() {
        return staID;
    }

    public void setStaID(long staID) {
        this.staID = staID;
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
