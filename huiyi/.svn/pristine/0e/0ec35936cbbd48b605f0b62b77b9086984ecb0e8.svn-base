package com.mvc.cms.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Service;

import com.mvc.HYConstants;
import com.mvc.cms.model.Channel;
import com.mvc.framework.service.BaseService;

@Service
public class ChannelManager extends BaseService<Channel, Serializable> {

	public Integer getprentLevelBy(Long parentId) {

		String sql = "select A from " + Channel.class.getName() + " A where 1=1 And A.objectId = ?";
		List<Channel> channels = searchBySql(sql, parentId);

		return channels.get(0).getLevel();
	}

	public List<Channel> getFirstLevels() {
		String sql = "select A from " + Channel.class.getName() + " A where 1=1 And A.level = 1";
		List<Channel> channels = searchBySql(sql);
		return channels;
	}

	public List<Channel> getSecondLevels(Long parentId) {
		String sql = "select A from " + Channel.class.getName() + " A where 1=1 And A.parentId = ?";
		List<Channel> channels = searchBySql(sql, parentId);
		return channels;
	}

	public List<Channel> getChildChannelByObjectId(Long objectId) {
		String sql = "select A from " + Channel.class.getName() + " A where A.parentId = ?";
		return searchBySql(sql, objectId);
	}

	public List<Channel> isNewCodeByPositionCodeAndObjId(String positionCode, Long objId) {
		if (null == objId) {
			String sql1 = "select A from " + Channel.class.getName() + " A where A.positionCode = ?";
			return searchBySql(sql1, positionCode);
		}
		String sql = "select A from " + Channel.class.getName() + " A where A.positionCode = ? And A.objectId != ?";
		return searchBySql(sql, positionCode, objId);
	}

	public Channel getChannelByPositionCode(String positionCode) {
		return super.searchByWhere("positionCode =?", positionCode);
	}

	public List<Channel> getChildChannelByParentCode(String positionCode) {
		String sql = "select A from " + Channel.class.getName() + " A," + Channel.class.getName()
				+ " B where A.parentId = B.objectId AND B.positionCode = ? and A.status = ? order by A.priority ";
		return searchBySql(sql, positionCode, HYConstants.STATUS_VALID);
	}

}
