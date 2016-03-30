package com.mvc.business.model;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import com.mvc.framework.model.BaseEntity;

@Entity(name="T_BUSINESS_FILES")
public class BusinessFiles extends BaseEntity {
	@NotNull
	private Long itemId;
	
	//类型：1：询盘；2：报价
	@NotNull
	private Integer type;
	@NotNull
	private String fileId;
	public Long getItemId() {
		return itemId;
	}
	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
}
