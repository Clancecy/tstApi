package com.testyle.controller;

import com.alibaba.fastjson.JSON;
import com.testyle.common.*;
import com.testyle.model.Item;
import com.testyle.model.Project;
import com.testyle.model.Record;
import com.testyle.service.IItemService;
import com.testyle.service.IProService;
import com.testyle.service.IRecordService;
import org.apache.commons.io.FileUtils;
import org.apache.poi.ss.usermodel.*;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/project")
public class ProController {
    @Resource
    private IProService proService;
    @Resource
    private IRecordService recordService;
    @Resource
    private IItemService itemService;

    String charact = "UTF-8";
    String root = "E:/file/";

    @RequestMapping("/index")
    public void index(HttpServletResponse response) throws IOException {
        response.getWriter().write(System.getProperty("root") + "/file");
        response.getWriter().close();
    }
    //用户系统upload
    public void doUpload(@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        if (!file.isEmpty()) {
            FileUtils.copyInputStreamToFile(file.getInputStream(), new File(
                    root,
                    file.getOriginalFilename()));
        }
        Project project = new Project();
        String url = root + file.getOriginalFilename();
        long devTypeID = Long.parseLong(request.getParameter("devTypeID"));
        project.setUrl(url);
        String temp=file.getOriginalFilename();
        project.setProName(temp.split("\\.")[0]);
        project.setDevTypeID(devTypeID);
        long ID = proService.insert(project);
        if (ID > 0) {
            readExcel(url,project.getProID());
            resContent.setCode(101);
            resContent.setMessage("上传成功");
        } else {
            resContent.setCode(102);
            resContent.setMessage("上传失败");
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }
    //用户获取项目
    public void getPro(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        if(request.getParameter("proID")==null){
            resContent.setCode(103);
            resContent.setMessage("参数错误");
        }else {
            long proID = Long.parseLong(request.getParameter("proID"));
            Record record = new Record();
            record.setProID(proID);
            List<Record> records = recordService.select(record);
            List<Record> objects = dealRecords(records);
            if (objects.size() > 0) {
                resContent.setCode(101);
                resContent.setMessage("获取成功");
                resContent.setData(objects);
            } else {
                resContent.setCode(102);
                resContent.setMessage("获取失败");
            }
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    private List<Record> dealRecords(List<Record> records){
        List<Record> recordList = new ArrayList<Record>();
        for (Record x : records) {
            if(x.getpRecID()==0){
                Record record=x;
                record.setRecords(getRecords(records,x.getRecordID()));
                recordList.add(record);
            }
        }
        return recordList;
    }

    private List<Record> getRecords(List<Record> records,long ID) {
        List<Record> recordList = new ArrayList<Record>();
        for (Record x : records) {
            if(x.getpRecID()==ID){
                Record record=x;
                record.setItemList(getItems(x.getRecordID()));
                recordList.add(record);
            }
        }
        return recordList;
    }
    private List<Item>getItems(long ID){
        Item item=new Item();
        item.setRecordID(ID);
        List<Item> itemList=itemService.select(item);
        return itemList;
    }
    private void readExcel(String fname, long proID) {
        try {
            FileInputStream fis = new FileInputStream(fname);
            Workbook workbook = WorkbookFactory.create(fis);
            Sheet sheet = workbook.getSheetAt(1);
            addFirstRecord(sheet,workbook, proID, 0);
            workbook.close();
            fis.close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
//            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            e.printStackTrace();
        }

    }

    private void addFirstRecord(Sheet sheet,Workbook wb, long proID, long pRecID) {
        ExcelUtils excelUtils = new ExcelUtils();
        int rowCount = sheet.getPhysicalNumberOfRows();
        final int chunkCol = 0;
        int chunkEnd = 0;
        Record record = new Record();
        for (int chunkStart = 1; chunkStart < rowCount; chunkStart++) {
            chunkEnd = excelUtils.skipMergeRowCell(sheet, chunkStart, chunkCol);    // 列0对应chunk
            Row row = sheet.getRow(chunkStart);
            Cell cell = row.getCell(chunkCol);
            if (excelUtils.getCellValue(wb,cell).toString().equals(""))
                break;
            record.setProID(proID);
            record.setpRecID(pRecID);
            record.setRecordName(excelUtils.getCellValue(wb,cell).toString());
            int count = recordService.insert(record);
            if (count > 0) {
                addSecondRecord(sheet,wb, chunkStart, chunkEnd, proID, record.getRecordID());
            }
            chunkStart = chunkEnd;
        }
    }

    private void addSecondRecord(Sheet sheet,Workbook wb, int Start, int End, long proID, long pRecID) {
        final int recordCol = 1;
        int recordEnd = 0;
        ExcelUtils excelUtils = new ExcelUtils();
        Record record = new Record();
        for (int recordStart = Start; recordStart <= End; recordStart++) {
            recordEnd = excelUtils.skipMergeRowCell(sheet, recordStart, recordCol);        // 列1对应记录名
            Row row = sheet.getRow(recordStart);
            Cell cell = row.getCell(recordCol);
            record.setProID(proID);
            record.setpRecID(pRecID);
            record.setRecordName(excelUtils.getCellValue(wb,cell).toString());
            int count = recordService.insert(record);
            if (count > 0) {
                addItems(sheet,wb, recordStart, recordEnd, record.getRecordID());
            }
            recordStart = recordEnd;
        }
    }

    private void addItems(Sheet sheet,Workbook wb, int Start, int End, long recordID) {
        List<Item> itemList = new ArrayList<>();
        final int nameCol = 2;
        final int valueCol = 3;
        ExcelUtils excelUtils = new ExcelUtils();
        for (int i = Start; i <= End; i++) {
            Row row = sheet.getRow(i);
            Cell cell = row.getCell(nameCol);
            Item item = new Item();
            item.setItemName(excelUtils.getCellValue(wb,cell).toString());
            cell = row.getCell(valueCol);
            item.setItemVal(excelUtils.getCellValue(wb,cell).toString());
            item.setItemType(String.valueOf(cell.getCellTypeEnum()));
            item.setRecordID(recordID);
            itemList.add(item);
        }
        itemService.insertList(itemList);
    }
}
