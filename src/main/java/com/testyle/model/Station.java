package com.testyle.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Station {
    private long staID=-1;
    private String staName;
    private long pStaID=-1;
    String pStaName;
    private int depth;
    private int order;
    private float longitude;
    private float latitude;
    String address;
    String tagString;
    int devCount=0;
    private Date addtime =new Date();

    private List<Station> childSta=new ArrayList<Station>();
    List<StationFile> fileList;

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

    public long getpStaID() {
        return pStaID;
    }

    public void setpStaID(long pStaID) {
        this.pStaID = pStaID;
    }

    public String getpStaName() {
        return pStaName;
    }

    public void setpStaName(String pStaName) {
        this.pStaName = pStaName;
    }

    public int getDepth() {
        return depth;
    }

    public void setDepth(int depth) {
        this.depth = depth;
    }

    public int getOrder() {
        return order;
    }

    public void setOrder(int order) {
        this.order = order;
    }

    public float getLongitude() {
        return longitude;
    }

    public void setLongitude(float longitude) {
        this.longitude = longitude;
    }

    public float getLatitude() {
        return latitude;
    }

    public void setLatitude(float latitude) {
        this.latitude = latitude;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTagString() {
        return tagString;
    }

    public void setTagString(String tagString) {
        this.tagString = tagString;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    public List<Station> getChildSta() {
        return childSta;
    }

    public void setChildSta(List<Station> childSta) {
        this.childSta = childSta;
    }

    public List<StationFile> getFileList() {
        return fileList;
    }

    public void setFileList(List<StationFile> fileList) {
        this.fileList = fileList;
    }
}
