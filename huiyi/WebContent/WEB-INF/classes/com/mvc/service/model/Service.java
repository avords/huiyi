package com.mvc.service.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.BaseEntity;

/**
 * 服务内容
 *
 */
@Entity(name = "T_SERVICE")
public class Service extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7079133471436751446L;
	/*
	 * 草稿
	 */
	public static final int SERVICE_STATUS_DRAFT = 1;
	/*
	 * 待发布
	 */
	public static final int SERVICE_STATUS_WAIT_PUBLISH = 2;
	/*
	 * 已发布
	 */
	public static final int SERVICE_STATUS_PUBLISHED = 3;
	/*
	 * 已下线
	 */
	public static final int SERVICE_STATUS_OFFLINE = 4;
	/*
	 * 待审核
	 */
	public static final int SERVICE_STATUS_WAIT_CHECK = 5;
	/*
	 * 审核通过
	 */
	public static final int SERVICE_STATUS_PASS = 6;
	/*
	 * 审核不通过
	 */
	public static final int SERVICE_STATUS_UNPASS = 7;

    // 优先级
    private Integer priority;
    // 服務分类id（一般是二级分類）
    @NotNull
    private Long serviceChannelId;
    // 买家服务or卖家服务
    private Integer buyOrSellService;

    // 服务名稱英文
    @NotNull
    @Length(max=50)
    private String serviceNameEn;
    // 服务简介英文
    @NotNull
    @Length(max=1024)
    private String serviceSummaryEn;
    // 服务详情英文
    @NotNull
    @Length(max=2048)
    private String serviceDescriptionEn;

    // 服务名稱
    @NotNull
    @Length(max=30)
    private String serviceNameZh;
    // 服务简介
    @NotNull
    @Length(max=512)
    private String serviceSummaryZh;
    // 服务详情
    @NotNull
    @Length(max=1024)
    private String serviceDescriptionZh;

    /**
     * 系统记录
     */
    // 状态
    private Integer status;
    // 是否删除
    private Integer isDeleted;
    // 有效开始时间
    private Date legalDate;
    // 有效时间
    private Date unLegalDate;
    // 创建时间
    private Date createdDate;
    // 创建人
    private String createdBy;
    // 修改时间
    private Date updatedDate;
    // 修改人
    private String updatedBy;
	public Integer getPriority() {
		return priority;
	}
	public void setPriority(Integer priority) {
		this.priority = priority;
	}
	public Long getServiceChannelId() {
		return serviceChannelId;
	}
	public void setServiceChannelId(Long serviceChannelId) {
		this.serviceChannelId = serviceChannelId;
	}
	public Integer getBuyOrSellService() {
		return buyOrSellService;
	}
	public void setBuyOrSellService(Integer buyOrSellService) {
		this.buyOrSellService = buyOrSellService;
	}
	public String getServiceNameEn() {
		return serviceNameEn;
	}
	public void setServiceNameEn(String serviceNameEn) {
		this.serviceNameEn = serviceNameEn;
	}
	public String getServiceSummaryEn() {
		return serviceSummaryEn;
	}
	public void setServiceSummaryEn(String serviceSummaryEn) {
		this.serviceSummaryEn = serviceSummaryEn;
	}
	public String getServiceDescriptionEn() {
		return serviceDescriptionEn;
	}
	public void setServiceDescriptionEn(String serviceDescriptionEn) {
		this.serviceDescriptionEn = serviceDescriptionEn;
	}
	public String getServiceNameZh() {
		return serviceNameZh;
	}
	public void setServiceNameZh(String serviceNameZh) {
		this.serviceNameZh = serviceNameZh;
	}
	public String getServiceSummaryZh() {
		return serviceSummaryZh;
	}
	public void setServiceSummaryZh(String serviceSummaryZh) {
		this.serviceSummaryZh = serviceSummaryZh;
	}
	public String getServiceDescriptionZh() {
		return serviceDescriptionZh;
	}
	public void setServiceDescriptionZh(String serviceDescriptionZh) {
		this.serviceDescriptionZh = serviceDescriptionZh;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(Integer isDeleted) {
		this.isDeleted = isDeleted;
	}
	public Date getLegalDate() {
		return legalDate;
	}
	public void setLegalDate(Date legalDate) {
		this.legalDate = legalDate;
	}
	public Date getUnLegalDate() {
		return unLegalDate;
	}
	public void setUnLegalDate(Date unLegalDate) {
		this.unLegalDate = unLegalDate;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public Date getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}
	public String getUpdatedBy() {
		return updatedBy;
	}
	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}

}