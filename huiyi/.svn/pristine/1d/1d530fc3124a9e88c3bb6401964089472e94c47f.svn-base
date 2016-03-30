package com.mvc.cms.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * 栏目内容关联表
 */
@Entity(name="CMS_CONTENT_CHANNEL")
public class ContentChannel implements Serializable {
	
	@Id
	private Long channelId;
	@Id
	private Long contentId;
	
	public ContentChannel() {
		super();
	}

	public ContentChannel(Long channelId, Long contentId) {
		super();
		this.channelId = channelId;
		this.contentId = contentId;
	}

	public void setChannelId(Long channelId){
		this.channelId = channelId;
	}

	public Long getChannelId(){
		return channelId;
	}
	public void setContentId(Long contentId){
		this.contentId = contentId;
	}

	public Long getContentId(){
		return contentId;
	}
}