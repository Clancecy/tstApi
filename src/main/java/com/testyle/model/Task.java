package com.testyle.model;

import java.util.Date;
import java.util.List;

public class Task {
    long taskID = -1;
    String taskName;
    long workerID = -1;
    String userName;
    long testID = -1;
    int status=0;
    Date addtime = new Date();

    List<TaskPro> taskProList;
    List<TaskUser> taskUserList;
    //json 使用
    long reportID=-1;
    String reportName;

    long testLeaderID=-1;
    String testLeaderName;

    public long getTestLeaderID() {
        return testLeaderID;
    }

    public void setTestLeaderID(long testLeaderID) {
        this.testLeaderID = testLeaderID;
    }

    public String getTestLeaderName() {
        return testLeaderName;
    }

    public void setTestLeaderName(String testLeaderName) {
        this.testLeaderName = testLeaderName;
    }

    public long getReportID() {
        return reportID;
    }

    public void setReportID(long reportID) {
        this.reportID = reportID;
    }

    public String getReportName() {
        return reportName;
    }

    public void setReportName(String reportName) {
        this.reportName = reportName;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public List<TaskPro> getTaskProList() {
        return taskProList;
    }

    public void setTaskProList(List<TaskPro> taskProList) {
        this.taskProList = taskProList;
    }

    public List<TaskUser> getTaskUserList() {
        return taskUserList;
    }

    public void setTaskUserList(List<TaskUser> taskUserList) {
        this.taskUserList = taskUserList;
    }

    public long getTaskID() {
        return taskID;
    }

    public void setTaskID(long taskID) {
        this.taskID = taskID;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public long getWorkerID() {
        return workerID;
    }

    public void setWorkerID(long workerID) {
        this.workerID = workerID;
    }

    public long getTestID() {
        return testID;
    }

    public void setTestID(long testID) {
        this.testID = testID;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}
