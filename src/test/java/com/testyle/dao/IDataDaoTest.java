package com.testyle.dao;

import com.alibaba.fastjson.JSON;
import com.testyle.common.Utils;
import com.testyle.model.Data;
import com.testyle.model.Item;
import com.testyle.model.Project;
import com.testyle.model.Record;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class IDataDaoTest {
    @Autowired
    private IDataDao dataDao;
    @Autowired
    private IRecordDao recordDao;
    @Autowired
    private IItemDao itemDao;

    @Test
    public void testData() {
        Data data = new Data();
        List<Data> dataList = dataDao.select(data);
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

//        System.out.println(JSON.toJSONString(projects));
    }

    private List<Record> getDbRecords(List<Data> dataList, long proID) {
        Record record = new Record();
        record.setProID(proID);
        List<Record> records = recordDao.select(record);
        List<Record> resultRecords = dealRecords(records);
        comDataList(resultRecords,dataList);
        return resultRecords;
    }

    private void comDataList(List<Record> resultRecords, List<Data> dataList) {
        for (int i=0;i< resultRecords.size();i++) {
            Record chunk =resultRecords.get(i);
            List<Record> records=chunk.getRecords();
            int size=records.size();
            int testOrder = 1;
            for (int j=0;j<size;j++) {
                Record record=records.get(j);
                long recordID = record.getRecordID();
                List<Item> itemList=record.getItemList();
                changeItem(dataList, testOrder, recordID, itemList);
            }
            if(i==resultRecords.size()-1){
                for(int k=2;;k++){
                    if(!findData(dataList,k)){
                        break;
                    }else {
                        Record record=records.get(size-1);
                        Record newRecord=new Record();
                        long recordID = record.getRecordID();
                        newRecord.setRecordID(recordID);
                        newRecord.setRecordName(String.valueOf(k));
                        newRecord.setProID(record.getProID());
                        newRecord.setpRecID(record.getpRecID());
                        newRecord.setItemList(record.getItemList());
                        List<Item> newItemList=changeItem(dataList, k, recordID, newRecord.getItemList());
                        newRecord.setItemList(newItemList);
                        records.add(newRecord);
                    }
                }

            }
        }
        System.out.println(JSON.toJSONString(resultRecords));
    }

    private List<Item> changeItem(List<Data> dataList, int testOrder, long recordID, List<Item> newItemList) {
        List<Item> resList=new ArrayList<>();
        for (Item item:newItemList) {
            long itemID = item.getItemID();
            for (Data data : dataList) {
                if (data.getRecordID() == recordID
                        && data.getItemID() == itemID
                        && data.getTestOrder() == testOrder) {
                    Item tempitem=new Item();
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

    private boolean findData(List<Data>dataList,int testOrder){
        boolean flag=false;
        for(Data data:dataList){
            if(data.getTestOrder()==testOrder){
                flag=true;
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
        List<Item> itemList = itemDao.select(item);
        return itemList;
    }


    @Test
    public void testUpdate(){
        List<Data> dataList=new ArrayList<>();
        Data data=new Data();
        data.setDataID(323);
        data.setDataVal("tt");
        dataList.add(data);
        dataList.add(data);
        dataList.add(data);
        dataDao.updateList(data.getTable(),dataList);
    }
}
