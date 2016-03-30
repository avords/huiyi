package com.mvc.service.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Service;

import com.mvc.framework.service.BaseService;
import com.mvc.service.model.ServiceChannel;

@Service
public class ServiceChannelManager extends BaseService<ServiceChannel, Serializable>{

	 public List<ServiceChannel> getChildChannelByObjectId(Long objectId) {
			String sql = "select A from " + ServiceChannel.class.getName() + " A where A.parentId = ?";
			return searchBySql(sql, objectId);
		}
	 
	 public List<ServiceChannel> getByCategoryLevel(Integer categoryLevel ) {
			String sql = "select A from " + ServiceChannel.class.getName() + " A where A.categoryLevel =" + categoryLevel;
			return searchBySql(sql);
		}
}
