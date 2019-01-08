package com.testyle.model;

import java.util.Date;

public class TaskDan {
    long taskDanID=-1;
    String taskDanName;
    long reportID=-1;
    long taskID=-1;
    int status=-1;
    Date addtime=new Date();

    public String getTaskDanName() {
        return taskDanName;
    }

    public void setTaskDanName(String taskDanName) {
        this.taskDanName = taskDanName;
    }

    public long getTaskDanID() {
        return taskDanID;
    }

    public void setTaskDanID(long taskDanID) {
        this.taskDanID = taskDanID;
    }

    public long getReportID() {
        return reportID;
    }

    public void setReportID(long reportID) {
        this.reportID = reportID;
    }

    public long getTaskID() {
        return taskID;
    }

    public void setTaskID(long taskID) {
        this.taskID = taskID;
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
}
