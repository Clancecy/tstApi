package com.testyle.model;

import java.util.Date;
import java.util.List;

public class Device {
    long devID=-1;
    String devName;
    String runNumber;
    String initNumber;
    int lineNumber;
    String volStep;
    Date buildtime;
    Date usetime;
    String modNumber;
    String factory;
    int status;
    String tagString;
    String plateUrl;
    String devUrl;
    String remark;
    long devTypeID=-1;
    long staID=-1;
    String staName;
    Date addtime =new Date();

    List<DeviceFile> fileList;

    public List<DeviceFile> getFileList() {
        return fileList;
    }

    public void setFileList(List<DeviceFile> fileList) {
        this.fileList = fileList;
    }

    public long getDevID() {
        return devID;
    }

    public void setDevID(long devID) {
        this.devID = devID;
    }

    public String getDevName() {
        return devName;
    }

    public void setDevName(String devName) {
        this.devName = devName;
    }

    public String getRunNumber() {
        return runNumber;
    }

    public void setRunNumber(String runNumber) {
        this.runNumber = runNumber;
    }

    public String getInitNumber() {
        return initNumber;
    }

    public void setInitNumber(String initNumber) {
        this.initNumber = initNumber;
    }

    public int getLineNumber() {
        return lineNumber;
    }

    public void setLineNumber(int lineNumber) {
        this.lineNumber = lineNumber;
    }

    public String getVolStep() {
        return volStep;
    }

    public void setVolStep(String volStep) {
        this.volStep = volStep;
    }

    public Date getBuildtime() {
        return buildtime;
    }

    public void setBuildtime(Date buildtime) {
        this.buildtime = buildtime;
    }

    public Date getUsetime() {
        return usetime;
    }

    public void setUsetime(Date usetime) {
        this.usetime = usetime;
    }

    public String getModNumber() {
        return modNumber;
    }

    public void setModNumber(String modNumber) {
        this.modNumber = modNumber;
    }

    public String getFactory() {
        return factory;
    }

    public void setFactory(String factory) {
        this.factory = factory;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getTagString() {
        return tagString;
    }

    public void setTagString(String tagString) {
        this.tagString = tagString;
    }

    public String getPlateUrl() {
        return plateUrl;
    }

    public void setPlateUrl(String plateUrl) {
        this.plateUrl = plateUrl;
    }

    public String getDevUrl() {
        return devUrl;
    }

    public void setDevUrl(String devUrl) {
        this.devUrl = devUrl;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public long getDevTypeID() {
        return devTypeID;
    }

    public void setDevTypeID(long devTypeID) {
        this.devTypeID = devTypeID;
    }

    public long getStaID() {
        return staID;
    }

    public void setStaID(long staID) {
        this.staID = staID;
    }

    public String getStaName() {
        return staName;
    }

    public void setStaName(String staName) {
        this.staName = staName;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}
