package com.mvc.member.model;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.BaseEntity;

@Entity(name="T_COMPANY_CERTIFICATE_FILE")
public class CompanyCertificateFile extends BaseEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@NotNull
	private Long companyId;
	
	@NotNull
	@Length(max=128)
	private String filePath;

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
}
