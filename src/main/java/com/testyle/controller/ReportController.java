package com.testyle.controller;

import com.alibaba.fastjson.JSON;
import com.testyle.common.ResContent;
import com.testyle.common.Utils;
import com.testyle.dao.IReportProFileDao;
import com.testyle.model.*;
import com.testyle.service.*;
import okhttp3.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.RescaleOp;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/report")
public class ReportController {
    @Resource
    private IReportService reportService;
    @Resource
    private IReportProFileService reportProFileService;
    @Resource
    private ITaskService taskService;
    @Resource
    private ITaskProService taskProService;
    @Resource
    private ITaskUserService taskUserService;
    @Resource
            private ITaskDanService taskDanService;

    String charact = "UTF-8";
    @Value("${EsUrl}")
    String EsUrl;

    @RequestMapping("/list")
    public void getReportList(Report report, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();

        List<Report> reportList = new ArrayList<>();
        reportList = reportService.select(report);
        if (reportList.size() == 0) {
            resContent.setCode(103);
            resContent.setMessage("没有数据");
        } else {
            resContent.setCode(101);
            resContent.setMessage("获取成功");
            resContent.setData(reportList);
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();

    }


    @RequestMapping("/create")
    public void creatReport(Report report, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        long reportID = report.getReportID();
        ResContent resContent = new ResContent();
        if (reportID == -1 ) {
            resContent.setCode(103);
            resContent.setMessage("参数错误");
        } else {
            List<Report> reportList = reportService.select(report);
            if (reportList.size() == 0) {
                resContent.setCode(104);
                resContent.setMessage("报告不存在");
            } else {
                report=reportList.get(0);
                ReportProFile reportProFile = new ReportProFile();
                reportProFile.setReportID(reportID);
                List<ReportProFile> reportProFileList = reportProFileService.select(reportProFile);
                if (reportProFileList == null || reportProFileList.size() == 0) {
                    resContent.setCode(102);
                    resContent.setMessage("没有项目信息");
                } else {
                    List<String> urlList = new ArrayList<>();
                    for (ReportProFile file : reportProFileList) {
                        urlList.add(file.getUrl());
                    }
                    OkHttpClient okHttpClient = new OkHttpClient.Builder().build();
                    String url = EsUrl + "report/create";
                    FormBody formBody = new FormBody.Builder()
                            .add("reportName", report.getReportName())
                            .add("fnameList", JSON.toJSONString(urlList))
                            .build();
                    Request req = new Request.Builder().url(url)
                            .post(formBody)
                            .build();
                    Call call = okHttpClient.newCall(req);
                    Response response1 = call.execute();
                    String Str = response1.body().string();
                    resContent = JSON.parseObject(Str, ResContent.class);
                    report.setUrl(resContent.getData().toString());
                    int count=reportService.update(report);
                }
            }
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

//    @RequestMapping("/add")
//    public void addReport(Report report, HttpServletResponse response) throws IOException {
//        response.setCharacterEncoding(charact);
//        ResContent resContent = new ResContent();
//        if (report.getTestID() == -1) {
//            resContent.setCode(103);
//            resContent.setMessage("参数错误");
//        } else {
//            report.setReportCode(Utils.getNumberForPK());
//            reportService.insert(report);
//            addTaskDan(report.getTestID(),report.getReportID(),"report");
//            List<ReportProFile> reportProFileList = new ArrayList<>();
//            addListReportProFile(report.getTestID(), report.getReportID(), reportProFileList);
//            if (reportProFileList.size() == 0) {
//                resContent.setCode(104);
//                resContent.setMessage("没有任务或者任务中没有项目");
//            } else {
//                int count = reportProFileService.insertList(reportProFileList);
//                Utils.dealForAdd(resContent, count);
//            }
//        }
//        response.getWriter().write(JSON.toJSONString(resContent));
//        response.getWriter().close();
//    }
//
//    private void addListReportProFile(long testID, long reportID, List<ReportProFile> reportProFileList) {
//        Task task = new Task();
//        task.setTestID(testID);
//        List<Task> taskList = taskService.select(task);
//        PlanController.dealReportProFile(reportID, reportProFileList, taskList, taskProService);
//    }
//    private void addTaskDan(long testID, long reportID,String name) {
//        Task task = new Task();
//        task.setTestID(testID);
//        List<Task> taskList = taskService.select(task);
//        for (Task temp : taskList) {
//            TaskDan taskDan=new TaskDan();
//            taskDan.setTaskDanName(name+"-任务单"+Utils.getNumberForPK());
//            taskDan.setTaskID(temp.getTaskID());
//            taskDan.setReportID(reportID);
//            taskDanService.insert(taskDan);
//        }
//    }
}
