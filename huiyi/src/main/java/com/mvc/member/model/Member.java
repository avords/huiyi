package com.mvc.member.model;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.BaseEntity;

@Entity(name="T_MEMBER")
@DynamicUpdate(true)
public class Member extends BaseEntity {
	
	private static final long serialVersionUID = 1L;
	
	public static final int STATUS_NORMAL = 1;

	public static final int STATUS_ABNORMAL = 0;

	private Long companyId;
	
	@NotNull
	@Length(max=32)
	private String loginName;
	
	@NotNull
	@Length(max=32)
	private String userName;
	
	@NotNull
	@Length(max=64)
	private String password;
	
	@NotNull
	private Integer status;
	
	@Length(max=16)
	private String mobile;

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}	
}