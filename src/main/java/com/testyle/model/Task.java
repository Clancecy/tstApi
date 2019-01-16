package com.testyle.model;

import java.util.Date;
import java.util.List;

public class Task {
    long taskID = -1;
    String taskNumber;
    long leaderID = -1;
    String leader;
    long builderID=-1;
    String builder;
    long testID = -1;
    String testNumber;
    long proID=-1;
    String proName;
    long devID=-1;
    String devName;
    String runNumber;
    long insID=-1;
    String insName;
    String insNumber;
    String url;
    String remark;
    int recordNum=-1;
    int status=-1;
    Date endtime;
    Date addtime = new Date();


    Date atime;
    Date btime;

    String staID;
    String staName;
    String address;

    public int getRecordNum() {
        return recordNum;
    }

    public void setRecordNum(int recordNum) {
        this.recordNum = recordNum;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStaID() {
        return staID;
    }

    public void setStaID(String staID) {
        this.staID = staID;
    }

    public String getStaName() {
        return staName;
    }

    public void setStaName(String staName) {
        this.staName = staName;
    }

    public Date getAtime() {
        return atime;
    }

    public void setAtime(Date atime) {
        this.atime = atime;
    }

    public Date getBtime() {
        return btime;
    }

    public void setBtime(Date btime) {
        this.btime = btime;
    }

    List<TaskUser> taskUserList;

    PlanDan planDan;

    public String getRunNumber() {
        return runNumber;
    }

    public void setRunNumber(String runNumber) {
        this.runNumber = runNumber;
    }

    public String getInsNumber() {
        return insNumber;
    }

    public void setInsNumber(String insNumber) {
        this.insNumber = insNumber;
    }

    public PlanDan getPlanDan() {
        return planDan;
    }

    public void setPlanDan(PlanDan planDan) {
        this.planDan = planDan;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public long getTaskID() {
        return taskID;
    }

    public void setTaskID(long taskID) {
        this.taskID = taskID;
    }

    public String getTaskNumber() {
        return taskNumber;
    }

    public void setTaskNumber(String taskNumber) {
        this.taskNumber = taskNumber;
    }

    public long getLeaderID() {
        return leaderID;
    }

    public void setLeaderID(long leaderID) {
        this.leaderID = leaderID;
    }

    public String getLeader() {
        return leader;
    }

    public void setLeader(String leader) {
        this.leader = leader;
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

    public long getTestID() {
        return testID;
    }

    public void setTestID(long testID) {
        this.testID = testID;
    }

    public String getTestNumber() {
        return testNumber;
    }

    public void setTestNumber(String testNumber) {
        this.testNumber = testNumber;
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

    public long getDevID() {
        return devID;
    }

    public void setDevID(long devID) {
        this.devID = devID;
    }

    public String getDevName() {
        return devName;
    }

    public void setDevName(String devName) {
        this.devName = devName;
    }

    public long getInsID() {
        return insID;
    }

    public void setInsID(long insID) {
        this.insID = insID;
    }

    public String getInsName() {
        return insName;
    }

    public void setInsName(String insName) {
        this.insName = insName;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    public List<TaskUser> getTaskUserList() {
        return taskUserList;
    }

    public void setTaskUserList(List<TaskUser> taskUserList) {
        this.taskUserList = taskUserList;
    }
}
