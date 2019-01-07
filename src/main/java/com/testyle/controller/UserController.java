package com.testyle.controller;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSON;
import com.testyle.common.ResContent;
import com.testyle.common.Utils;
import com.testyle.model.Solution;
import com.testyle.model.Tag;
import com.testyle.model.User;
import com.testyle.service.ITagService;
import com.testyle.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.RescaleOp;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private IUserService userService;
    @Resource
    ITagService tagService;

    @RequestMapping("/show")
    public void selectUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        ResContent resContent=new ResContent();
        long userId = Long.parseLong(request.getParameter("userID"));
        User user = this.userService.selectUser(userId);
        resContent.setCode(101);
        resContent.setMessage("获取成功");
        resContent.setData(user);
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/check")
    public void checkUser(User user, HttpServletResponse response)
    throws IOException{
        response.setCharacterEncoding("UTF-8");
        Map<String, Object> res = new HashMap<>();
        long userID=userService.checkUser(user);
        if(userID>0){
            res.put("code",101);
            res.put("message","存在该用户");
            res.put("data",null);
        }else {
            res.put("code",102);
            res.put("message","不存在该用户");
            res.put("data",null);
        }
        response.getWriter().write(JSON.toJSONString(res));
        response.getWriter().close();
    }

    @RequestMapping("/register")
    public void addUser(User user, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("UTF-8");
        Map<String, Object> res = new HashMap<>();
        if (isEmptyUser(user)) {
            res.put("code", 102);
            res.put("message", "参数为空或错误");
        }
        else if(checkUser(user)){
            res.put("code", 103);
            res.put("message", "用户名已存在");
        }else {
            int count = userService.addUser(user);
            if (count > 0) {
                res.put("code", 101);
                res.put("message", "添加成功");
            } else {
                res.put("code", 104);
                res.put("message", "添加失败");
            }
        }
        response.getWriter().write(JSON.toJSONString(res));
        response.getWriter().close();
    }

    @RequestMapping("/update")
    public void updateUser(User user,HttpServletResponse response)throws IOException{
        response.setCharacterEncoding("UTF-8");
        ResContent resContent=new ResContent();
        if(isEmptyUser(user)){
            resContent.setCode(103);
            resContent.setMessage("参数错误");
        }else {
            int count=userService.update(user);
            Utils.dealForUpdate(count,resContent);
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/login")
    public void userLogin(User user,HttpServletRequest request,HttpServletResponse response) throws IOException{
        response.setCharacterEncoding("UTF-8");
        Map<String, Object> res = new HashMap<>();
        Map<String,Object> data= new HashMap<>();
        if (isEmptyUser(user)) {
            res.put("code", 102);
            res.put("message", "参数为空或错误");
        }else {
            if (checkUser(user)) {
                res.put("code", 101);
                res.put("message", "登录成功");
                long userID = userService.checkUser(user);
                HttpSession session = request.getSession();
                session.setAttribute("userName", user.getUserName());
                session.setAttribute("userID", userID);
            } else {
                res.put("code", 103);
                res.put("message", "用户名或密码错误");
            }
        }
        response.getWriter().write(JSON.toJSONString(res));
        response.getWriter().close();
    }

    @RequestMapping("/getSession")
    public void getSession(HttpServletRequest request,HttpServletResponse response) throws IOException{
        response.setCharacterEncoding("UTF-8");
        HttpSession session=request.getSession();
        Map<String, Object> res = new HashMap<>();
        Map<String,Object> data= new HashMap<>();
        if(session.getAttribute("userID")==null){
            res.put("code",102);
            res.put("message","登录信息已过期");
        }else {
            long userID=(long)session.getAttribute("userID");
            String userName=(String)session.getAttribute("userName");
            res.put("code", 101);
            res.put("message", "获取成功");
            data.put("userID",userID);
            data.put("userName",userName);
            res.put("data",data);
        }
        response.getWriter().write(JSON.toJSONString(res));
        response.getWriter().close();
    }

    @RequestMapping("/logout")
    public void Logout(HttpServletRequest request,HttpServletResponse response) throws IOException{
        response.setCharacterEncoding("UTF-8");
        HttpSession session=request.getSession();
        session.invalidate();
        Map<String, Object> res = new HashMap<>();
        res.put("code",101);
        res.put("message","退出登录");
        response.getWriter().write(JSON.toJSONString(res));
        response.getWriter().close();

    }

    @RequestMapping("/delete")
    public void deleteUser(HttpServletRequest request,HttpServletResponse response)throws IOException{
        response.setCharacterEncoding("UTF-8");
        long userId = Long.parseLong(request.getParameter("userID"));
        int delete=userService.deleteUser(userId);
        Map<String, Object> res = new HashMap<>();
        if(delete>0) {
            res.put("code", 101);
            res.put("message", "删除成功");
        }else {
            res.put("code", 102);
            res.put("message", "删除失败");
        }
    }

    @RequestMapping("/list")
    public void ListUser(User user,HttpServletResponse response )throws IOException{
        response.setCharacterEncoding("UTF-8");
        ResContent resContent=new ResContent();
        List<User> userList=new ArrayList<>();
        userList=userService.select(user);
        if(userList.size()==0){
            resContent.setMessage("没有数据");
            resContent.setCode(102);
        }else {
            resContent.setMessage("获取成功");
            resContent.setCode(101);
            resContent.setData(userList);
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/tag")
    public void tagList(HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("UTF-8");
        ResContent resContent = new ResContent();
        Tag tag = new Tag();
        tag.setTagType(2);
        List<Tag> tagList = tagService.select(tag);
        addTagUser(tagList);
        List<Object> tagTree = ToTagTree(tagList);
        resContent.setCode(101);
        resContent.setData(tagTree);
        resContent.setMessage("获取成功");
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/addTag")
    public void addTag(Tag tag,HttpServletResponse response) throws IOException{
        response.setCharacterEncoding("UTF-8");
        ResContent resContent=new ResContent();
        tag.setTagType(2);
        int count=tagService.insert(tag);
        Utils.dealForAdd(resContent,count);
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    private void addTagUser(List<Tag> tagList) {
        for(Tag tag:tagList) {
            User user = new User();
            user.setDeptID(tag.getTagID());
            tag.setUserList(userService.select(user));
        }
    }
    private List<Object> ToTagTree(List<Tag> tagList) {
        List<Object> list = new ArrayList<>();
        for (Tag tag : tagList) {
            Map<String, Object> map = new LinkedHashMap<String, Object>();
            if (tag.getpTagID() == 0) {
                map.put("tagName", tag.getTagName());
                map.put("pTagID", tag.getpTagID());
                map.put("tagID", tag.getTagID());
                if (tagChild(tag.getTagID(), tagList).size() > 0)
                    map.put("children", tagChild(tag.getTagID(), tagList));
                list.add(map);
            }
        }
        return list;
    }

    private List<?> tagChild(long tagID, List<Tag> tagList) {
        List<Object> list = new ArrayList<>();
        for (Tag tag : tagList) {
            if (tag.getpTagID() == tagID) {
                Map<String, Object> map = new LinkedHashMap<String, Object>();
                map.put("tagName", tag.getTagName());
                map.put("tagID", tag.getTagID());
                if (tagChild(tag.getTagID(), tagList).size() > 0)
                    map.put("children", tagChild(tag.getTagID(), tagList));
                list.add(map);
            }
            if (tag.getTagID() == tagID) {
                for (User user : tag.getUserList()) {
                    Map<String, Object> temp = new LinkedHashMap<String, Object>();
                    temp.put("userRealName", user.getUserRealName());
                    temp.put("userID", user.getUserID());
                    temp.put("userPic",user.getUserPic());
                    list.add(temp);
                }
            }

        }
        System.out.println(JSON.toJSONString(list));
        return list;
    }

    private boolean checkUser(User user){
        long userID=userService.checkUser(user);
        if(userID>0)
            return true;
        else
            return false;
    }

    private boolean isEmptyUser(User user){
        if (user.getUserName() == null|| user.getUserName().isEmpty()
                ||user.getUserPassword()==null||user.getUserPassword().isEmpty()) {
            return true;
        }else
            return false;
    }
}
