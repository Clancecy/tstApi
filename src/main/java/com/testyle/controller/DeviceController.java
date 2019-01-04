package com.testyle.controller;

import com.alibaba.fastjson.JSON;
import com.testyle.common.ResContent;
import com.testyle.common.Utils;
import com.testyle.model.DevAttrVal;
import com.testyle.model.Device;
import com.testyle.service.IDevAttrValService;
import com.testyle.service.IDeviceService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/device")
public class DeviceController {
    @Resource
    private IDeviceService deviceService;
    @Resource
    private IDevAttrValService devAttrValService;
    String charact = "UTF-8";

    @RequestMapping("/add")
    public void addTypeAttr(Device device,HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        String values=request.getParameter("values");
        List<DevAttrVal> devAttrValList=JSON.parseArray(values,DevAttrVal.class);
        if (device.getDevName() == null
                || device.getDevName().equals("")
        ||devAttrValList.size()==0) {
            resContent.setCode(103);
            resContent.setMessage("参数错误或者为空");
        } else {
            int count = deviceService.insert(device);
            addListDevAttrVal(device.getDevID(),devAttrValList);
            Utils.dealForAdd(resContent, count);
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    private void addListDevAttrVal(long devID, List<DevAttrVal> devAttrValList) {
        for (DevAttrVal devAttrVal:devAttrValList){
            devAttrVal.setDevID(devID);
        }
        devAttrValService.insertList(devAttrValList);
    }

    @RequestMapping("delete")
    public void deleteDevice(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        long devID = Long.parseLong(request.getParameter("devID"));
        devAttrValService.delete(devID);
        int count = deviceService.delete(devID);
        ResContent resContent = new ResContent();
        Utils.dealForDel(count, resContent);
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/update")
    public void updateTypeAttr(Device device,HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        String values=request.getParameter("values");
        List<DevAttrVal> devAttrValList=JSON.parseArray(values,DevAttrVal.class);
        if (device.getDevID() != -1||
                devAttrValList.size()!=0) {
            int count = deviceService.update(device);
            devAttrValService.delete(device.getDevID());
            addListDevAttrVal(device.getDevID(),devAttrValList);
            Utils.dealForUpdate(count, resContent);
        } else {
            resContent.setCode(103);
            resContent.setMessage("参数错误");
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/list")
    public void getDev(Device device, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        List<Device> devices = deviceService.select(device);
        if (devices.size() == 0) {
            resContent.setMessage("没有数据");
            resContent.setCode(102);
        } else {
            getListDevAttrVal(devices);
            resContent.setCode(101);
            resContent.setMessage("获取成功");
            resContent.setData(devices);
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    private void getListDevAttrVal(List<Device> devices) {
        for (Device dev : devices) {
            DevAttrVal devAttrVal = new DevAttrVal();
            devAttrVal.setDevID(dev.getDevID());
            List<DevAttrVal> devAttrValList = devAttrValService.select(devAttrVal);
//            dev.setDevAttrValList(devAttrValList);
        }
    }

}
