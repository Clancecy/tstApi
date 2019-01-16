package com.testyle.model;

import java.util.Date;
import java.util.List;

public class Analysis {
    long analyID=-1;
    String analyName;
    long proID=-1;
    String proName;
    long builderID=-1;
    String builder;
    long  typeID=-1;
    String typeName;
    Date addtime=new Date();

    List<AnalysisItem> analysisItemList;


    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public long getTypeID() {
        return typeID;
    }

    public void setTypeID(long typeID) {
        this.typeID = typeID;
    }

    public List<AnalysisItem> getAnalysisItemList() {
        return analysisItemList;
    }

    public void setAnalysisItemList(List<AnalysisItem> analysisItemList) {
        this.analysisItemList = analysisItemList;
    }

    public long getAnalyID() {
        return analyID;
    }

    public void setAnalyID(long analyID) {
        this.analyID = analyID;
    }

    public String getAnalyName() {
        return analyName;
    }

    public void setAnalyName(String analyName) {
        this.analyName = analyName;
    }

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


    public long getBuilderID() {
        return builderID;
    }

    public void setBuilderID(long builderID) {
        this.builderID = builderID;
    }

    public String getBuilder() {
        return builder;
    }

    public void setBuilder(String builder) {
        this.builder = builder;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}
