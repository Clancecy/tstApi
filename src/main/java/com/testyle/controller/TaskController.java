package com.testyle.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONException;
import com.testyle.common.ResContent;
import com.testyle.common.Utils;
import com.testyle.model.*;
import com.testyle.service.*;
import okhttp3.*;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.Soundbank;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
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
    private IFileService fileService;
    @Resource
    private ITaskFileService taskFileService;
    @Resource
    private ITestService testService;
    @Resource
    private IPlanDanService planDanService;
    @Resource
    private IStationService stationService;

    String charact = "UTF-8";
    @Value("${imgPath}")
    String imageRoot;
    @Value("${imgUrl}")
    String imageUrl;
    @Value("${EsUrl}")
    String EsUrl;

    @RequestMapping("/test")
    public void t(HttpServletResponse response)throws IOException{
        response.getWriter().write(JSON.toJSONString(imageRoot));
        response.getWriter().close();
    }

    @RequestMapping("/add")
    public void addTask(Task task, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
       // List<Long> userIDs = (JSON.parseArray(request.getParameter("users"), Long.class));
        if (1!=1) {
            resContent.setCode(103);
            resContent.setMessage("参数错误");
        } else {
            task.setTaskNumber(Utils.getNumberForPK());
            task.setStatus(0);
            task.setBuilderID(1);
            int count = taskService.insert(task);
            if (count > 0) {
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
        List<Long> userIDs = JSON.parseArray(request.getParameter("userIDs"), Long.class);
        if (task.getTaskID() == -1) {
            resContent.setCode(103);
            resContent.setMessage("参数错误");
        } else {
            Task t=new Task();
            t.setTaskID(task.getTaskID());
            t=taskService.select(t).get(0);
            t.setDevID(task.getDevID());
            t.setProID(task.getProID());
            t.setLeaderID(task.getLeaderID());
            int count = taskService.update(t);
            if (count > 0) {
                taskUserService.delete(task.getTaskID());
                if (count > 0) {
                    count = addListTaskUser(task.getTaskID(), userIDs);
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
            resContent.setData(taskList);
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();

    }

    @RequestMapping("/show")
    public void showTask(HttpServletRequest request,HttpServletResponse response)throws IOException{
        response.setCharacterEncoding(charact);
        ResContent resContent=new ResContent();
        try {
            long taskID=Long.parseLong(request.getParameter("taskID"));
            Task task=taskService.select(taskID);
            TaskUser taskUser = new TaskUser();
            taskUser.setTaskID(taskID);
            List<TaskUser> taskUsers = taskUserService.select(taskUser);
            task.setTaskUserList(taskUsers);
            resContent.setCode(101);
            resContent.setMessage("获取成功");
            resContent.setData(task);
        }catch (NumberFormatException ne){
            resContent.setCode(103);
            resContent.setMessage(ne.getMessage());
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
            List<Long> taskIDs = new ArrayList<>();
            addTaskIDList(taskUserList, taskIDs);
            List<Task> taskList = taskService.selectList(taskIDs);
            addStaionInfo(taskList);
            if (taskList.size() == 0) {
                resContent.setCode(102);
                resContent.setMessage("没有任务");
            } else {
                resContent.setCode(101);
                resContent.setMessage("获取成功");
                resContent.setData(taskList);
            }
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    private void addStaionInfo(List<Task> taskList) {
        for (Task task:taskList){
            Test test=testService.select(task.getTestID());
            PlanDan planDan=planDanService.select(test.getPlanDanID());
            Station station=stationService.selectStaton(planDan.getStaID());
            task.setStaID(String.valueOf(station.getStaID()));
            task.setStaName(station.getStaName());
            task.setAddress(station.getAddress());
        }
    }

    @RequestMapping("/taskFile")
    public void taskList(TaskFile taskFile,HttpServletResponse response)throws IOException{
        response.setCharacterEncoding(charact);
        ResContent resContent=new ResContent();
        List<TaskFile> taskFileList=taskFileService.select(taskFile);
        resContent.setCode(101);
        resContent.setMessage("获取成功");
        resContent.setData(taskFileList);
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/upload")
    public void doUpload(@RequestParam("files") MultipartFile[]
                                 files,HttpServletRequest request,
                         HttpServletResponse response) throws IOException{
        response.setCharacterEncoding(charact);
        ResContent resContent=new ResContent();
        String remarks=request.getParameter("remarks");
        System.out.println(remarks);
        long taskID=Long.parseLong(request.getParameter("taskID"));
        int fileType=Integer.parseInt(request.getParameter("fileType"));
        try {
            TaskFile temp=new TaskFile();
            temp.setTaskID(taskID);
            temp.setFileType(fileType);
            taskFileService.delete(temp);
            List<String> remarkList=JSON.parseArray(remarks,String.class);
            int index=0;
            for(MultipartFile file:files){
                if (!file.isEmpty()) {
                    FileUtils.copyInputStreamToFile(file.getInputStream(), new File(
                            imageRoot,
                            file.getOriginalFilename()));
                }
                String url = imageUrl + file.getOriginalFilename();
                com.testyle.model.File file1=new com.testyle.model.File();
                file1.setFileName(file.getOriginalFilename());
                file1.setFileType(fileType);
                file1.setUrl(url);
                file1.setRemark(remarkList.get(index++));
                fileService.insert(file1);
                TaskFile taskFile=new TaskFile();
                taskFile.setTaskID(taskID);
                taskFile.setFileType(fileType);
                taskFile.setFileID(file1.getFileID());
                int count=taskFileService.insert(taskFile);
                Utils.dealForAdd(resContent,count);
            }
        }catch (JSONException je){
            resContent.setCode(103);
            resContent.setMessage(je.getMessage());
        }catch (IOException ie){
            resContent.setCode(104);
            resContent.setMessage(ie.getMessage());
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    private void addTaskIDList(List<TaskUser> taskUserList, List<Long> taskIDs) {
        for (TaskUser taskUser : taskUserList) {
            taskIDs.add(taskUser.getTaskID());
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


    private int addListTaskUser(long taskID, List<Long> userIDs) {
        List<TaskUser> taskUsers = new ArrayList<>();
        dealUserIDList(taskID, userIDs, taskUsers);
        int count = taskUserService.insertList(taskUsers);
        return count;
    }


    private void dealUserIDList(long taskID, List<Long> userIDs, List<TaskUser> taskUsers) {
        for (long userID : userIDs) {
            TaskUser taskUser = new TaskUser();
            taskUser.setTaskID(taskID);
            taskUser.setUserID(userID);
            taskUsers.add(taskUser);
        }
    }

    @RequestMapping("/report")
    public ResponseEntity<byte[]> report(HttpServletRequest request,HttpServletResponse response)throws IOException{
        response.setCharacterEncoding(charact);
        ResContent resContent=new ResContent();
        try {
            long taskID=Long.parseLong(request.getParameter("taskID"));
            Task task=taskService.select(taskID);
            if(task.getStatus()!=0) {
                String fname = task.getProName() + "数据预览";
                String path = task.getUrl();
                OkHttpClient okHttpClient = new OkHttpClient.Builder().build();
                String url = EsUrl + "project/report";
                FormBody formBody = new FormBody.Builder()
                        .add("path",path)
                        .add(fname,fname)
                        .build();
                Request req = new Request.Builder().url(url)
                        .post(formBody)
                        .build();
                Call call = okHttpClient.newCall(req);
                Response response1 = call.execute();
                HttpHeaders headers = new HttpHeaders();
                headers.setContentDispositionFormData("attachment",fname);
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                return new ResponseEntity<byte[]>(response1.body().bytes(),headers, HttpStatus.OK);
            }else {
                resContent.setCode(105);
                resContent.setMessage("任务未完成");
                response.getWriter().write(JSON.toJSONString(resContent));
                response.getWriter().close();
            }
        }catch ( Exception e){
            resContent.setCode(104);
            resContent.setMessage(e.getMessage());
            response.getWriter().write(JSON.toJSONString(resContent));
            response.getWriter().close();
        }
        return null;
    }

    @RequestMapping("/detail")
    public void detail(HttpServletRequest request,HttpServletResponse response)throws IOException{
        response.setCharacterEncoding(charact);
        ResContent resContent=new ResContent();
        try {
            long taskID = Long.parseLong(request.getParameter("taskID"));
            Task task=taskService.select(taskID);
            long testID=task.getTestID();
            Test test=testService.select(testID);
            long planDanID=test.getPlanDanID();
            PlanDan planDan=planDanService.select(planDanID);
            task.setPlanDan(planDan);
            resContent.setCode(101);
            resContent.setMessage("获取成功");
            resContent.setData(task);
        }catch ( Exception e){
            resContent.setCode(104);
            resContent.setMessage(e.getMessage());
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

}
