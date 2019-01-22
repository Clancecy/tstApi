package com.testyle.controller;

import com.alibaba.fastjson.JSON;
import com.testyle.common.ResContent;
import com.testyle.common.Utils;
import com.testyle.model.*;
import com.testyle.service.*;
import okhttp3.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/test")
public class TestController {
    @Resource
    private ITestService testService;
    @Resource
    private ITestUserService testUserService;
    @Resource
    private ISoluProService soluProService;
    @Resource
    private ITaskService taskService;
    @Resource
    ISolutionService solutionService;
    String charact = "UTF-8";
    @Value("${EsUrl}")
    String EsUrl;

    @RequestMapping("/add")
    public void addTest(Test test, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        test.setStatus(0);
        test.setBuilderID(1);
        test.setTestNumber(Utils.getNumberForPK());
        testService.insert(test);
        resContent.setCode(101);
        resContent.setMessage("新建成功");
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/update")
    public void updateTest(Test test, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        List<Long> userIDs = JSON.parseArray(request.getParameter("userIDs"), Long.class);
        if (test.getTestID() == -1) {
            resContent.setCode(103);
            resContent.setMessage("参数错误");
        } else {
            Test oldTest = testService.select(test.getTestID());
            oldTest.setLeaderID(test.getLeaderID());
            int count = testService.update(oldTest);
            if (count > 0) {
                testUserService.delete(test.getTestID());
                count = addListTestUser(test.getTestID(), userIDs);
                Utils.dealForUpdate(count, resContent);
            }else {
                resContent.setCode(104);
                resContent.setMessage("更新失败");
            }
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/list")
    public void getTest(Test test, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        List<Test> testList = new ArrayList<>();
        testList = testService.select(test);
        for (Test t : testList) {
            t.setTaskRate(getTaskRate(t.getTestID()));
        }
        dealTestList(resContent, testList);
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/show")
    public void showTest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        try {
            long testID = Long.parseLong(request.getParameter("testID"));
            Test test = testService.select(testID);
            TestUser testUser = new TestUser();
            testUser.setTestID(testID);
            List<TestUser> testUsers = testUserService.select(testUser);
            test.setTestUserList(testUsers);
            test.setTaskRate(getTaskRate(testID));
            resContent.setCode(101);
            resContent.setMessage("获取成功");
            resContent.setData(test);
        } catch (NumberFormatException ne) {
            resContent.setCode(103);
            resContent.setMessage(ne.getMessage());
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/delete")
    public void deleteTest(Test test, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        if (test.getTestID() == -1) {
            resContent.setCode(103);
            resContent.setMessage("参数错误");
        } else {
            testUserService.delete(test.getTestID());
            int count = testService.delete(test.getTestID());
            Utils.dealForDel(count, resContent);
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

//    @RequestMapping("/planTest")
//    public void getTestByPlan(PlanTest planTest, HttpServletResponse response)throws IOException{
//        response.setCharacterEncoding(charact);
//        ResContent resContent =new ResContent();
//        List<PlanTest> planTestList=planTestService.select(planTest);
//        if(planTest.getPlanID()==-1){
//            resContent.setCode(103);
//            resContent.setMessage("参数错误");
//        }else {
//            if (planTestList.size() == 0) {
//                resContent.setCode(104);
//                resContent.setMessage("没有计划");
//            } else {
//                List<Long> testIDs = new ArrayList<>();
//                for (PlanTest test : planTestList) {
//                    testIDs.add(test.getTestID());
//                }
//                List<Test> testList = testService.selectList(testIDs);
//                dealTestList(resContent, testList);
//            }
//        }
//        response.getWriter().write(JSON.toJSONString(resContent));
//        response.getWriter().close();
//    }

    @RequestMapping("/load")
    public void loadTest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        try {
            long soluID = Long.parseLong(request.getParameter("soluID"));
            long testID = Long.parseLong(request.getParameter("testID"));
            Test test = new Test();
            test.setTestID(testID);
            test = testService.select(testID);
            test.setSoluID(soluID);
            testService.update(test);
            addTask(test);
            resContent.setCode(101);
            resContent.setMessage("导入成功");
        } catch (NumberFormatException ne) {
            resContent.setCode(103);
            resContent.setMessage(ne.getMessage());
        } catch (Exception e) {
            resContent.setCode(104);
            resContent.setMessage(e.getMessage());
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    private void addTask(Test test) {
        SoluPro soluPro = new SoluPro();
        soluPro.setSoluID(test.getSoluID());
        List<SoluPro> soluProList = soluProService.select(soluPro);
        for (SoluPro pro : soluProList) {
            Task task = new Task();
            task.setStatus(0);
            task.setTestID(test.getTestID());
            task.setBuilderID(1);
            task.setTaskNumber(Utils.getNumberForPK());
            task.setProID(pro.getProID());
            task.setProName(pro.getProName());
            taskService.insert(task);
        }
    }

    public void dealTestList(ResContent resContent, List<Test> testList) {
        if (testList.size() == 0) {
            resContent.setCode(102);
            resContent.setMessage("没有数据");
        } else {
            resContent.setCode(101);
            resContent.setMessage("获取成功");
            getTestUserList(testList);
            resContent.setData(testList);
        }
    }

    private void getTestUserList(List<Test> testList) {
        List<TestUser> testUsers;
        for (Test test : testList) {
            long testID = test.getTestID();
            TestUser testUser = new TestUser();
            testUser.setTestID(testID);
            testUsers = testUserService.select(testUser);
            test.setTestUserList(testUsers);
        }
    }

    private int addListTestUser(long testID, List<Long> userIDs) {
        List<TestUser> testUsers = new ArrayList<>();
        dealUserIDList(testID, userIDs, testUsers);
        int count = testUserService.insertList(testUsers);
        return count;
    }

    private void dealUserIDList(long testID, List<Long> userIDs, List<TestUser> testUsers) {
        for (long userID : userIDs) {
            TestUser testUser = new TestUser();
            testUser.setTestID(testID);
            testUser.setUserID(userID);
            testUsers.add(testUser);
        }
    }

    String getTaskRate(long testID) {
        long taskCount = 0;
        long doneCount = 0;
        Task task = new Task();
        task.setTestID(testID);
        taskCount = taskService.getCount(task);
        task.setStatus(1);
        doneCount = taskService.getCount(task);
        return doneCount + "/" + taskCount;
    }

    @RequestMapping("/report")
    public void report(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        try {
            long testID = Long.parseLong(request.getParameter("testID"));
            Test test = testService.select(testID);
            if (test.getStatus() != 0) {
                Task task = new Task();
                task.setTestID(testID);
                List<Task> taskList = taskService.select(task);
                List<String> pathList = new ArrayList<>();
                for (Task temp : taskList) {
                    pathList.add(temp.getUrl());
                }
                resContent.setCode(101);
                resContent.setMessage("获取成功");
                resContent.setData(pathList);
            } else {
                resContent.setCode(105);
                resContent.setMessage("试验未完成");
            }
        } catch (Exception e) {
            resContent.setCode(104);
            resContent.setMessage(e.getMessage());
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }
}
