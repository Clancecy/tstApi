package com.testyle.controller;

import com.alibaba.fastjson.JSON;
import com.testyle.common.ResContent;
import com.testyle.common.Utils;
import com.testyle.model.Station;
import com.testyle.model.StationFile;
import com.testyle.model.Tag;
import com.testyle.model.TagStation;
import com.testyle.service.*;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.descriptor.TaglibDescriptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTML;
import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.List;

@Controller
@RequestMapping("/station")
public class StationController {
    @Resource
    private IStationService stationService;
    @Resource
    private ITagService tagService;
    @Resource
    private ITagStationService tagStationService;
    @Resource
    IStationFileService stationFileService;
    @Resource
    IFileService fileservice;
    String charact = "UTF-8";
    String imageRoot = "E:/image/";

    @RequestMapping("/list")
    public void selectAll(HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        List<Station> stationList = stationService.selectAll();
        List<Object> stas = staList(stationList);
        Utils.dealResForSelall(resContent, stas);
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();

    }

    @RequestMapping("/tag")
    public void tagList(HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        Tag tag = new Tag();
        tag.setTagType(0);
        List<Tag> tagList = tagService.select(tag);
        addTagStation(tagList);
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
                map.put("pid", tag.getpTagID());
                if (tagChild(tag.getTagID(), tagList).size() > 0)
                    map.put("children", tagChild(tag.getTagID(), tagList));
                list.add(map);
            }
            if (tag.getTagID() == tagID) {
                for (TagStation tagStation : tag.getTagStationList()) {
                    Map<String, Object> temp = new LinkedHashMap<String, Object>();
                    temp.put("name", tagStation.getStaName());
                    temp.put("id", tagStation.getStaID());
                    list.add(temp);
                }
            }

        }
        System.out.println(JSON.toJSONString(list));
        return list;

    }

    private void addTagStation(List<Tag> tagList) {
        for (Tag tag : tagList) {
            TagStation tagStation = new TagStation();
            tagStation.setTagID(tag.getTagID());
            tag.setTagStationList(tagStationService.select(tagStation));
        }
    }

    @RequestMapping("/children")
    public void selectChildren(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        long pStaID = Long.parseLong(request.getParameter("pStaID"));
        List<Station> childrenStas = stationService.selectChildren(pStaID);

        ResContent resContent = new ResContent();
        if (childrenStas.size() <= 0) {
            resContent.setCode(102);
            resContent.setMessage("没有数据");
        } else {
            resContent.setCode(101);
            resContent.setMessage("获取成功");
            resContent.setData(childrenStas);
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/show")
    public void selectStation(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        long staID = 0;
        try {
            staID = Long.parseLong(request.getParameter("staID"));
        } catch (Exception e) {
            resContent.setCode(103);
            resContent.setMessage("参数错误");
            response.getWriter().write(JSON.toJSONString(resContent));
            response.getWriter().close();
        }
        Station station = stationService.selectStaton(staID);
        TagStation tagStation = new TagStation();
        tagStation.setStaID(staID);
        List<TagStation> tagStationList = tagStationService.select(tagStation);
        String tagString="";
        if(tagStationList!=null)
            tagString = tagToString(tagStationList);
        StationFile stationFile = new StationFile();
        stationFile.setStaID(staID);
        List<StationFile> fileList = stationFileService.select(stationFile);
        if (station == null) {
            resContent.setCode(102);
            resContent.setMessage("没有该站点");
        } else {
            resContent.setCode(101);
            resContent.setMessage("获取成功");
            station.setTagString(tagString);
            station.setFileList(fileList);
            resContent.setData(station);
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    private String tagToString(List<TagStation> tagStationList) {
        String result = "";
        for (TagStation tagStation : tagStationList) {
            result += tagStation.getTagName() + ",";
        }
        if(!result.equals(""))
            result=result.substring(0, result.length() - 1);
        return result;
    }


    @RequestMapping("/add")
    public void insertStation(Station station, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        if (station.getStaName() == null || station.getStaName().equals("")) {
            resContent.setCode(102);
            resContent.setMessage("参数错误或者为空");
        } else {
            int count = stationService.insertStation(station);
            addTag(station);
            Utils.dealForAdd(resContent, count);
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    private void addTag(Station station) {
        String tagString = station.getTagString();
        if(tagString!=null&&!tagString.equals("")) {
            String[] tags = tagString.split(",");
            long staID = station.getStaID();
            List<TagStation> tagStationList = new ArrayList<>();
            for (int i = 0; i < tags.length; i++) {
                Tag tag = new Tag();
                tag.setTagType(0);
                tag.setTagName(tags[i]);
                List<Tag> tagList = tagService.select(tag);
                if (tagList.size() == 0) {
                    int ic = tagService.insert(tag);
                    TagStation tagStation = new TagStation();
                    tagStation.setStaID(staID);
                    tagStation.setTagID(tag.getTagID());
                    tagStationList.add(tagStation);
                } else {
                    tag = tagList.get(0);
                    TagStation tagStation = new TagStation();
                    tagStation.setStaID(staID);
                    tagStation.setTagID(tag.getTagID());
                    tagStationList.add(tagStation);
                }
            }
            tagStationService.insert(tagStationList);
        }
    }

    @RequestMapping("/delete")
    public void deleteStation(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        long staID = Long.parseLong(request.getParameter("staID"));
        int count = stationService.deleteStation(staID);
        TagStation tagStation = new TagStation();
        tagStation.setStaID(staID);
        tagStationService.delete(tagStation);
        ResContent resContent = new ResContent();
        Utils.dealForDel(count, resContent);
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/update")
    public void updateStation(Station station, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        if (station.getStaID() != -1) {
            int count = stationService.updateStation(station);
            TagStation tagStation = new TagStation();
            tagStation.setStaID(station.getStaID());
            tagStationService.delete(tagStation);
            addTag(station);
            Utils.dealForUpdate(count, resContent);
        } else {
            resContent.setCode(103);
            resContent.setMessage("参数错误");
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
                FileUtils.copyInputStreamToFile(file.getInputStream(), new File(
                        imageRoot,
                        file.getOriginalFilename()));
            }
            String url = imageRoot + file.getOriginalFilename();
            long staID = Long.parseLong(request.getParameter("staID"));

            String temp = file.getOriginalFilename();
            String fileName = temp.split("\\.")[0];
            file1.setUrl(url);
            file1.setFileName(fileName);
            file1.setFileType(0);
            int ic = fileservice.insert(file1);
            StationFile stationFile = new StationFile();
            stationFile.setStaID(staID);
            stationFile.setFileID(file1.getFileID());
            stationFileService.insert(stationFile);
            resContent.setCode(101);
            resContent.setMessage("上传成功");
        }catch (NumberFormatException ne){
            resContent.setCode(103);
            resContent.setMessage("参数错误");
            response.getWriter().write(JSON.toJSONString(resContent));
            response.getWriter().close();
            return;
        }
        catch (Exception e){
            resContent.setCode(102);
            resContent.setMessage("上传失败");
            response.getWriter().write(JSON.toJSONString(resContent));
            response.getWriter().close();
            return;
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/delPic")
    public void delPic(HttpServletRequest request,HttpServletResponse response)throws IOException{
        response.setCharacterEncoding(charact);
        ResContent resContent=new ResContent();
        try {
            long fileID = Long.parseLong(request.getParameter("fileID"));
            long staID = Long.parseLong(request.getParameter("staID"));
            StationFile stationFile=new StationFile();
            stationFile.setStaID(staID);
            stationFile.setFileID(fileID);
            stationFileService.delete(stationFile);
            resContent.setCode(101);
            resContent.setMessage("删除成功");
        }
        catch (Exception e){
            resContent.setMessage("参数错误");
            resContent.setCode(103);
            response.getWriter().write(JSON.toJSONString(resContent));
            response.getWriter().close();
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    public List<Station> staCommon;

    public List<Object> staList(List<Station> sta) {
        List<Object> list = new ArrayList<Object>();
        this.staCommon = sta;
        for (Station x : sta) {
            Map<String, Object> mapArr = new LinkedHashMap<String, Object>();
            if (x.getpStaID() == 0) {
                mapArr.put("name", x.getStaName());
                mapArr.put("id", x.getStaID());
                mapArr.put("longitude", x.getLongitude());
                mapArr.put("latitude", x.getLatitude());
                mapArr.put("pid", x.getpStaID());
                if (staChild(x.getStaID()).size() > 0)
                    mapArr.put("children", staChild(x.getStaID()));
                list.add(mapArr);
            }
        }
        return list;
    }

    public List<?> staChild(long id) {
        List<Object> lists = new ArrayList<Object>();
        for (Station a : staCommon) {
            Map<String, Object> childArray = new LinkedHashMap<String, Object>();
            if (a.getpStaID() == id) {
                childArray.put("id", a.getStaID());
                childArray.put("name", a.getStaName());
                childArray.put("pid", a.getpStaID());
                childArray.put("longitude", a.getLongitude());
                childArray.put("latitude", a.getLatitude());
//                childArray.put("level", a.getDepth());
                if (staChild(a.getStaID()).size() > 0)
                    childArray.put("children", staChild(a.getStaID()));
                lists.add(childArray);
            }
        }
        return lists;

    }
}
