package com.testyle.dao;

import com.testyle.model.Tag;
import com.testyle.model.TagStation;

import java.util.List;

public interface ITagStationDao {
    List<TagStation> select(TagStation tagStation);
    int insert(List<TagStation> stationList);
    int insertList(TagStation tagStation);
    int update(TagStation tagStation);
    int delete(TagStation tagStation);
}
