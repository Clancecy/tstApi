package com.testyle.service;

import com.testyle.model.TagStation;

import java.util.List;

public interface ITagStationService {
    List<TagStation> select(TagStation tagStation);
    int insert(List<TagStation> stationList);
    int insert(TagStation tagStation);
    int update(TagStation tagStation);
    int delete(TagStation tagStation);
}
