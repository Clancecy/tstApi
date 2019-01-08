package com.testyle.model;

import java.util.Date;

public class ReportTask {
    long ID=-1;
    long taskID=-1;
    long reportID=-1;
    String taskName;
    int status=-1;
    Date addtime =new Date();

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public long getID() {
        return ID;
    }

    public void setID(long ID) {
        this.ID = ID;
    }

    public long getTaskID() {
        return taskID;
    }

    public void setTaskID(long taskID) {
        this.taskID = taskID;
    }

    public long getProID() {
        return reportID;
    }

    public void setProID(long reportID) {
        this.reportID = reportID;
    }


    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}
