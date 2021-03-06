package com.testyle.controller;

import com.alibaba.fastjson.JSON;
import com.testyle.common.ResContent;
import com.testyle.common.Utils;
import com.testyle.model.*;
import com.testyle.model.File;
import com.testyle.service.*;
import okhttp3.*;
import org.apache.commons.io.FileUtils;
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
import java.awt.image.RescaleOp;
import java.io.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/device")
public class DeviceController {
    @Resource
    private IStationService stationService;
    @Resource
    private IDeviceService deviceService;
    @Resource
    private IDevAttrValService devAttrValService;
    @Resource
    private ITagService tagService;
    @Resource
    private ITagDeviceService tagDeviceService;
    @Resource
    IDeviceFileService deviceFileService;
    @Resource
    IFileService fileservice;
    String charact = "UTF-8";
    @Value("${imgPath}")
    String imageRoot;
    @Value("${imgUrl}")
    String imageUrl;
    @Value("${EsUrl}")
    String EsUrl;
    @RequestMapping("/add")
    public void addDevice(Device device, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
//        String values=request.getParameter("values");
//        List<DevAttrVal> devAttrValList=JSON.parseArray(values,DevAttrVal.class);
        if (device.getDevName() == null
                || device.getDevName().equals("")) {
            resContent.setCode(103);
            resContent.setMessage("参数错误或者为空");
        } else {
            int count = deviceService.insert(device);
            addTag(device);
            Utils.dealForAdd(resContent, count);
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    private void addTag(Device device) {
        String tagString = device.getTagString();
        if (tagString != null && !tagString.equals("")) {
            String[] tags = tagString.split(",");
            long devID = device.getDevID();
            List<TagDevice> tagDeviceList = new ArrayList<>();
            for (int i = 0; i < tags.length; i++) {
                Tag tag = new Tag();
                tag.setTagType(1);
                tag.setTagName(tags[i]);
                List<Tag> tagList = tagService.select(tag);
                if (tagList.size() == 0) {
                    tag.setpTagID(0);
                    int ic = tagService.insert(tag);
                    TagDevice tagDevice = new TagDevice();
                    tagDevice.setDevID(devID);
                    tagDevice.setTagID(tag.getTagID());
                    tagDeviceList.add(tagDevice);
                } else {
                    tag = tagList.get(0);
                    TagDevice tagDevice = new TagDevice();
                    tagDevice.setDevID(devID);
                    tagDevice.setTagID(tag.getTagID());
                    tagDeviceList.add(tagDevice);
                }
            }
            tagDeviceService.insert(tagDeviceList);
        }
    }

    private void addListDevAttrVal(long devID, List<DevAttrVal> devAttrValList) {
        for (DevAttrVal devAttrVal : devAttrValList) {
            devAttrVal.setDevID(devID);
        }
        devAttrValService.insertList(devAttrValList);
    }

    @RequestMapping("delete")
    public void deleteDevice(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        long devID = Long.parseLong(request.getParameter("devID"));
        int count = deviceService.delete(devID);
        TagDevice tagDevice = new TagDevice();
        tagDevice.setDevID(devID);
        tagDeviceService.delete(tagDevice);
        ResContent resContent = new ResContent();
        Utils.dealForDel(count, resContent);
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/update")
    public void updateDevice(Device device, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        if (device.getDevID() != -1) {
            Device oldDevice=deviceService.selectByID(device.getDevID());
            device.setStaID(oldDevice.getStaID());
            device.setPlateUrl(oldDevice.getPlateUrl());
            device.setDevUrl(oldDevice.getDevUrl());
            device.setRemark(oldDevice.getRemark());
            int count = deviceService.update(device);
            TagDevice tagDevice = new TagDevice();
            tagDevice.setDevID(device.getStaID());
            tagDeviceService.delete(tagDevice);
            addTag(device);
            Utils.dealForUpdate(count, resContent);
        } else {
            resContent.setCode(103);
            resContent.setMessage("参数错误");
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/getDevList")
    public void getDevList(Device device,HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        List<Device> deviceList=deviceService.select(device);
        if (deviceList.size() == 0) {
            resContent.setMessage("没有数据");
            resContent.setCode(102);
        } else {
            resContent.setCode(101);
            resContent.setMessage("获取成功");
            resContent.setData(deviceList);
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/list")
    public void getDev(HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        List<Station> stationList = stationService.selectAll();
        addDeviceList(stationList);
        List<Object> devTree = toDevTree(stationList);
        if (devTree.size() == 0) {
            resContent.setMessage("没有数据");
            resContent.setCode(102);
        } else {
            resContent.setCode(101);
            resContent.setMessage("获取成功");
            resContent.setData(devTree);
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    private List<Object> toDevTree(List<Station> stationList) {
        List<Object> list = new ArrayList<>();
        for (Station station : stationList) {
            Map<String, Object> map = new LinkedHashMap<String, Object>();
            if (station.getpStaID() == 0) {
                map.put("name", station.getStaName());
                map.put("id", station.getStaID());
                if (staChild(station.getStaID(), stationList).size() > 0)
                    map.put("children", staChild(station.getStaID(), stationList));
                list.add(map);
            }
        }
        return list;
    }

    private List<?> staChild(long staID, List<Station> stationList) {
        List<Object> list = new ArrayList<>();
        for (Station station : stationList) {
            if (station.getpStaID() == staID) {
                Map<String, Object> map = new LinkedHashMap<String, Object>();
                map.put("name", station.getStaName());
                map.put("id", station.getStaID());
                if (staChild(station.getStaID(), stationList).size() > 0)
                    map.put("children", staChild(station.getStaID(), stationList));
                list.add(map);
            }
            if (station.getStaID() == staID) {
                for (Device device : station.getDeviceList()) {
                    Map<String, Object> temp = new LinkedHashMap<String, Object>();
                    temp.put("name", device.getDevName());
                    temp.put("id", device.getDevID());
                    list.add(temp);
                }
            }

        }
        System.out.println(JSON.toJSONString(list));
        return list;
    }

    private void addDeviceList(List<Station> stationList) {
        for (Station station : stationList) {
            Device device = new Device();
            device.setStaID(station.getStaID());
            List<Device> devices = deviceService.select(device);
            station.setDeviceList(devices);
        }
    }

    private void getListDevAttrVal(List<Device> devices) {
        for (Device dev : devices) {
            DevAttrVal devAttrVal = new DevAttrVal();
            devAttrVal.setDevID(dev.getDevID());
            List<DevAttrVal> devAttrValList = devAttrValService.select(devAttrVal);
//            dev.setDevAttrValList(devAttrValList);
        }
    }

    @RequestMapping("/devPic")
    public void devPic(@RequestParam("devPic") MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        try {
            if (!file.isEmpty()) {
                FileUtils.copyInputStreamToFile(file.getInputStream(), new java.io.File(
                        imageRoot,
                        file.getOriginalFilename()));
            }
            String url = imageUrl + file.getOriginalFilename();
            long devID = Long.parseLong(request.getParameter("devID"));
            Device device = deviceService.selectByID(devID);
            device.setDevUrl(url);
            deviceService.update(device);
            resContent.setCode(101);
            resContent.setMessage("上传成功");
        } catch (NumberFormatException ne) {
            resContent.setMessage("参数错误");
            resContent.setCode(103);
            response.getWriter().write(JSON.toJSONString(resContent));
            response.getWriter().close();
            return;
        } catch (Exception e) {
            resContent.setMessage("上传失败");
            resContent.setCode(102);
            response.getWriter().write(JSON.toJSONString(resContent));
            response.getWriter().close();
            return;
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/plate")
    public void plate(@RequestParam("plate") MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        try {
            if (!file.isEmpty()) {
                FileUtils.copyInputStreamToFile(file.getInputStream(), new java.io.File(
                        imageRoot,
                        file.getOriginalFilename()));
            }
            String url = imageUrl + file.getOriginalFilename();
            long devID = Long.parseLong(request.getParameter("devID"));
            Device device = deviceService.selectByID(devID);
            device.setPlateUrl(url);
            deviceService.update(device);
            resContent.setCode(101);
            resContent.setMessage("上传成功");
        } catch (NumberFormatException ne) {
            resContent.setMessage("参数错误");
            resContent.setCode(103);
            response.getWriter().write(JSON.toJSONString(resContent));
            response.getWriter().close();
            return;
        } catch (Exception e) {
            resContent.setMessage("上传失败");
            resContent.setCode(102);
            response.getWriter().write(JSON.toJSONString(resContent));
            response.getWriter().close();
            return;
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/upload")
    public void doUpload(@RequestParam("file") MultipartFile file, com.testyle.model.File file1, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        try {
            if (!file.isEmpty()) {
                FileUtils.copyInputStreamToFile(file.getInputStream(), new java.io.File(
                        imageRoot,
                        file.getOriginalFilename()));
            }
            String url = imageUrl + file.getOriginalFilename();
            long devID = Long.parseLong(request.getParameter("devID"));

            String temp = file.getOriginalFilename();
//            String fileName = temp.split("\\.")[0];
            String fileName=temp;
            file1.setUrl(url);
            file1.setFileName(fileName);
            file1.setFileType(1);
            int ic = fileservice.insert(file1);
            DeviceFile deviceFile = new DeviceFile();
            deviceFile.setDevID(devID);
            deviceFile.setFileID(file1.getFileID());
            deviceFileService.insert(deviceFile);
            resContent.setCode(101);
            resContent.setMessage("上传成功");
        } catch (NumberFormatException ne) {
            resContent.setMessage("参数错误");
            resContent.setCode(103);
            response.getWriter().write(JSON.toJSONString(resContent));
            response.getWriter().close();
            return;
        } catch (Exception e) {
            resContent.setMessage("上传失败");
            resContent.setCode(102);
            response.getWriter().write(JSON.toJSONString(resContent));
            response.getWriter().close();
            return;
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/download")
    public ResponseEntity<byte[]> filedownload(DeviceFile deviceFile) throws Exception {
        List<DeviceFile> deviceFileList = deviceFileService.select(deviceFile);
        ResContent resContent = new ResContent();
        if (deviceFileList.size() == 0) {
            resContent.setCode(103);
            resContent.setMessage("没有文件");
            return null;
        } else {
            deviceFile = deviceFileList.get(0);
            String downLoadPath = deviceFile.getUrl();
            String fileName = deviceFile.getFileName();
            java.io.File file = new java.io.File(downLoadPath);
            HttpHeaders headers = new HttpHeaders();
            headers.setContentDispositionFormData("attachment", fileName);
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.OK);
        }
    }
    @RequestMapping("/delFile")
    public void delPic(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        try {
            long fileID = Long.parseLong(request.getParameter("fileID"));
            long devID = Long.parseLong(request.getParameter("devID"));
            DeviceFile deviceFile = new DeviceFile();
            deviceFile.setDevID(devID);
            deviceFile.setFileID(fileID);
            deviceFileService.delete(deviceFile);
            resContent.setCode(101);
            resContent.setMessage("删除成功");
        } catch (Exception e) {
            resContent.setMessage("参数错误");
            resContent.setCode(103);
            response.getWriter().write(JSON.toJSONString(resContent));
            response.getWriter().close();
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/tag")
    public void tagList(HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        Tag tag = new Tag();
        tag.setTagType(1);
        List<Tag> tagList = tagService.select(tag);
        addTagDevice(tagList);
        List<Object> tagTree = ToTagTree(tagList);
        resContent.setCode(101);
        resContent.setData(tagTree);
        resContent.setMessage("获取成功");
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    private List<Object> ToTagTree(List<Tag> tagList) {
        List<Object> list = new ArrayList<>();
        for (Tag tag : tagList) {
            Map<String, Object> map = new LinkedHashMap<String, Object>();
            if (tag.getpTagID() == 0) {
                map.put("name", tag.getTagName());
                map.put("pid", tag.getpTagID());
                map.put("id", tag.getTagID());
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
                map.put("name", tag.getTagName());
                map.put("id", tag.getTagID());
                if (tagChild(tag.getTagID(), tagList).size() > 0)
                    map.put("children", tagChild(tag.getTagID(), tagList));
                list.add(map);
            }
            if (tag.getTagID() == tagID) {
                for (TagDevice tagDevice : tag.getTagDeviceList()) {
                    Map<String, Object> temp = new LinkedHashMap<String, Object>();
                    temp.put("name", tagDevice.getDevName());
                    temp.put("id", tagDevice.getDevID());
                    list.add(temp);
                }
            }

        }
        System.out.println(JSON.toJSONString(list));
        return list;
    }

    private void addTagDevice(List<Tag> tagList) {
        for (Tag tag : tagList) {
            TagDevice tagDevice = new TagDevice();
            tagDevice.setTagID(tag.getTagID());
            tag.setTagDeviceList(tagDeviceService.select(tagDevice));
        }
    }


    @RequestMapping("/show")
    public void selectDevice(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        long devID = 0;
        try {
            devID = Long.parseLong(request.getParameter("devID"));
        } catch (Exception e) {
            resContent.setCode(103);
            resContent.setMessage("参数错误");
            response.getWriter().write(JSON.toJSONString(resContent));
            response.getWriter().close();
            return;
        }
        Device device = deviceService.selectByID(devID);
        TagDevice tagDevice = new TagDevice();
        tagDevice.setDevID(devID);
        List<TagDevice> tagDeviceList = tagDeviceService.select(tagDevice);
        String tagString = "";
        if (tagDeviceList != null)
            tagString = tagToString(tagDeviceList);
        DeviceFile deviceFile = new DeviceFile();
        deviceFile.setDevID(devID);
        List<DeviceFile> fileList = deviceFileService.select(deviceFile);
        if (device == null) {
            resContent.setCode(102);
            resContent.setMessage("没有该设备");
        } else {
            resContent.setCode(101);
            resContent.setMessage("获取成功");
            device.setTagString(tagString);
            device.setFileList(fileList);
            resContent.setData(device);
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    private String tagToString(List<TagDevice> tagDeviceList) {
        String result = "";
        for (TagDevice tagDevice : tagDeviceList) {
            result += tagDevice.getTagName() + ",";
        }
        if (!result.equals(""))
            result = result.substring(0, result.length() - 1);
        return result;
    }

    @RequestMapping("/devPro")
    public void devPro(HttpServletRequest request,HttpServletResponse response)throws IOException{
        response.setCharacterEncoding(charact);
        ResContent resContent=new ResContent();
        try {
            OkHttpClient okHttpClient = new OkHttpClient.Builder().build();
            long devID=Long.parseLong(request.getParameter("devID"));
            Device device=deviceService.selectByID(devID);
            long devType=device.getDevTypeID();
            String url = EsUrl + "project/list";
            FormBody formBody = new FormBody.Builder()
                    .add("proType", "0")
                    .add("devTypeID", String.valueOf(devType))
                    .build();
            Request req = new Request.Builder().url(url)
                    .post(formBody)
                    .build();
            Call call = okHttpClient.newCall(req);
            Response response1 = call.execute();
            String proStr = response1.body().string();
            resContent = JSON.parseObject(proStr, ResContent.class);
        }catch (NumberFormatException ne){
            resContent.setCode(103);
            resContent.setMessage("参数错误");
        }catch (Exception e){
            resContent.setCode(104);
            resContent.setMessage(e.getMessage());
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }
}
