package com.testyle.common;

import com.alibaba.fastjson.JSON;
import com.testyle.dao.IDataDao;
import com.testyle.dao.IItemDao;
import com.testyle.model.DevAttrVal;
import com.testyle.model.Item;
import com.testyle.model.Plan;
import com.testyle.model.Record;
import com.testyle.service.IItemService;
import org.apache.poi.ss.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Component
public class Utils {
    @Autowired
    private IItemService itemService;

    public static Utils utils;
    @PostConstruct
    public void init(){
        utils=this;
    }
    public static void dealResForSelall(ResContent resContent, List<Object> devTypes) {
        if(devTypes.size()<=0){
            resContent.setMessage("没有数据");
            resContent.setCode(102);
        }
        else {
            resContent.setCode(101);
            resContent.setMessage("获取成功");
            resContent.setData(devTypes);
        }
    }

    public static void dealForAdd(ResContent resContent, int count) {
        if(count>0) {
            resContent.setCode(101);
            resContent.setMessage("添加成功");
        }
        else {
            resContent.setCode(102);
            resContent.setMessage("添加失败");
        }
    }

    public static void dealForDel(int count, ResContent resContent) {
        if(count>0){
            resContent.setCode(101);
            resContent.setMessage("删除成功");
        }else {
            resContent.setCode(102);
            resContent.setMessage("删除失败");
        }
    }

    public static void dealForUpdate(int count, ResContent resContent) {
        if(count>0){
            resContent.setCode(101);
            resContent.setMessage("更新成功");
        }else {
            resContent.setCode(102);
            resContent.setMessage("更新失败");
        }
    }

    public List<Record> readExcel(String fname) {
        List<Record> records=new ArrayList<>();
        try {
            FileInputStream fis = new FileInputStream(fname);
            Workbook workbook = WorkbookFactory.create(fis);
//            CreationHelper crateHelper = workbook.getCreationHelper();
//            FormulaEvaluator evaluator = crateHelper.createFormulaEvaluator();
//            evaluator.clearAllCachedResultValues();
            Sheet sheet = workbook.getSheetAt(1);
            records=getChunk(workbook);
            workbook.close();
            fis.close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
//            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            e.printStackTrace();
        }
        return records;
    }


    private List<Record> getChunk(Workbook wb) {
        Sheet sheet=wb.getSheetAt(1);
        ExcelUtils excelUtils =new ExcelUtils();
        List<Record> chuckList = new ArrayList<>();
        int rowCount = sheet.getPhysicalNumberOfRows();
        final int chunkCol = 0;
        int chunkEnd = 0;

        for(int chunkStart=1; chunkStart<rowCount; chunkStart++) {
            chunkEnd = excelUtils.skipMergeRowCell(sheet, chunkStart, chunkCol);	// 列0对应chunk

            Record chunk = new Record();
            Row row = sheet.getRow(chunkStart);
            Cell cell = row.getCell(chunkCol);
            if (excelUtils.getCellValue(wb,cell).toString().equals(""))
                break;
            chunk.setRecordName(excelUtils.getCellValue(wb,cell).toString());
            chunk.setRecords(getRecord(wb,chunkStart,chunkEnd));
            chuckList.add(chunk);

            chunkStart = chunkEnd;
        }
        return chuckList;
    }

    /**
     * @param wb
     * @param chunkStart
     * @param chunkEnd
     * @return
     */
    private List<Record> getRecord(Workbook wb, int chunkStart, int chunkEnd) {
        Sheet sheet=wb.getSheetAt(1);
        ExcelUtils excelUtils =new ExcelUtils();
        List<Record> recordList = new ArrayList<>();
        final int recordCol = 1;
        int recordEnd = 0;

        for (int recordStart = chunkStart; recordStart <= chunkEnd; recordStart++) {
            recordEnd = excelUtils.skipMergeRowCell(sheet, recordStart, recordCol);		// 列1对应记录名
            Record record = new Record();
            Row row = sheet.getRow(recordStart);
            Cell cell = row.getCell(recordCol);
            record.setRecordName(excelUtils.getCellValue(wb,cell).toString());
            record.setItemList(getItems(wb, recordStart, recordEnd));
            recordList.add(record);
            recordStart = recordEnd;
        }
        return recordList;
    }

    /**
     * @param wb
     * @param recordStart
     * @param recordEnd
     * @return
     */
    private List<Item> getItems(Workbook wb, int recordStart, int recordEnd) {
        Sheet sheet=wb.getSheetAt(1);
        ExcelUtils excelUtils =new ExcelUtils();
        List<Item> itemBeanList = new ArrayList<>();
        final int nameCol = 2;
        final int valueCol = 3;
        for (int i = recordStart; i <= recordEnd; i++) {
            Row row = sheet.getRow(i);
            Cell cell = row.getCell(nameCol);
            Item item = new Item();
            item.setItemName(excelUtils.getCellValue(wb,cell).toString());
            cell = row.getCell(valueCol);
            item.setItemVal(excelUtils.getCellValue(wb,cell).toString());
            item.setItemType(String.valueOf(cell.getCellTypeEnum()));
            itemBeanList.add(item);
        }
        return itemBeanList;
    }


    public List<Record> dealRecords(List<Record> records){
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
        List<Item> itemList=utils.itemService.select(item);
        return itemList;
    }

    public static void claCyctime(Plan plan){
        int type=plan.getCycType();
        Date date=plan.getCyctime();
        Calendar calendar = Calendar.getInstance();
        switch (type){
            case 0:
                plan.setCyctime(date);
                break;
            case 1:
                calendar.setTime(date);
                calendar.add(Calendar.DAY_OF_YEAR,1);
                plan.setCyctime(calendar.getTime());
                break;
            case 2:
                calendar.setTime(date);
                calendar.add(Calendar.WEEK_OF_YEAR,1);
                plan.setCyctime(calendar.getTime());
                break;
            case 3:
                calendar.setTime(date);
                calendar.add(Calendar.MONTH,1);
                plan.setCyctime(calendar.getTime());
                break;
            case 4:
                calendar.setTime(date);
                calendar.add(Calendar.MONTH,3);
                plan.setCyctime(calendar.getTime());
                break;
            case 5:
                calendar.setTime(date);
                calendar.add(Calendar.YEAR,1);
                plan.setCyctime(calendar.getTime());
                break;
        }
    }

    /**
     * 生成 日期+随机数的流水号
     * */
    public static String getNumberForPK(){
        String id="";
        SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
        String temp = sf.format(new Date());
        int random=(int) (Math.random()*10000);
        id=temp+random;
        return id;
    }
}
