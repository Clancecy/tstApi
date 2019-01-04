package com.testyle.model;

import java.util.Date;

public class TagDevice {
    long ID=-1;
    long tagID=-1;
    String tagName;
    long devID=-1;
    String devName;
    Date addtime=new Date();

    public String getDevName() {
        return devName;
    }

    public void setDevName(String devName) {
        this.devName = devName;
    }

    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    public long getID() {
        return ID;
    }

    public void setID(long ID) {
        this.ID = ID;
    }

    public long getTagID() {
        return tagID;
    }

    public void setTagID(long tagID) {
        this.tagID = tagID;
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
}
