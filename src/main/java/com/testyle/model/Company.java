package com.testyle.model;

import java.util.Date;

public class Company {
    long compID = -1;
    String compName;
    String compZM;
    Date addtime=new Date();

    public long getCompID() {
        return compID;
    }

    public void setCompID(long compID) {
        this.compID = compID;
    }

    public String getCompName() {
        return compName;
    }

    public void setCompName(String compName) {
        this.compName = compName;
    }

    public String getCompZM() {
        return compZM;
    }

    public void setCompZM(String compZM) {
        this.compZM = compZM;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

}
