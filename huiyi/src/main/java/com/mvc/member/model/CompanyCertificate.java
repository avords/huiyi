package com.mvc.member.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

/**
 * 企业认证内容
 * @author bob.pu
 *
 */
@Entity(name="T_COMPANY_CERTIFICATE")
public class CompanyCertificate implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	private Long companyId;
	
	@Id
	private Integer type; //认证类型
	
	@NotNull
	@Length(max=128)
	private String content;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}
