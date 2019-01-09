package com.testyle.controller;

import com.alibaba.fastjson.JSON;
import com.sun.xml.internal.ws.policy.privateutil.PolicyUtils;
import com.testyle.common.ResContent;
import com.testyle.common.Utils;
import com.testyle.model.*;
import com.testyle.service.*;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("planDan")
public class PlanDanController {
    String charact = "UTF-8";
    @Resource
    private IPlanDanService planDanService;
    @Resource
    private IPlanService planService;
    @Resource
    private IPlanTestService planTestService;
    @Resource
    private ITestService testService;
    @Resource
    private ITaskService taskService;

    @RequestMapping("/list")
    public void planDanList(PlanDan planDan, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        List<PlanDan> planDanList = new ArrayList<>();
        planDanList = planDanService.select(planDan);
        if (planDanList.size() == 0) {
            resContent.setCode(102);
            resContent.setMessage("没有数据");
        } else {
            resContent.setMessage("获取成功");
            resContent.setCode(101);
            for (PlanDan t:planDanList){
                t.setTestRate(getTestRate(t.getPlanDanID()));
                t.setTaskRate(getTaskRate(t.getPlanDanID()));
            }
            resContent.setData(planDanList);
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/add")
    public void addPlan(PlanDan planDan, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        if (1!=1) {
            resContent.setCode(103);
            resContent.setMessage("参数错误");
        } else {
//            Plan plan=planService.selectByID(planDan.getPlanID());
//            int cycType=plan.getCycType();
//            planDan.setCycType(cycType);
            planDan.setPlanDanNumber(Utils.getNumberForPK());
            planDan.setStatus(0);
            int count = planDanService.insert(planDan);
            Utils.dealForAdd(resContent, count);
            resContent.setData(planDan);
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/update")
    public void updatePlan(PlanDan planDan, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
//        List<Long> testIDs = JSON.parseArray(request.getParameter("tests"), Long.class);
        if (planDan.getPlanDanID() == -1) {
            resContent.setCode(103);
            resContent.setMessage("参数错误");
        } else {
            Utils.claCyctime(planDan);
            int count = planDanService.update(planDan);
            Utils.dealForUpdate(count, resContent);
            resContent.setData(planDan);
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/delete")
    public void deleteTest(PlanDan planDan, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        if (planDan.getPlanDanID() == -1) {
            resContent.setCode(103);
            resContent.setMessage("参数错误");
        } else {
            int count = planDanService.delete(planDan.getPlanDanID());
            Utils.dealForDel(count, resContent);
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }
    @RequestMapping("/show")
    public void showPlanDan(HttpServletRequest request,HttpServletResponse response)throws IOException{
        response.setCharacterEncoding(charact);
        ResContent resContent=new ResContent();
        try {
            long planDanID=Long.parseLong(request.getParameter("planDanID"));
            PlanDan planDan=planDanService.select(planDanID);
            planDan.setTestRate(getTestRate(planDanID));
            planDan.setTaskRate(getTaskRate(planDanID));
            resContent.setCode(101);
            resContent.setMessage("获取成功");
            resContent.setData(planDan);
        }catch (NumberFormatException ne){
            resContent.setCode(103);
            resContent.setMessage(ne.getMessage());
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

//    @RequestMapping("/getTest")
//    public void getTestList(HttpServletRequest request,HttpServletResponse response)throws IOException{
//        response.setCharacterEncoding(charact);
//        ResContent resContent=new ResContent();
//        try {
//            long planDanID=Long.parseLong(request.getParameter("planDanID"));
//            Test test=new Test();
//            test.setPlanDanID(planDanID);
//            List<Test> testList=testService.select(test);
//            resContent.setCode(101);
//            resContent.setMessage("获取成功");
//            resContent.setData(testList);
//        }catch (NumberFormatException ne){
//            resContent.setCode(103);
//            resContent.setMessage(ne.getMessage());
//        }
//        response.getWriter().write(JSON.toJSONString(resContent));
//        response.getWriter().close();
//    }

    @RequestMapping("/load")
    public void loadPlan(HttpServletRequest request,HttpServletResponse response)throws IOException{
        response.setCharacterEncoding(charact);
        ResContent resContent=new ResContent();
        try {
            long planID = Long.parseLong(request.getParameter("planID"));
            long planDanID=Long.parseLong(request.getParameter("planDanID"));
            PlanDan planDan=planDanService.select(planDanID);
            planDan.setPlanID(planID);
            addTest(planDan);
            resContent.setCode(101);
            resContent.setMessage("导入成功");
        }catch (NumberFormatException ne){
            resContent.setCode(103);
            resContent.setMessage(ne.getMessage());
        }catch (Exception e){
            resContent.setCode(104);
            resContent.setMessage(e.getMessage());
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/save")
    public void savePlan(Plan plan,HttpServletRequest request,HttpServletResponse response)throws IOException{
        response.setCharacterEncoding(charact);
        ResContent resContent=new ResContent();
        long planDanID=Long.parseLong(request.getParameter("planDanID"));
        Test test=new Test();
        test.setPlanDanID(planDanID);
        List<Test> testList=testService.select(test);
        plan.setBuilderID(1);
        planService.insert(plan);
        long planID=plan.getPlanID();
        int count=addPlanTest(testList,planID);
        Utils.dealForAdd(resContent,count);
        resContent.setMessage("保存成功");
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    private int addPlanTest(List<Test> testList, long planID) {
        List<PlanTest> planTestList=new ArrayList<>();
        for(Test test:testList){
            PlanTest planTest=new PlanTest();
            planTest.setPlanID(planID);
            planTest.setSoluID(test.getSoluID());
            planTestList.add(planTest);
        }
        return planTestService.insertList(planTestList);
    }

    String getTestRate(long planDanID){
        Test test=new Test();
        test.setPlanDanID(planDanID);
        long testCount=testService.getCount(test);
        test.setStatus(1);
        long doneCount=testService.getCount(test);
        return doneCount+"/"+testCount;
    }

    String getTaskRate(long planDanID){
        Test test=new Test();
        test.setPlanDanID(planDanID);
        List<Test> testList=testService.select(test);
        long taskCount=0;
        long doneCount=0;
        for(Test test1:testList){
            Task task =new Task();
            task.setTestID(test1.getTestID());
            long temp=taskService.getCount(task);
            taskCount+=temp;
            task.setStatus(1);
            temp=taskService.getCount(task);
            doneCount+=temp;
        }
        return doneCount+"/"+taskCount;
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
        PlanDan planDan = new PlanDan();
        List<PlanDan> planDanList = planDanService.select(planDan);
        addNewPlanDan(planDanList);

    }

    private void addNewPlanDan(List<PlanDan> planDanList) {
        Date curDate = new Date();
        SimpleDateFormat dft = new SimpleDateFormat("yyyy-MM-dd");
        String curdf = dft.format(curDate);
        for (PlanDan planDan : planDanList) {
            String cycdf = dft.format(planDan.getCyctime());
            System.out.println("当前时间：" + curdf + "," + "计划时间：" + cycdf);
            if (curdf.equals(cycdf)) {
                PlanDan newPlanDan = new PlanDan();
                newPlanDan.setPlanDanNumber(Utils.getNumberForPK());
                newPlanDan.setPlanID(planDan.getPlanID());
                newPlanDan.setStatus(0);
                newPlanDan.setCycType(planDan.getCycType());
                newPlanDan.setCyctime(planDan.getCyctime());
                Utils.claCyctime(newPlanDan);
                newPlanDan.setStaID(planDan.getStaID());
                newPlanDan.setBuilderID(planDan.getBuilderID());
                newPlanDan.setLeaderID(planDan.getLeaderID());
                planDanService.insert(newPlanDan);
                addSolu(newPlanDan);
            }
        }
    }

    void addSolu(PlanDan planDan){
        Test test=new Test();
        test.setPlanDanID(planDan.getPlanDanID());
        List<Test> testList=testService.select(test);
        for (Test temp : testList) {
            Test newTest = new Test();
            newTest.setSoluID(temp.getSoluID());
            newTest.setBuilderID(planDan.getBuilderID());
            newTest.setTestNumber(Utils.getNumberForPK());
            newTest.setPlanDanID(planDan.getPlanDanID());
            newTest.setStatus(0);
            testService.insert(newTest);
        }
    }

    private void addTest(PlanDan planDan) {
        PlanTest planTest = new PlanTest();
        planTest.setPlanID(planDan.getPlanID());
        List<PlanTest> planTestList = planTestService.select(planTest);
        for (PlanTest test : planTestList) {
            Test newTest = new Test();
            newTest.setSoluID(test.getSoluID());
            newTest.setBuilderID(planDan.getBuilderID());
            newTest.setTestNumber(Utils.getNumberForPK());
            newTest.setPlanDanID(planDan.getPlanDanID());
            newTest.setStatus(0);
            testService.insert(newTest);
        }
    }
}
