package com.testyle.controller;

import com.alibaba.fastjson.JSON;
import com.testyle.common.ResContent;
import com.testyle.common.Utils;
import com.testyle.model.*;
import com.testyle.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/plan")
public class PlanController {
    @Resource
    private IPlanService planService;
    @Resource
    private IPlanTestService planTestService;

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
        List<Long> soluIDs = (JSON.parseArray(request.getParameter("solus"), Long.class));
        if (plan.getPlanName() == null ||
                plan.getCycType() == -1 || soluIDs.size() == 0) {
            resContent.setCode(103);
            resContent.setMessage("参数错误");
        } else {
            int count = planService.insert(plan);
            if (count > 0) {
                count = addListPlanTest(plan.getPlanID(), soluIDs);
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
        List<Long> soluIDs = JSON.parseArray(request.getParameter("solus"), Long.class);
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
                int count = planService.update(plan);
                if (count > 0) {
                    planTestService.delete(plan.getPlanID());
                    addListPlanTest(plan.getPlanID(), soluIDs);
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


    private int addListPlanTest(long planID, List<Long> soluIDs) {
        List<PlanTest> planTests = new ArrayList<>();
        dealUserIDList(planID, soluIDs, planTests);
        int count = planTestService.insertList(planTests);
        return count;
    }

    private void dealUserIDList(long planID, List<Long> soluIDs, List<PlanTest> planTests) {
        for (long soluID : soluIDs) {
            PlanTest taskUser = new PlanTest();
            taskUser.setPlanID(planID);
            taskUser.setSoluID(soluID);
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
}
