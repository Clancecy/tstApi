package com.testyle.model;

import java.util.Date;

public class ES {
    long ID=-1;
    String ESUrl;
    Date addtime;

    public long getID() {
        return ID;
    }

    public void setID(long ID) {
        this.ID = ID;
    }

    public String getESUrl() {
        return ESUrl;
    }

    public void setESUrl(String ESUrl) {
        this.ESUrl = ESUrl;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}
