package com.testyle.model;

import java.util.Date;

public class Tag {
    long tagID=-1;
    String tagName;
    int tagType=-1;
    long pTagID=-1;
    Date addtime=new Date();


    public long getpTagID() {
        return pTagID;
    }

    public void setpTagID(long pTagID) {
        this.pTagID = pTagID;
    }

    public long getTagID() {
        return tagID;
    }

    public void setTagID(long tagID) {
        this.tagID = tagID;
    }

    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    public int getTagType() {
        return tagType;
    }

    public void setTagType(int tagType) {
        this.tagType = tagType;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}
