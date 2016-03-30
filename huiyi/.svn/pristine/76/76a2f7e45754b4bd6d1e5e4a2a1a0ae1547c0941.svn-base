package com.mvc.member.model;

import java.io.Serializable;
import javax.persistence.Transient;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * 企业业务类型表
 * 多对多
 * @author bob.pu
 *
 */
@Entity(name="T_BUSINESS_TYPE")
public class BusinessType implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private Long companyId;
	@Id
	private Integer type;

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
	
}
