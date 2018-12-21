package com.testyle.model;

import java.util.Date;

public class PlanTest {
    long ID=-1;
    long planID=-1;
    long soluID=-1;
    String soluName;
    Date addtime=new Date();

    public long getID() {
        return ID;
    }

    public void setID(long ID) {
        this.ID = ID;
    }

    public long getPlanID() {
        return planID;
    }

    public void setPlanID(long planID) {
        this.planID = planID;
    }

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

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}
