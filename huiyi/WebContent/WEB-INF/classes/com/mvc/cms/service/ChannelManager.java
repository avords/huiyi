package com.mvc.cms.service;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;

import com.mvc.cms.model.Channel;
import com.mvc.cms.model.ContentChannel;
import com.mvc.framework.service.BaseService;

@Service
public class ChannelManager extends BaseService<Channel, Serializable>{

	public Integer getprentLevelBy(Long parentId){
		return null;
	}
	
}
