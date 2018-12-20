package com.testyle.controller;

import com.alibaba.fastjson.JSON;
import com.testyle.common.ResContent;
import com.testyle.common.Utils;
import com.testyle.model.*;
import com.testyle.service.*;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.Soundbank;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/plan")
public class PlanController {
    @Resource
    private IPlanService planService;
    @Resource
    private IPlanTestService planTestService;
    @Resource
    private ITestService testService;
    @Resource
    private IReportService reportService;
    @Resource
    private IReportProFileService reportProFileService;
    @Resource
    private ITaskService taskService;
    @Resource
    private ITaskProService taskProService;
    @Resource
    private IPlanDanService planDanService;

    @Resource
    private ITaskDanService taskDanService;

    String charact = "UTF-8";

    @RequestMapping("/list")
    public void planList(Plan plan, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        List<Plan> planList = new ArrayList<>();
        planList = planService.select(plan);
        if (planList.size() == 0) {
            resContent.setCode(103);
            resContent.setMessage("没有数据");
        } else {
            resContent.setCode(101);
            resContent.setMessage("获取成功");
            getPlanTestList(planList);
            resContent.setData(planList);
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/add")
    public void addPlan(Plan plan, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        List<Long> testIDs = (JSON.parseArray(request.getParameter("tests"), Long.class));
        if (plan.getPlanName() == null ||
                plan.getCycType() == -1 || testIDs.size() == 0) {
            resContent.setCode(103);
            resContent.setMessage("参数错误");
        } else {
            plan.setCyctime(plan.getFirsttime());
            Utils.claCyctime(plan);
            int count = planService.insert(plan);
            if (count > 0) {
                count = addListPlanTest(plan.getPlanID(), testIDs);
                SimpleDateFormat dft = new SimpleDateFormat("yyyy-MM-dd");
                String curdf = dft.format(new Date());
                String firdf = dft.format(plan.getFirsttime());
                if (curdf.equals(firdf)) {
                    addPlanDan(plan);
                }
                Utils.dealForAdd(resContent, count);
            } else {
                resContent.setCode(104);
                resContent.setMessage("新建失败");
            }
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/update")
    public void updatePlan(Plan plan, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        List<Long> testIDs = JSON.parseArray(request.getParameter("tests"), Long.class);
        if (plan.getPlanName() == null ||
                plan.getCycType() == -1 ||
                plan.getPlanID() == -1) {
            resContent.setCode(103);
            resContent.setMessage("参数错误");
        } else {
            plan.setStatus(0);
            List<Plan> planList = planService.select(plan);
            if (planList.size() == 0) {
                resContent.setCode(105);
                resContent.setMessage("计划已经开始了");
            } else {
                plan.setCyctime(plan.getFirsttime());
                Utils.claCyctime(plan);
                int count = planService.update(plan);
                if (count > 0) {
                    planTestService.delete(plan.getPlanID());
                    planTestService.delete(plan.getPlanID());
                    addListPlanTest(plan.getPlanID(), testIDs);
                    Utils.dealForUpdate(count, resContent);
                } else {
                    resContent.setCode(104);
                    resContent.setMessage("更新失败");
                }
            }
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/delete")
    public void deleteTest(Plan plan, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        if (plan.getPlanID() == -1) {
            resContent.setCode(103);
            resContent.setMessage("参数错误");
        } else {
            planTestService.delete(plan.getPlanID());
            int count = planService.delete(plan.getPlanID());
            Utils.dealForDel(count, resContent);
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }


    private int addListPlanTest(long planID, List<Long> testIDs) {
        List<PlanTest> planTests = new ArrayList<>();
        dealUserIDList(planID, testIDs, planTests);
        int count = planTestService.insertList(planTests);
        return count;
    }

    private void dealUserIDList(long planID, List<Long> testIDs, List<PlanTest> planTests) {
        for (long testID : testIDs) {
            PlanTest taskUser = new PlanTest();
            taskUser.setPlanID(planID);
            taskUser.setTestID(testID);
            planTests.add(taskUser);
        }
    }


    private void getPlanTestList(List<Plan> planList) {
        List<PlanTest> planTests;
        for (Plan plan : planList) {
            long planID = plan.getPlanID();
            PlanTest planTest = new PlanTest();
            planTest.setPlanID(planID);
            planTests = planTestService.select(planTest);
            plan.setPlanTestList(planTests);
        }
    }
    /**
     * CRON表达式                含义
     "0 0 12 * * ?"            每天中午十二点触发
     "0 15 10 ? * *"            每天早上10：15触发
     "0 15 10 * * ?"            每天早上10：15触发
     "0 15 10 * * ? *"        每天早上10：15触发
     "0 15 10 * * ? 2005"    2005年的每天早上10：15触发
     "0 * 14 * * ?"            每天从下午2点开始到2点59分每分钟一次触发
     "0 0/5 14 * * ?"        每天从下午2点开始到2：55分结束每5分钟一次触发
     "0 0/5 14,18 * * ?"        每天的下午2点至2：55和6点至6点55分两个时间段内每5分钟一次触发
     "0 0-5 14 * * ?"        每天14:00至14:05每分钟一次触发
     "0 10,44 14 ? 3 WED"    三月的每周三的14：10和14：44触发
     "0 15 10 ? * MON-FRI"   每个周一、周二、周三、周四、周五的10：15触发
     */

    /**
     * 每天5点触发（清空验证码表t_captcha中的数据）
     */
    @Scheduled(cron = "0 15 01 ? * *")
    public void testTask() {
        System.out.println(System.currentTimeMillis());
        Plan plan = new Plan();
        plan.setStatus(0);
        List<Plan> planList = planService.select(plan);
        plan.setStatus(1);
        planList.addAll(planService.select(plan));
        Date curDate = new Date();
        SimpleDateFormat dft = new SimpleDateFormat("yyyy-MM-dd");
        String curdf = dft.format(curDate);
        for (Plan pt : planList) {
            String cycdf = dft.format(pt.getCyctime());
            System.out.println("当前时间：" + curdf + "," + "计划时间：" + cycdf);
            if (curdf.equals(cycdf)) {
                addPlanDan(pt);
                pt.setStatus(1);
                Utils.claCyctime(pt);
                System.out.println(pt.getPlanName() + ":" + JSON.toJSONString(pt));
                planService.update(pt);
            }
        }
    }

    public void addPlanDan(Plan plan) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        PlanDan planDan = new PlanDan();
        String name=plan.getPlanName() + sdf.format(plan.getCyctime());
        planDan.setPlanID(plan.getPlanID());
        planDan.setPlanDanNumber(Utils.getNumberForPK());
        planDan.setPlanDanName( name+ "-计划单"+planDan.getPlanDanNumber());
        planDanService.insert(planDan);
        PlanTest planTest = new PlanTest();
        planTest.setPlanID(plan.getPlanID());
        List<PlanTest> planTestList = planTestService.select(planTest);
        for (PlanTest test : planTestList) {
            Report report = new Report();
            long testID = test.getTestID();
            report.setTestID(testID);
            report.setPlanDanID(planDan.getPlanDanID());
            report.setReportCode(Utils.getNumberForPK());
            report.setReportName(name+"-试验单"+report.getReportCode());
            reportService.insert(report);
            addTaskDan(report.getTestID(),report.getReportID(),name);
            List<ReportProFile> reportProFileList = new ArrayList<>();
            addListReportProFile(report.getTestID(), report.getReportID(), reportProFileList);
            int count = reportProFileService.insertList(reportProFileList);
            System.out.println("项目数："+count);
        }
    }

    private void addTaskDan(long testID, long reportID,String name) {
        Task task = new Task();
        task.setTestID(testID);
        List<Task> taskList = taskService.select(task);
        for (Task temp : taskList) {
            TaskDan taskDan=new TaskDan();
            taskDan.setTaskDanName(name+"-任务单"+Utils.getNumberForPK());
            taskDan.setTaskID(temp.getTaskID());
            taskDan.setReportID(reportID);
            taskDanService.insert(taskDan);
        }
    }

    public void addListReportProFile(long testID, long reportID, List<ReportProFile> reportProFileList) {
        Task task = new Task();
        task.setTestID(testID);
        List<Task> taskList = taskService.select(task);
        dealReportProFile(reportID, reportProFileList, taskList, taskProService);
    }

    public static void dealReportProFile(long reportID, List<ReportProFile> reportProFileList, List<Task> taskList, ITaskProService taskProService) {
        for (Task temp : taskList) {
            TaskPro taskPro = new TaskPro();
            taskPro.setTaskID(temp.getTaskID());
            List<TaskPro> taskProList = taskProService.select(taskPro);
            for (TaskPro tp : taskProList) {
                ReportProFile reportProFile = new ReportProFile();
                reportProFile.setReportID(reportID);
                reportProFile.setTaskID(tp.getTaskID());
                reportProFile.setProID(tp.getProID());
                reportProFile.setWorkerID(temp.getWorkerID());
                reportProFileList.add(reportProFile);
            }
        }
    }
}
