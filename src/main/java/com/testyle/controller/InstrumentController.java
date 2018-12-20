package com.testyle.controller;

import com.alibaba.fastjson.JSON;
import com.testyle.common.ResContent;
import com.testyle.common.Utils;
import com.testyle.model.DevAttrVal;
import com.testyle.model.Instrument;
import com.testyle.service.IDevAttrValService;
import com.testyle.service.IInstrumentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/instrument")
public class InstrumentController {
    @Resource
    private IInstrumentService instrumentService;
    @Resource
    private IDevAttrValService devAttrValService;
    String charact = "UTF-8";

    @RequestMapping("/add")
    public void addIns(Instrument instrument,HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
//        String values=request.getParameter("values");
//        List<DevAttrVal> devAttrValList=JSON.parseArray(values,DevAttrVal.class);
        if (instrument.getInsName() == null
                || instrument.getInsName().equals("")) {
            resContent.setCode(103);
            resContent.setMessage("参数错误或者为空");
        } else {
            int count = instrumentService.insert(instrument);
//            addListDevAttrVal(instrument.getInsID(),devAttrValList);
            Utils.dealForAdd(resContent, count);
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

//    private void addListDevAttrVal(long insID, List<DevAttrVal> devAttrValList) {
//        for (DevAttrVal devAttrVal:devAttrValList){
//            devAttrVal.setInsID(insID);
//        }
//        devAttrValService.insertList(devAttrValList);
//    }

    @RequestMapping("delete")
    public void deleteInstrument(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        long insID = Long.parseLong(request.getParameter("insID"));
        int count = instrumentService.delete(insID);
        ResContent resContent = new ResContent();
        Utils.dealForDel(count, resContent);
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/update")
    public void updateTypeAttr(Instrument instrument,HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        String values=request.getParameter("values");
        List<DevAttrVal> devAttrValList=JSON.parseArray(values,DevAttrVal.class);
        if (instrument.getInsID() != -1||
                devAttrValList.size()!=0) {
            int count = instrumentService.update(instrument);
//            devAttrValService.delete(instrument.getInsID());
//            addListDevAttrVal(instrument.getInsID(),devAttrValList);
            Utils.dealForUpdate(count, resContent);
        } else {
            resContent.setCode(103);
            resContent.setMessage("参数错误");
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/list")
    public void getDev(Instrument instrument, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        List<Instrument> instruments = instrumentService.select(instrument);
        if (instruments.size() == 0) {
            resContent.setMessage("没有数据");
            resContent.setCode(102);
        } else {
//            getListDevAttrVal(instruments);
            resContent.setCode(101);
            resContent.setMessage("获取成功");
            resContent.setData(instruments);
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

//    private void getListDevAttrVal(List<Instrument> instruments) {
//        for (Instrument dev : instruments) {
//            DevAttrVal devAttrVal = new DevAttrVal();
//            devAttrVal.setInsID(dev.getInsID());
//            List<DevAttrVal> devAttrValList = devAttrValService.select(devAttrVal);
//            dev.setDevAttrValList(devAttrValList);
//        }
//    }

}
