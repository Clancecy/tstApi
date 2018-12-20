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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/task")
public class TaskController {
    @Resource
    private ITaskService taskService;
    @Resource
    private ITaskUserService taskUserService;
    @Resource
    private ITaskProService taskProService;
    @Resource
    private IReportProFileService reportProFileService;
    @Resource
    private ITestService testService;
    @Resource
            private IReportService reportService;
    String charact = "UTF-8";

    @RequestMapping("/add")
    public void addTask(Task task, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        List<Long> userIDs = (JSON.parseArray(request.getParameter("users"), Long.class));
        List<TaskPro> pros = (JSON.parseArray(request.getParameter("pros"), TaskPro.class));
        if (task.getTestID() == -1 ||
                task.getWorkerID() == -1) {
            resContent.setCode(103);
            resContent.setMessage("参数错误");
        } else {
            int count = taskService.insert(task);
            if (count > 0) {
                count = addListTaskUser(task.getTaskID(), userIDs);
                addListTaskPro(task.getTaskID(), pros);
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
    public void updateTask(Task task, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();

        List<Long> userIDs = JSON.parseArray(request.getParameter("users"), Long.class);
        List<TaskPro> pros = (JSON.parseArray(request.getParameter("pros"), TaskPro.class));
        if (task.getTestID() == -1 ||
                task.getWorkerID() == -1 ||
                task.getTaskID() == -1) {
            resContent.setCode(103);
            resContent.setMessage("参数错误");
        } else {
            int count = taskService.update(task);
            if (count > 0) {
                count = taskUserService.delete(task.getTaskID());
                taskProService.delete(task.getTaskID());
                if (count > 0) {
                    count = addListTaskUser(task.getTaskID(), userIDs);
                    addListTaskPro(task.getTaskID(), pros);
                    Utils.dealForUpdate(count, resContent);
                } else {
                    resContent.setCode(104);
                    resContent.setMessage("新建失败");
                }
            }
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/list")
    public void getTask(Task task, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        List<Task> taskList = new ArrayList<>();
        taskList = taskService.select(task);
        if (taskList.size() == 0) {
            resContent.setCode(103);
            resContent.setMessage("没有数据");
        } else {
            resContent.setCode(101);
            resContent.setMessage("获取成功");
            getTaskUserList(taskList);
            getTaskProList(taskList);
            resContent.setData(taskList);
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();

    }

    @RequestMapping("/delete")
    public void deleteTask(Task task, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        if (task.getTaskID() == -1) {
            resContent.setCode(103);
            resContent.setMessage("参数错误");
        } else {
            taskUserService.delete(task.getTaskID());
            taskProService.delete(task.getTaskID());
            int count = taskService.delete(task.getTaskID());
            Utils.dealForDel(count, resContent);
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/userTask")
    public void getTaskByUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        long userID = Long.parseLong(request.getParameter("userID"));
        if (userID == 0) {
            resContent.setCode(103);
            resContent.setMessage("参数错误");
        } else {
            TaskUser taskUser = new TaskUser();
            taskUser.setUserID(userID);
            List<TaskUser> taskUserList = taskUserService.select(taskUser);
            if (taskUserList.size() == 0) {
                resContent.setCode(102);
                resContent.setMessage("没有未完成任务");
            } else {
                List<Long> taskIDtemps = new ArrayList<>();
                for (TaskUser user : taskUserList) {
                    taskIDtemps.add(user.getTaskID());
                }
                List<ReportProFile> reportProFileList = reportProFileService.selectByTask(taskIDtemps);
                if (reportProFileList.size() == 0) {
                    resContent.setCode(103);
                    resContent.setMessage("没有未完成任务");
                }else
                {
                    List<Long> taskIDs = new ArrayList<>();
                    Map<Long,Long> taskRep=new HashMap<>();
                    Map<Long,Integer> taskStaust=new HashMap<>();
                    for (ReportProFile proFile : reportProFileList) {
                        taskIDs.add(proFile.getTaskID());
                        taskRep.put(proFile.getTaskID(),proFile.getReportID());
                        taskStaust.put(proFile.getTaskID(),proFile.getStatus());
                    }
                    List<Task> taskList = taskService.selectList(taskIDs);
                    resContent.setCode(101);
                    resContent.setMessage("获取成功");
                    getTaskUserList(taskList);
                    getTaskProList(taskList,taskStaust);
                    getReport(taskList, taskRep);
                    getTest(taskList);
                    resContent.setData(taskList);
                }
            }
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    private void getTest(List<Task> taskList) {
        for (Task task : taskList) {
            Test test = new Test();
            test.setTestID(task.getTestID());
            List<Test> testList = testService.select(test);
            test=testList.get(0);
            task.setTestLeaderID(test.getLeaderID());
            task.setTestLeaderName(test.getUserName());
        }
    }

    private void getReport(List<Task> taskList, Map<Long, Long> taskRep) {
        for (Task task : taskList) {
            long taskID=task.getTaskID();
            long reportID=taskRep.get(taskID);
            Report report=new Report();
            report.setReportID(reportID);
            List<Report> reportList=reportService.select(report);
            report=reportList.get(0);
            task.setReportID(reportID);
            task.setReportName(report.getReportName());
        }
    }

    private void getTaskUserList(List<Task> taskList) {
        List<TaskUser> taskUsers;
        for (Task task : taskList) {
            long taskID = task.getTaskID();
            TaskUser taskUser = new TaskUser();
            taskUser.setTaskID(taskID);
            taskUsers = taskUserService.select(taskUser);
            task.setTaskUserList(taskUsers);
        }
    }
    private void getTaskProList(List<Task> taskList){
        List<TaskPro> taskPros;
        for (Task task : taskList) {
            long taskID = task.getTaskID();
            TaskPro taskPro = new TaskPro();
            taskPro.setTaskID(taskID);
            taskPros = taskProService.select(taskPro);
            task.setTaskProList(taskPros);
        }
    }

    private void getTaskProList(List<Task> taskList, Map<Long,Integer> taskStaust) {
        List<TaskPro> taskPros;
        for (Task task : taskList) {
            long taskID = task.getTaskID();
            TaskPro taskPro = new TaskPro();
            taskPro.setTaskID(taskID);
            taskPros = taskProService.select(taskPro);
            for (TaskPro pro:taskPros){
                pro.setStatus(taskStaust.get(taskID));
            }
            task.setTaskProList(taskPros);
        }
    }

    private int addListTaskUser(long taskID, List<Long> userIDs) {
        List<TaskUser> taskUsers = new ArrayList<>();
        dealUserIDList(taskID, userIDs, taskUsers);
        int count = taskUserService.insertList(taskUsers);
        return count;
    }

    private int addListTaskPro(long taskID, List<TaskPro> pros) {
        List<TaskPro> taskPros = new ArrayList<>();
        dealProIDList(taskID, pros, taskPros);
        int count = taskProService.insertList(taskPros);
        return count;
    }

    private void dealProIDList(long taskID, List<TaskPro> pros, List<TaskPro> taskPros) {
        for (TaskPro pro : pros) {
            pro.setTaskID(taskID);
            taskPros.add(pro);
        }
    }


    private void dealUserIDList(long taskID, List<Long> userIDs, List<TaskUser> taskUsers) {
        for (long userID : userIDs) {
            TaskUser taskUser = new TaskUser();
            taskUser.setTaskID(taskID);
            taskUser.setUserID(userID);
            taskUsers.add(taskUser);
        }
    }
}
