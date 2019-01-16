package com.testyle.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONException;
import com.testyle.common.ResContent;
import com.testyle.common.Utils;
import com.testyle.model.SoluPro;
import com.testyle.model.Solution;
import com.testyle.service.ISoluProService;
import com.testyle.service.ISolutionService;
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
@RequestMapping("/solution")
public class SolutionController {
    @Resource
    private ISoluProService soluProService;
    @Resource
    private ISolutionService solutionService;
    String charact = "UTF-8";
    @Value("${EsUrl}")
    String EsUrl;
    @RequestMapping("/add")
    public void addSolution(Solution solution, HttpServletRequest request, HttpServletResponse response)throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent=new ResContent();
        if(solution.getSoluName()==null||
        solution.getDevTypeID()==-1){
            resContent.setCode(103);
            resContent.setMessage("参数错误");
        }else {
            try {
                List<SoluPro>soluProList=JSON.parseArray(request.getParameter("soluPros"),SoluPro.class);
                solution.setPros(soluProList);
                solution.setBuilderID(1);
                int count = solutionService.insert(solution);
                long SoluID = solution.getSoluID();
                if (count > 0) {
                    if(solution.getPros()!=null&&solution.getPros().size()>0) {
                        count = addListSoluPro(SoluID, solution.getPros());
                    }
                    Utils.dealForAdd(resContent, count);
                } else {
                    resContent.setCode(104);
                    resContent.setMessage("新增失败");
                }
            }catch (JSONException e){
                resContent.setCode(104);
                resContent.setMessage(e.getMessage());
            }
            catch (Exception e){
                resContent.setCode(104);
                resContent.setMessage(e.getMessage());
            }

        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }
    @RequestMapping("/show")
    public void showSolution(HttpServletRequest request,HttpServletResponse response)throws IOException{
        response.setCharacterEncoding(charact);
        ResContent resContent=new ResContent();
        try {
            long soluID=Long.parseLong(request.getParameter("soluID"));
            Solution solution=solutionService.select(soluID);
            SoluPro soluPro =new SoluPro();
            soluPro.setSoluID(soluID);
            List<SoluPro> soluProList =soluProService.select(soluPro);
            solution.setPros(soluProList);
            resContent.setCode(101);
            resContent.setMessage("获取成功");
            resContent.setData(solution);
        }catch (NumberFormatException ne){
            resContent.setCode(103);
            resContent.setMessage(ne.getMessage());
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }
    @RequestMapping("/update")
    public void updateSolution(Solution solution,HttpServletRequest request,HttpServletResponse response)throws IOException{
        response.setCharacterEncoding(charact);
        ResContent resContent=new ResContent();
        solution.setPros(JSON.parseArray(request.getParameter("soluPros"),SoluPro.class));
        if(solution.getSoluID()==-1||solution.getSoluName()==null||
                solution.getDevTypeID()==-1){
            resContent.setCode(103);
            resContent.setMessage("参数错误");
        }else {
            solution.setBuilderID(1);
            int count = solutionService.update(solution);
            if (count > 0) {
                soluProService.delete(solution.getSoluID());
                if(solution.getPros()!=null&&solution.getPros().size()>0) {
                    count = addListSoluPro(solution.getSoluID(), solution.getPros());
                }
                Utils.dealForUpdate(count, resContent);

            } else {
                resContent.setCode(104);
                resContent.setMessage("更新失败");
            }
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();

    }

    @RequestMapping("/list")
    public void getSolution(Solution solution,HttpServletResponse response)throws IOException{
        response.setCharacterEncoding(charact);
        ResContent resContent=new ResContent();
        List<Solution> solutions=new ArrayList<>();
        solutions=solutionService.select(solution);
        if(solutions.size()==0){
            resContent.setMessage("没有数据");
            resContent.setCode(102);
        }else {
            resContent.setMessage("获取成功");
            resContent.setCode(101);
            getSoluProList(solutions);
            resContent.setData(solutions);
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/delete")
    public void deleteSolu(Solution solution,HttpServletResponse response)throws IOException{
        response.setCharacterEncoding(charact);
        ResContent resContent =new ResContent();
        long soluID=solution.getSoluID();
        if (soluID==-1){
            resContent.setCode(103);
            resContent.setMessage("参数错误");
        }else {
            soluProService.delete(soluID);
            int count = solutionService.delete(soluID);
            Utils.dealForDel(count, resContent);
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }


    private int addListSoluPro(long SoluID, List<SoluPro> pros) {
        List<SoluPro> soluPros =new ArrayList<>();
        dealProIDList(SoluID, pros, soluPros);
        int count=soluProService.insertList(soluPros);
        return count;
    }

    private void dealProIDList(long SoluID, List<SoluPro> pros, List<SoluPro> soluPros) {
            for (SoluPro pro : pros) {
                pro.setSoluID(SoluID);
                soluPros.add(pro);
        }
    }

    private void getSoluProList(List<Solution> solutions){
        List<SoluPro> soluProList =new ArrayList<>();
        for(Solution solution :solutions){
            long soluID=solution.getSoluID();
            SoluPro soluPro =new SoluPro();
            soluPro.setSoluID(soluID);
            soluProList =soluProService.select(soluPro);
            solution.setPros(soluProList);
        }
    }
    @RequestMapping("/cover")
    public void coverList(HttpServletResponse response)throws IOException{
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        OkHttpClient okHttpClient = new OkHttpClient.Builder().build();
        try {
            String url = EsUrl + "project/list";
            FormBody formBody = new FormBody.Builder()
                    .add("proType", "3")
                    .build();
            Request req = new Request.Builder().url(url)
                    .post(formBody)
                    .build();
            Call call = okHttpClient.newCall(req);
            Response response1 = call.execute();
            String proStr = response1.body().string();
            resContent = JSON.parseObject(proStr, ResContent.class);

        } catch (Exception e) {
            e.printStackTrace();
            resContent.setCode(102);
            resContent.setMessage(e.getMessage());
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/addCover")
    public void addCover(HttpServletRequest request,HttpServletResponse response)throws IOException{
        response.setCharacterEncoding(charact);
        ResContent resContent=new ResContent();
        try {
            long soluID=Long.parseLong(request.getParameter("soluID"));
            long coverID=Long.parseLong(request.getParameter("coverID"));
            String coverName=request.getParameter("coverName");
            Solution solution=solutionService.select(soluID);
            solution.setCoverID(coverID);
            solution.setCoverName(coverName);
            solutionService.update(solution);
            resContent.setCode(101);
            resContent.setMessage("更新成功");
        }catch (Exception e){
            resContent.setCode(102);
            resContent.setMessage("更新失败");
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/report")
    public void report(HttpServletRequest request,HttpServletResponse response)throws IOException{
        response.setCharacterEncoding(charact);
        response.setCharacterEncoding(charact);
        ResContent resContent=new ResContent();
        try {
            List<Long> proIDs=new ArrayList<>();
            long soluID = Long.parseLong(request.getParameter("soluID"));
            Solution solution=solutionService.select(soluID);
            long coverID=solution.getCoverID();
            proIDs.add(coverID);
            SoluPro soluPro=new SoluPro();
            soluPro.setSoluID(soluID);
            List<SoluPro> soluProList=soluProService.select(soluPro);
            for(SoluPro pro:soluProList){
                proIDs.add(pro.getProID());
            }
            resContent.setCode(101);
            resContent.setMessage("获取成功");
            resContent.setData(proIDs);
        }catch (Exception e){
            e.printStackTrace();
            resContent.setCode(102);
            resContent.setMessage(e.getMessage());
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

}
