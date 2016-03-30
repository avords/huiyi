package com.mvc.cms.model;

import javax.persistence.Entity;

import com.mvc.framework.model.BaseEntity;

/**
 * 栏目表
 * **/
@Entity(name = "T_CHANNEL")
public class Channel extends BaseEntity {
	
	private static final long serialVersionUID = -5145948516232308244L;

	//栏目名称
	private String name;
	
	//父栏目
	private Long parentId;
	
	//栏目排序
	private Integer priority;

	//栏目分类:一级/二级/三级分类
	private Integer level;
	
	//栏目编号:
	private String positionCode;
	
	//状态:是否有效
	private Integer isValid;
	
	//备注
	private String channelExplian;

	//完整名称
	private String fullName;
	
	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPriority() {
		return priority;
	}

	public void setPriority(Integer priority) {
		this.priority = priority;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getPositionCode() {
		return positionCode;
	}

	public void setPositionCode(String positionCode) {
		this.positionCode = positionCode;
	}

	public Integer getIsValid() {
		return isValid;
	}

	public void setIsValid(Integer isValid) {
		this.isValid = isValid;
	}

	public String getChannelExplian() {
		return channelExplian;
	}

	public void setChannelExplian(String channelExplian) {
		this.channelExplian = channelExplian;
	}

}
