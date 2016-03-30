package com.mvc.member.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.I18n;

@Entity(name="T_Exhibition")
public class Exhibition extends I18n {
	@NotNull
	private Long companyId;
	@NotNull
	@Length(max=64)
	private String nameZh;
	@NotNull
	@Length(max=64)
	private String nameEn;
	@NotNull
	private Date startDate; //开始时间
	@NotNull
	private Date endDate; //结束时间
	@Length(max=128)
	private String addressZh; //展会地址中文
	@Length(max=128)
	private String addressEn;  //展会地址英文
	@NotNull
	@Length(max=32)
	private String boothNo; //展位号
	
	@Transient
	private String companyName;
	
	public Long getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
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
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getAddressZh() {
		return addressZh;
	}
	public void setAddressZh(String addressZh) {
		this.addressZh = addressZh;
	}
	public String getAddressEn() {
		return addressEn;
	}
	public void setAddressEn(String addressEn) {
		this.addressEn = addressEn;
	}
	public String getBoothNo() {
		return boothNo;
	}
	public void setBoothNo(String boothNo) {
		this.boothNo = boothNo;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	
}
