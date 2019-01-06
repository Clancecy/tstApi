package com.testyle.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONException;
import com.testyle.common.ExcelUtils;
import com.testyle.common.ResContent;
import com.testyle.common.Utils;
import com.testyle.model.*;
import com.testyle.service.*;
import okhttp3.*;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/data")
public class DataController {
    @Resource
    private IDataService dataService;
    @Resource
    private IRecordService recordService;
    @Resource
    private IItemService itemService;
    @Resource
    private ITestService testService;
    @Resource
    private ITaskService taskService;

    String Esurl = "http://127.0.0.1:8080/";

    String charact = "UTF-8";

    @RequestMapping("/add")
    public void addData(Data data, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        OkHttpClient okHttpClient = new OkHttpClient.Builder().build();
        String fname = request.getParameter("url");
        if (data.getTestID() == -1
                || data.getTaskID() == -1
                || data.getProID() == -1
                || data.getDataVal() == null
                || fname == null
        ||data.getStatus()==-1) {
            resContent.setCode(107);
            resContent.setMessage("参数错误");
        } else {
            Task task=new Task();
            task.setTaskID(data.getTaskID());
            task=taskService.select(task).get(0);
            task.setUrl(fname);
            taskService.update(task);
            try {
                    String url = Esurl + "data/add";
                    FormBody formBody = new FormBody.Builder()
                            .add("url", fname)
                            .add("dataVal", data.getDataVal())
                            .build();
                    Request req = new Request.Builder().url(url)
                            .post(formBody)
                            .build();
                    Call call = okHttpClient.newCall(req);
                    Response response1 = call.execute();
                    String Str = response1.body().string();
                    resContent = JSON.parseObject(Str, ResContent.class);
                    String RecStr = resContent.getData().toString();
                    List<Record> dataList = (List<Record>) JSON.parseArray(RecStr, Record.class);
                    addDb(dataList, data, resContent);
                } catch (JSONException jsone) {
                    resContent.setCode(109);
                    resContent.setMessage(jsone.getMessage());
                }
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }

    @RequestMapping("/proStatus")
    public void changeStatus(Task task, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        if (task.getTaskID()==-1 ||
        task.getStatus()==-1) {
            resContent.setCode(103);
            resContent.setMessage("参数错误");
        } else {
            int status=task.getStatus();
            List<Task> taskList = taskService.select(task);
            if (taskList.size() == 0) {
                resContent.setCode(104);
                resContent.setMessage("没有该记录");
            } else {
                task = taskList.get(0);
                task.setStatus(status);
                int count = taskService.update(task);
                Utils.dealForUpdate(count, resContent);
            }
        }
        response.getWriter().write(JSON.toJSONString(resContent));
        response.getWriter().close();
    }


    @RequestMapping("/get")
    public void getData(Data data, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(charact);
        ResContent resContent = new ResContent();
        OkHttpClient okHttpClient = new OkHttpClient.Builder().build();
        try {
            List<Data> dataList = dataService.select(data);
            String url = Esurl + "data/get";
            FormBody formBody = new FormBody.Builder()
                    .add("dataVal", JSON.toJSONString(dataList))
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

    private List<Project> toProjects(List<Data> dataList) {
        Map<Long, Integer> map = new HashMap<>();
        for (Data tempData : dataList) {
            if (map.containsKey(tempData.getProID())) {
                Integer num = map.get(tempData.getProID());
                map.put(tempData.getProID(), num + 1);
            } else {
                map.put(tempData.getProID(), 1);
            }
        }
        List<Project> projects = new ArrayList<>();
        for (long proID : map.keySet()) {
            Project project = new Project();
            project.setProID(proID);
            project.setRecords(getDbRecords(dataList, proID));
            projects.add(project);
        }
        return projects;
    }

    private List<Record> getDbRecords(List<Data> dataList, long proID) {
        Record record = new Record();
        record.setProID(proID);
        List<Record> records = recordService.select(record);
        List<Record> resultRecords = dealRecords(records);
        comDataList(resultRecords, dataList);
        return resultRecords;
    }

    private void comDataList(List<Record> resultRecords, List<Data> dataList) {
        for (int i = 0; i < resultRecords.size(); i++) {
            Record chunk = resultRecords.get(i);
            List<Record> records = chunk.getRecords();
            int size = records.size();
            int testOrder = 1;
            for (int j = 0; j < size; j++) {
                Record record = records.get(j);
                long recordID = record.getRecordID();
                List<Item> itemList = record.getItemList();
                changeItem(dataList, testOrder, recordID, itemList);
            }
            if (i == resultRecords.size() - 1) {
                for (int k = 2; ; k++) {
                    if (!findData(dataList, k)) {
                        break;
                    } else {
                        Record record = records.get(size - 1);
                        Record newRecord = new Record();
                        long recordID = record.getRecordID();
                        newRecord.setRecordID(recordID);
                        newRecord.setRecordName(String.valueOf(k));
                        newRecord.setProID(record.getProID());
                        newRecord.setpRecID(record.getpRecID());
                        newRecord.setItemList(record.getItemList());
                        List<Item> newItemList = changeItem(dataList, k, recordID, newRecord.getItemList());
                        newRecord.setItemList(newItemList);
                        records.add(newRecord);
                    }
                }
            }
        }
    }

    private List<Item> changeItem(List<Data> dataList, int testOrder, long recordID, List<Item> newItemList) {
        List<Item> resList = new ArrayList<>();
        for (Item item : newItemList) {
            long itemID = item.getItemID();
            for (Data data : dataList) {
                if (data.getRecordID() == recordID
                        && data.getItemID() == itemID
                        && data.getTestOrder() == testOrder) {
                    Item tempitem = new Item();
                    tempitem.setItemID(itemID);
                    tempitem.setRecordID(item.getRecordID());
                    tempitem.setItemName(item.getItemName());
                    tempitem.setItemType(item.getItemType());
                    tempitem.setItemVal(data.getDataVal());
                    resList.add(tempitem);
                    break;
                }
            }
        }
        return resList;
    }

    private boolean findData(List<Data> dataList, int testOrder) {
        boolean flag = false;
        for (Data data : dataList) {
            if (data.getTestOrder() == testOrder) {
                flag = true;
                break;
            }
        }
        return flag;
    }


    private List<Record> dealRecords(List<Record> records) {
        List<Record> recordList = new ArrayList<Record>();
        for (Record x : records) {
            if (x.getpRecID() == 0) {
                Record record = x;
                record.setRecords(getRecords(records, x.getRecordID()));
                recordList.add(record);
            }
        }
        return recordList;
    }

    private List<Record> getRecords(List<Record> records, long ID) {
        List<Record> recordList = new ArrayList<Record>();
        for (Record x : records) {
            if (x.getpRecID() == ID) {
                Record record = x;
                record.setItemList(getItems(x.getRecordID()));
                recordList.add(record);
            }
        }
        return recordList;
    }

    private List<Item> getItems(long ID) {
        Item item = new Item();
        item.setRecordID(ID);
        List<Item> itemList = itemService.select(item);
        return itemList;
    }

    private void getListComExcel(List<Record> reqRecords, List<Record> excelRecords) {
        int chunkCount = reqRecords.size();
        for (int i = 0; i < chunkCount; i++) {
            List<Record> records = reqRecords.get(i).getRecords();
            int recordCount = records.size();
            for (int j = 0; j < recordCount; j++) {
                List<Item> itemList = records.get(j).getItemList();
                int itemCount = itemList.size();
                for (int k = 0; k < itemCount; k++) {
                    Item item = itemList.get(k);
                    String excelVal = excelRecords.get(i).getRecords()
                            .get(j).getItemList().get(k).getItemVal();
                    item.setItemVal(excelVal);
                }
            }
        }
    }

    private void addDb(List<Record> records, Data data, ResContent resContent) {
        List<Data> List = new ArrayList<>();
        boolean isExt = false;
        for (Record chunk : records) {
            List<Record> recordList = chunk.getRecords();
            int recCount = recordList.size();
            for (int i = 0; i < recCount; i++) {
                Record record = recordList.get(i);
                long recordID = record.getRecordID();
                int testOrder = i + 1;
                for (Item item : record.getItemList()
                ) {
                    Data tempData = new Data();
                    tempData.setTestID(data.getTestID());
                    tempData.setTaskID(data.getTaskID());
                    tempData.setProID(data.getProID());
                    long itemID = item.getItemID();
                    String dataVal = item.getItemVal();
                    tempData.setRecordID(recordID);
                    tempData.setTestOrder(testOrder);
                    tempData.setItemID(itemID);
                    tempData.setDataVal(dataVal);
                    long dataID = dataService.selOne(tempData);
                    if (dataID == 0) {
                        List.add(tempData);
                    } else {
                        isExt = true;
                        tempData.setDataID(dataID);
                        List.add(tempData);
                    }
                }
            }
        }
        if (!isExt) {
            int count = dataService.insertList(data.getTable(),List);
            if (count > 0) {
                resContent.setCode(101);
                resContent.setMessage("新增成功，新增" + count + "条数据");
            } else {
                resContent.setCode(104);
                resContent.setMessage("新增失败");
            }
        } else {
            int count = dataService.updateList(data.getTable(),List);
            if (count > 0) {
                resContent.setCode(101);
                resContent.setMessage("更新成功，更新" + count + "条数据");
            } else {
                resContent.setCode(105);
                resContent.setMessage("更新失败");
            }
        }

    }

    private int writeToItemExcel(Workbook wb, List<Record> newList) {
        Sheet sheet = wb.getSheetAt(1);
        int oldRowCount = sheet.getPhysicalNumberOfRows();
        int rowCount = sheet.getPhysicalNumberOfRows();
        int chunkCount = newList.size();
        int startRow = 1;
        int addRecordNum = 0;    // 动态添加的记录数

        for (int i = 0; i < chunkCount; i++) {
            Record chunk = newList.get(i);

            // 写入记录
            for (Record record : chunk.getRecords()) {
                // 将记录值写入
                if (startRow < rowCount) {
                    startRow = writeOnlyValue(sheet, wb, record, startRow);
                }
                // 添加行并写入相关信息
                else {
                    addRecordNum++;
                    startRow = writeAddLine(sheet, record, startRow);
                    rowCount = startRow;
                }
            }
        }

        // 合并chunk
        mergeChunk(sheet, oldRowCount, rowCount);

        return addRecordNum;
    }

    /**
     * 合并chunk
     *
     * @param oldRowCount
     * @param rowCount
     */
    private void mergeChunk(Sheet sheet, int oldRowCount, int rowCount) {
        for (int i = 0; i < sheet.getMergedRegions().size(); i++) {
            CellRangeAddress address = sheet.getMergedRegion(i);
            if (address.getLastRow() == oldRowCount - 1 && address.getFirstColumn() == 0) {
                int si = address.getFirstRow();
                sheet.removeMergedRegion(i);
                sheet.addMergedRegionUnsafe(new CellRangeAddress(si, rowCount - 1, 0, 0));
            }
        }
    }

    /**
     * 只将值写入excel
     *
     * @param sheet
     * @param record
     * @param startRow
     * @return 新的起始行
     */
    private int writeOnlyValue(Sheet sheet, Workbook wb, Record record, int startRow) {
        ExcelUtils excelUtils = new ExcelUtils();
        final int nameCol = 2, valueCol = 3;
        List<Item> Items = record.getItemList();
        // 处理记录内的条目，对应一行
        for (int tem = startRow; startRow < tem + Items.size(); startRow++) {
            Row row = sheet.getRow(startRow);
            Cell cell = row.getCell(valueCol);
            // 如果是公式，不写入
            if (cell.getCellTypeEnum() == CellType.FORMULA) {
                continue;
            }
            // 找到对应条目写入值
            String name = String.valueOf(excelUtils.getCellValue(wb, row.getCell(nameCol)));
            for (Item item : Items) {
                if (item.getItemName().equals(name)) {
                    excelUtils.setCellValue(cell, item.getItemVal());
//                    excelUtils.setCellValue(cell, startRow + "");
                    break;
                }
            }
        }
        return startRow;
    }

    /**
     * 添加行并写入相关信息
     *
     * @param sheet
     * @param record
     * @param startRow
     */
    private int writeAddLine(Sheet sheet, Record record, int startRow) {
        ExcelUtils excelUtils = new ExcelUtils();
        final int nameCol = 2, valueCol = 3;
        List<Item> Items = record.getItemList();
        int itemCount = Items.size();
        int recordStartRow = startRow;

        // 处理记录内的条目
        for (; startRow < recordStartRow + itemCount; startRow++) {
            Row row = sheet.createRow(startRow);
            Row referRow = sheet.getRow(startRow - itemCount);
            Item Item = Items.get(startRow - recordStartRow);

            for (int i = 0; i < referRow.getPhysicalNumberOfCells(); i++) {
                Cell cell = row.createCell(i);
                Cell referCell = referRow.getCell(i);
                cell.setCellStyle(referCell.getCellStyle());
                cell.setCellType(referCell.getCellTypeEnum());

                // 根据单元格所属列写入不同数据
                if (i == 1 && startRow == recordStartRow) {
                    excelUtils.setCellValue(cell, record.getRecordName());
                } else if (referCell.getCellTypeEnum() == CellType.FORMULA) {
                    cell.setCellFormula(referCell.getCellFormula());
                } else if (i == nameCol) {
                    excelUtils.setCellValue(cell, Item.getItemName());
                } else if (i == valueCol) {
                    excelUtils.setCellValue(cell, Item.getItemVal());
                } else {
                    excelUtils.setCellValue(cell, referCell.getStringCellValue());
                }
            }
        }

        // 合并记录名单元格
        sheet.addMergedRegionUnsafe(new CellRangeAddress(recordStartRow, startRow - 1, 1, 1));
        // 合并chunk名单元格
        // sheet.addMergedRegionUnsafe(new CellRangeAddress(recordStartRow, startRow - 1, 0, 0));

        return startRow;
    }


    /**
     * 添加内容到显示表
     *
     * @param sheet
     * @param addRecordNum 需要添加的行数
     */
    private static void writeToReportExcel(Sheet sheet, int addRecordNum) {
        int rowCount = sheet.getPhysicalNumberOfRows();
        for (int i = 0; i < addRecordNum; i++) {
            Row row = sheet.createRow(rowCount + i);
            Row referRow = sheet.getRow(rowCount - 1);
            for (int j = 0; j < referRow.getPhysicalNumberOfCells(); j++) {
                Cell cell = row.createCell(j);
                Cell referCell = referRow.getCell(j);
                cell.setCellStyle(referCell.getCellStyle());
                cell.setCellType(referCell.getCellTypeEnum());
                cell.setCellFormula(referCell.getCellFormula());
            }
        }
    }
}
