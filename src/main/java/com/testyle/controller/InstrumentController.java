package com.testyle.controller;

import com.alibaba.fastjson.JSON;
import com.testyle.common.ResContent;
import com.testyle.common.Utils;
import com.testyle.model.DevAttrVal;
import com.testyle.model.Instrument;
import com.testyle.model.InstrumentFile;
import com.testyle.service.IDevAttrValService;
import com.testyle.service.IFileService;
import com.testyle.service.IInstrumentFileService;
import com.testyle.service.IInstrumentService;
import org.apache.commons.io.FileUtils;
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
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/instrument")
public class InstrumentController {
    @Resource
    private IInstrumentService instrumentService;
    @Resource
    IInstrumentFileService instrumentFileService;
    @Resource
    IFileService fileservice;
    String charact = "UTF-8";
    String imageRoot = "E:/image/";

    @RequestMapping("/add")
    public void addIns(Instrument instrument, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        if (instrument.getInsName() == null
                || instrument.getInsName().equals("")) {
            resContent.setCode(103);
            resContent.setMessage("参数错误或者为空");
        } else {
            int count = instrumentService.insert(instrument);
            Utils.dealForAdd(resContent, count);
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/insPic")
    public void devPic(@RequestParam("devPic") MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        try {
            if (!file.isEmpty()) {
                FileUtils.copyInputStreamToFile(file.getInputStream(), new java.io.File(
                        imageRoot,
                        file.getOriginalFilename()));
            }
            String url = imageRoot + file.getOriginalFilename();
            long insID = Long.parseLong(request.getParameter("insID"));
            Instrument instrument = instrumentService.selectByID(insID);
            instrument.setInsUrl(url);
            instrumentService.update(instrument);
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
            String url = imageRoot + file.getOriginalFilename();
            long insID = Long.parseLong(request.getParameter("insID"));
            Instrument instrument = instrumentService.selectByID(insID);
            instrument.setPlateUrl(url);
            instrumentService.update(instrument);
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

    @RequestMapping("delete")
    public void deleteInstrument(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        long insID = Long.parseLong(request.getParameter("insID"));
        int count = instrumentService.delete(insID);
        InstrumentFile instrumentFile = new InstrumentFile();
        instrumentFile.setInsID(insID);
        instrumentFileService.delete(instrumentFile);
        ResContent resContent = new ResContent();
        Utils.dealForDel(count, resContent);
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/update")
    public void updateIns(Instrument instrument, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        if (instrument.getInsID() != -1) {
            int count = instrumentService.update(instrument);
            Utils.dealForUpdate(count, resContent);
        } else {
            resContent.setCode(103);
            resContent.setMessage("参数错误");
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }
    @RequestMapping("/show")
    public void showIns(HttpServletRequest request,HttpServletResponse response)throws IOException{
        ResContent resContent=new ResContent();
        response.setCharacterEncoding(charact);
        try {
            long insID=Long.parseLong(request.getParameter("insID"));
            Instrument ins=instrumentService.selectByID(insID);
            InstrumentFile instrumentFile=new InstrumentFile();
            instrumentFile.setInsID(insID);
            ins.setFileList(instrumentFileService.select(instrumentFile));
            resContent.setCode(101);
            resContent.setMessage("获取成功");
            resContent.setData(ins);
        }catch (NumberFormatException ne){
            resContent.setCode(102);
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
            resContent.setCode(101);
            resContent.setMessage("获取成功");
            resContent.setData(instruments);
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
            String url = imageRoot + file.getOriginalFilename();
            long insID = Long.parseLong(request.getParameter("insID"));
            String temp = file.getOriginalFilename();
           // String fileName = temp.split("\\.")[0];
            file1.setUrl(url);
            file1.setFileName(temp);
            file1.setFileType(1);
            int ic = fileservice.insert(file1);
            InstrumentFile instrumentFile = new InstrumentFile();
            instrumentFile.setInsID(insID);
            instrumentFile.setFileID(file1.getFileID());
            instrumentFileService.insert(instrumentFile);
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

    @RequestMapping("/delFile")
    public void delFile(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        try {
            long fileID = Long.parseLong(request.getParameter("fileID"));
            long insID = Long.parseLong(request.getParameter("insID"));
            InstrumentFile instrumentFile = new InstrumentFile();
            instrumentFile.setInsID(insID);
            instrumentFile.setFileID(fileID);
            instrumentFileService.delete(instrumentFile);
            resContent.setCode(101);
            resContent.setMessage("删除成功");
        } catch (Exception e) {
            resContent.setMessage(e.getMessage());
            resContent.setCode(103);
            response.getWriter().write(JSON.toJSONString(resContent));
            response.getWriter().close();
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }
    @RequestMapping("/download")
    public ResponseEntity<byte[]> filedownload(InstrumentFile instrumentFile) throws Exception {
        ResContent resContent = new ResContent();
        List<InstrumentFile> instrumentFileList = instrumentFileService.select(instrumentFile);
        if (instrumentFileList.size() == 0) {
            resContent.setCode(103);
            resContent.setMessage("没有文件");
            return null;
        } else {
            instrumentFile = instrumentFileList.get(0);
            String downLoadPath = instrumentFile.getUrl();
            String fileName = instrumentFile.getFileName();
            java.io.File file = new java.io.File(downLoadPath);
            HttpHeaders headers = new HttpHeaders();
            headers.setContentDispositionFormData("attachment", fileName);
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.OK);
        }
    }
}
