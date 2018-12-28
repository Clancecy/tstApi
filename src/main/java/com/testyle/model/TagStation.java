package com.testyle.model;

import java.util.Date;

public class TagStation {
    long ID=-1;
    long tagID=-1;
    String tagName;
    long staID=-1;
    String staName;
    Date addtime=new Date();

    public String getStaName() {
        return staName;
    }

    public void setStaName(String staName) {
        this.staName = staName;
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

    public long getStaID() {
        return staID;
    }

    public void setStaID(long staID) {
        this.staID = staID;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}
