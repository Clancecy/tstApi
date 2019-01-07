package com.testyle.model;

import java.util.Date;
import java.util.List;

public class Solution {
    long soluID=-1;
    String soluName;
    long devTypeID = -1;
    long builderID = -1;
    String userRealName;
    Date addtime=new Date();
    List<SoluPro> pros;

    public long getSoluID() {
        return soluID;
    }

    public void setSoluID(long soluID) {
        this.soluID = soluID;
    }

    public String getSoluName() {
        return soluName;
    }

    public void setSoluName(String soluName) {
        this.soluName = soluName;
    }

    public long getDevTypeID() {
        return devTypeID;
    }

    public void setDevTypeID(long devTypeID) {
        this.devTypeID = devTypeID;
    }


    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    public List<SoluPro> getPros() {
        return pros;
    }

    public void setPros(List<SoluPro> pros) {
        this.pros = pros;
    }

    public long getBuilderID() {
        return builderID;
    }

    public void setBuilderID(long builderID) {
        this.builderID = builderID;
    }

    public String getUserRealName() {
        return userRealName;
    }

    public void setUserRealName(String userRealName) {
        this.userRealName = userRealName;
    }
}
