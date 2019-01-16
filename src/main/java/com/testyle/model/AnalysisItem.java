package com.testyle.model;

import java.util.Date;

public class AnalysisItem {
    long ID=-1;
    long analyID=-1;
    long itemID=-1;
    String itemName;
    Date addtime =new Date();

    public long getID() {
        return ID;
    }

    public void setID(long ID) {
        this.ID = ID;
    }

    public long getAnalyID() {
        return analyID;
    }

    public void setAnalyID(long analyID) {
        this.analyID = analyID;
    }

    public long getItemID() {
        return itemID;
    }

    public void setItemID(long itemID) {
        this.itemID = itemID;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}
