package com.mvc.cms.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SQLQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.cms.model.Channel;
import com.mvc.cms.model.Content;
import com.mvc.cms.model.ContentChannel;
import com.mvc.framework.service.BaseService;
import com.mvc.product.model.Product;

@Service
public class ContentChannelManager extends BaseService<ContentChannel, Long> {

	@Autowired
	private ChannelManager channelManager;
	
	public List<Channel> getChannelsById(Long objectId) {
		String sql = "select A from " + ContentChannel.class.getName() + " A where contentId="+objectId;
		List<ContentChannel> cchannels=searchBySql(sql);
		List<Channel> channels= new ArrayList<Channel>();
		for(ContentChannel cchannel : cchannels){
			Channel ch=channelManager.getByObjectId(cchannel.getChannelId());
			channels.add(ch);
		}
		
		return channels;
	}
	
	public void save(Long contentId,String[] channelIds){
		deleteRoleMenuByRoleId(contentId);
		for(String chaid:channelIds){
			ContentChannel cc=new ContentChannel();
			cc.setContentId(contentId);
			cc.setChannelId(Long.parseLong(chaid));
			this.save(cc);
		}
		
	}

	private int deleteRoleMenuByRoleId(Long contentId) {
		return deleteByWhere("contentId = " + contentId);		
	}

	public List<ContentChannel> getByChannelId(Long objectId) {
		String sql = "SELECT A.* FROM cms_content_channel A "
				+" LEFT JOIN cms_content B ON (B.object_id =A.content_id) "
				+" WHERE A.channel_id=? AND B.deleted=0";
		SQLQuery query = getSession().createSQLQuery(sql);
		query.setParameter(0, objectId);
		query.addEntity("A", ContentChannel.class);
		return query.list();
	}
	
}
