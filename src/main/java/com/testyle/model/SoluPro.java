package com.testyle.model;

import java.util.Date;

public class SoluPro {
    long ID=-1;
    long soluID=-1;
    long proID=-1;
    String proName;
    Date addtime=new Date();

    public long getProID() {
        return proID;
    }

    public void setProID(long proID) {
        this.proID = proID;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public long getID() {
        return ID;
    }

    public void setID(long ID) {
        this.ID = ID;
    }

    public long getSoluID() {
        return soluID;
    }

    public void setSoluID(long SoluID) {
        this.soluID = SoluID;
    }


    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}
