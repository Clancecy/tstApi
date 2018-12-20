package com.testyle.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONException;
import com.testyle.common.ResContent;
import com.testyle.common.Utils;
import com.testyle.model.SoluPro;
import com.testyle.model.Solution;
import com.testyle.service.ISoluProService;
import com.testyle.service.ISolutionService;
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
                List<SoluPro>soluProList=JSON.parseArray(request.getParameter("items"),SoluPro.class);
                solution.setPros(soluProList);
            }catch (JSONException e){
                resContent.setCode(104);
                resContent.setMessage(e.getMessage());
            }
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
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/update")
    public void updateSolution(Solution solution,HttpServletRequest request,HttpServletResponse response)throws IOException{
        response.setCharacterEncoding(charact);
        ResContent resContent=new ResContent();
        solution.setPros(JSON.parseArray(request.getParameter("items"),SoluPro.class));
        if(solution.getSoluID()==-1||solution.getSoluName()==null||
                solution.getDevTypeID()==-1){
            resContent.setCode(103);
            resContent.setMessage("参数错误");
        }else {
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
}
