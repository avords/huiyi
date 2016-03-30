package com.mvc.business.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

@Entity(name = "T_INQUIRY_ITEM")
public class InquiryItem implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private Long inquiryId;
	// 接收公司，对所有公司时把分类下的公司查询出来后，批量发送
	@Id
	private Long toCompanyId;
	
	@NotNull
	private Integer status;

	public Long getInquiryId() {
		return inquiryId;
	}

	public void setInquiryId(Long inquiryId) {
		this.inquiryId = inquiryId;
	}

	public Long getToCompanyId() {
		return toCompanyId;
	}

	public void setToCompanyId(Long toCompanyId) {
		this.toCompanyId = toCompanyId;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	
}
