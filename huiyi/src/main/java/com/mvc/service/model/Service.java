package com.mvc.service.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.dao.Comment;
import com.mvc.framework.model.I18nFilter;

/**
 * 服务内容
 *
 */
@Entity(name = "T_SERVICE")
public class Service extends I18nFilter {

	/*
	 * 草稿
	 */
	public static final int SERVICE_STATUS_DRAFT = 1;
	/*
	 * 待审核
	 */
	public static final int SERVICE_STATUS_WAIT_CHECK = 2;
	/*
	 * 审核通过
	 */
	public static final int SERVICE_STATUS_PASS = 3;
	/*
	 * 审核不通过
	 */
	public static final int SERVICE_STATUS_UNPASS = 4;
	/*
	 * 已发布
	 */
	public static final int SERVICE_STATUS_PUBLISHED = 5;
	/*
	 * 已下线
	 */
	public static final int SERVICE_STATUS_OFFLINE = 6;
	
	/*
	 * 买家服务
	 */
	public static final int SERVICE_TYPE_BUYER = 1;
	/*
	 * 卖家服务
	 */
	public static final int SERVICE_TYPE_SUPPLIER = 2;
	
    @Comment("服务类型(1.买家服务,2.卖家服务)")
    @NotNull
    private Integer type;
    
    @Comment("业务类型(1.优化采购,2.优化推广,3.汇医助手)")
    @NotNull
    private Integer businessType;
    // 服务名稱英文
    @NotNull
    @Length(max=250)
    private String nameEn;
    // 服务名稱
    @NotNull
    @Length(max=250)
    private String nameZh;
    // 服务简介英文
    @NotNull
    @Length(max=1024)
    private String summaryEn;
    // 服务简介
    @NotNull
    @Length(max=512)
    private String summaryZh;
    // 服务详情英文
    @NotNull
    @Column(columnDefinition="MEDIUMTEXT")
    private String detailEn;
    // 服务详情
    @NotNull
    @Column(columnDefinition="MEDIUMTEXT")
    private String detailZh;
    
    @NotNull
    private String mainPicture;//主图
    
    @NotNull
    private Integer status;
    // 有效开始时间
    @NotNull
    private Date beginDate;
    // 有效时间
    @NotNull
    private Date endDate;
    //排序
    @NotNull
    private Double priority;
    
    @Transient
    private String serviceType;
    
	public String getServiceType() {
		return serviceType;
	}
	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getNameEn() {
		return nameEn;
	}
	public void setNameEn(String nameEn) {
		this.nameEn = nameEn;
	}
	public String getNameZh() {
		return nameZh;
	}
	public void setNameZh(String nameZh) {
		this.nameZh = nameZh;
	}
	public String getSummaryEn() {
		return summaryEn;
	}
	public void setSummaryEn(String summaryEn) {
		this.summaryEn = summaryEn;
	}
	public String getSummaryZh() {
		return summaryZh;
	}
	public void setSummaryZh(String summaryZh) {
		this.summaryZh = summaryZh;
	}
	public String getDetailEn() {
		return detailEn;
	}
	public void setDetailEn(String detailEn) {
		this.detailEn = detailEn;
	}
	public String getDetailZh() {
		return detailZh;
	}
	public void setDetailZh(String detailZh) {
		this.detailZh = detailZh;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public Double getPriority() {
		return priority;
	}
	public void setPriority(Double priority) {
		this.priority = priority;
	}
	public String getMainPicture() {
		return mainPicture;
	}
	public void setMainPicture(String mainPicture) {
		this.mainPicture = mainPicture;
	}
	public Integer getBusinessType() {
		return businessType;
	}
	public void setBusinessType(Integer businessType) {
		this.businessType = businessType;
	}
}