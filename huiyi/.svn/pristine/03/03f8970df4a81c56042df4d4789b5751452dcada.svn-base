package com.mvc.base.model;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.BaseEntity;

/**
 * 国家
 */
@Entity(name = "T_COUNTRY")
public class Country extends BaseEntity {

	private static final long serialVersionUID = 1L;
	
	/*
	 * 状态-正常
	 */
	public static final int COUNTRY_STATUS_NORMAL = 1;
	/*
	 * 状态-失效
	 */
	public static final int COUNTRY_STATUS_INVALID = 0;

	// 国家名称
	@NotNull
	@Length(max=32)
	private String nameZh;
	// 国家名称英文
	@NotNull
	@Length(max=32)
	private String nameEn;
	// 国家区号
	@NotNull
	@Length(max=12)
	private String areaCode;
	// 状态
	@NotNull
	private Integer status;

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}

	public String getNameZh() {
		return nameZh;
	}

	public void setNameZh(String nameZh) {
		this.nameZh = nameZh;
	}

	public String getNameEn() {
		return nameEn;
	}

	public void setNameEn(String nameEn) {
		this.nameEn = nameEn;
	}
}