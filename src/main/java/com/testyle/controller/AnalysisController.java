package com.testyle.controller;

import com.alibaba.fastjson.JSON;
import com.testyle.common.ResContent;
import com.testyle.common.Utils;
import com.testyle.model.Analysis;
import com.testyle.model.AnalysisItem;
import com.testyle.model.Device;
import com.testyle.service.IAnalysisItemService;
import com.testyle.service.IAnalysisService;
import com.testyle.service.IDeviceService;
import org.apache.poi.ss.formula.functions.Odd;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/analysis")
public class AnalysisController {
    String charact = "UTF-8";
    @Resource
    private IAnalysisService analysisService;
    @Resource
    IAnalysisItemService analysisItemService;
    @Resource
    IDeviceService deviceService;
    @RequestMapping("/list")
    public void analysisList(HttpServletResponse response) throws IOException{
        response.setCharacterEncoding(charact);
        ResContent resContent=new ResContent();
        Analysis analysis=new Analysis();
        List<Analysis> analysisList=analysisService.select(analysis);
        addAnalisisItem(analysisList);
        resContent.setCode(101);
        resContent.setMessage("获取成功");
        resContent.setData(analysisList);
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }
    @RequestMapping("/listByDev")
    public void analysisListByDev(HttpServletRequest request,HttpServletResponse response) throws IOException{
        response.setCharacterEncoding(charact);
        ResContent resContent=new ResContent();
        try {
            long devID=Long.parseLong(request.getParameter("devID"));
            Device device=deviceService.selectByID(devID);
            Analysis analysis=new Analysis();
            analysis.setTypeID(device.getDevTypeID());
            List<Analysis> analysisList=analysisService.select(analysis);
            addAnalisisItem(analysisList);
            resContent.setCode(101);
            resContent.setMessage("获取成功");
            resContent.setData(analysisList);
            response.getWriter().write(JSON.toJSONString(resContent));
            response.getWriter().close();
        }catch (Exception e){
            e.printStackTrace();
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }
    private void addAnalisisItem(List<Analysis> analysisList) {
        for(Analysis analysis:analysisList){
            AnalysisItem analysisItem=new AnalysisItem();
            analysisItem.setAnalyID(analysis.getAnalyID());
            analysis.setAnalysisItemList(analysisItemService.select(analysisItem));
        }
    }

    @RequestMapping("/add")
    public void addAnalysis(Analysis analysis, HttpServletRequest request,HttpServletResponse response)throws IOException{
        response.setCharacterEncoding(charact);
        ResContent resContent=new ResContent();
        try {
//            String itemIDs=request.getParameter("items");
//            List<AnalysisItem> itemIDList=JSON.parseArray(itemIDs,AnalysisItem.class);
            analysis.setBuilderID(1);
            int count=analysisService.insert(analysis);
//            addItemList(analysis.getAnalyID(),itemIDList);
            Utils.dealForAdd(resContent,count);
        }catch (Exception e){
            e.printStackTrace();
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    private void addItemList(long analyID, List<AnalysisItem> itemIDList) {
        for(AnalysisItem item:itemIDList){
            item.setAnalyID(analyID);
            analysisItemService.insert(item);
        }
    }

    @RequestMapping("/delete")
    public void deleteAnalysis(Analysis analysis,HttpServletResponse response)throws IOException{
        response.setCharacterEncoding(charact);
        ResContent resContent=new ResContent();
        int count=analysisService.delete(analysis.getAnalyID());
        Utils.dealForDel(count,resContent);
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }
    @RequestMapping("/update")
    public void updateAnalysis(Analysis analysis,HttpServletRequest request,HttpServletResponse response)throws IOException{
        response.setCharacterEncoding(charact);
        ResContent resContent=new ResContent();
        analysis.setBuilderID(1);
        int count=analysisService.update(analysis);
        String itemIDs=request.getParameter("items");
        List<AnalysisItem> itemIDList=JSON.parseArray(itemIDs,AnalysisItem.class);
        analysisItemService.delete(analysis.getAnalyID());
        addItemList(analysis.getAnalyID(),itemIDList);
        Utils.dealForUpdate(count,resContent);
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }
    @RequestMapping("/show")
    public void showAnalysis(Analysis analysis,HttpServletResponse response)throws IOException{
        response.setCharacterEncoding(charact);
        ResContent resContent=new ResContent();
        Analysis analysis1=analysisService.select(analysis.getAnalyID());
        AnalysisItem analysisItem=new AnalysisItem();
        analysisItem.setAnalyID(analysis.getAnalyID());
        List<AnalysisItem> analysisItems=analysisItemService.select(analysisItem);
        analysis1.setAnalysisItemList(analysisItems);
        resContent.setCode(101);
        resContent.setMessage("获取成功");
        resContent.setData(analysis1);
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

}
