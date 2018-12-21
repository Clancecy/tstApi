package com.testyle.model;

import java.util.Date;

public class Instrument {
    long insID;
    long insTypeID;
    String insTypeName;
    String insName;
    String insNumber;
    String manufacturer;//出厂厂商
    int isWork=1; //1正常工作，0维修中，2报废
    int isRepair=0;//0未检查，1已检查，2送检中
    Date addtime=new Date();

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getInsTypeName() {
        return insTypeName;
    }

    public void setInsTypeName(String insTypeName) {
        this.insTypeName = insTypeName;
    }

    public int getIsWork() {
        return isWork;
    }

    public void setIsWork(int isWork) {
        this.isWork = isWork;
    }

    public int getIsRepair() {
        return isRepair;
    }

    public void setIsRepair(int isRepair) {
        this.isRepair = isRepair;
    }

    public long getInsID() {
        return insID;
    }

    public void setInsID(long insID) {
        this.insID = insID;
    }

    public long getInsTypeID() {
        return insTypeID;
    }

    public void setInsTypeID(long insTypeID) {
        this.insTypeID = insTypeID;
    }

    public String getInsName() {
        return insName;
    }

    public void setInsName(String insName) {
        this.insName = insName;
    }

    public String getInsNumber() {
        return insNumber;
    }

    public void setInsNumber(String insNumber) {
        this.insNumber = insNumber;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}
