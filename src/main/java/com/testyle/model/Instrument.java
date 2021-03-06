package com.testyle.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Instrument {
    long insID=-1;
    String insName;
    String insNumber;
    String factory;//出厂厂商
    String initNumber;
    String modNumber;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    Date usetime;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    Date inittime;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    Date valtime;
    int status=-1;
    String insUrl;
    String plateUrl;
    String remark;
    Date addtime=new Date();

    List<InstrumentFile> fileList=new ArrayList<>();

    public String getModNumber() {
        return modNumber;
    }

    public void setModNumber(String modNumber) {
        this.modNumber = modNumber;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public List<InstrumentFile> getFileList() {
        return fileList;
    }

    public void setFileList(List<InstrumentFile> fileList) {
        this.fileList = fileList;
    }

    public String getInsUrl() {
        return insUrl;
    }

    public void setInsUrl(String insUrl) {
        this.insUrl = insUrl;
    }

    public String getPlateUrl() {
        return plateUrl;
    }

    public void setPlateUrl(String plateUrl) {
        this.plateUrl = plateUrl;
    }

    public long getInsID() {
        return insID;
    }

    public void setInsID(long insID) {
        this.insID = insID;
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

    public String getFactory() {
        return factory;
    }

    public void setFactory(String factory) {
        this.factory = factory;
    }

    public String getInitNumber() {
        return initNumber;
    }

    public void setInitNumber(String initNumber) {
        this.initNumber = initNumber;
    }

    public Date getUsetime() {
        return usetime;
    }

    public void setUsetime(Date usetime) {
        this.usetime = usetime;
    }

    public Date getInittime() {
        return inittime;
    }

    public void setInittime(Date inittime) {
        this.inittime = inittime;
    }

    public Date getValtime() {
        return valtime;
    }

    public void setValtime(Date valtime) {
        this.valtime = valtime;
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
}
