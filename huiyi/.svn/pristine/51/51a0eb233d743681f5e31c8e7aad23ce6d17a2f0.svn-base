package com.mvc.service.model;

import java.util.Date;

import javax.persistence.Entity;

import com.mvc.framework.model.BaseEntity;

/**
 * 服务申请列表
 *
 */
@Entity(name = "T_SERVICE_APPLY")
public class ServiceApply extends BaseEntity {

    private static final long serialVersionUID = 1L;

    // 服务id
    private Long serviceId;
    // 买家申请or卖家申请
    private Integer buyOrSellApply;

    // 申请简述
    private String serviceSummary;
    // 申请详细内容
    private String serviceContent;
    // 结束时间
    private Date endDate;
    // 语言
    private Integer lang;

    /**
     * 處理申請
     */
    // 状态
    /**
     * 字典表配置： 0：提交申請(待處理) 1：撤銷申請 2：接受申請 3：處理完成 4：拒絕申請
     */
    private Integer dealStatus;
    // 拒絕原因（是下拉选还是文本框，还是都有？）
    private String causeOfAudit;
    // 處理人
    private Long dealUserId;
    // 處理时间
    private Date dealDate;

    /**
     * 系统记录
     */
    // 企業id
    private Long companyId;
    // 是否删除
    private Integer isDelete;
    // 发布时间
    private Date publishDate;
    public Long getServiceId() {
        return serviceId;
    }
    public void setServiceId(Long serviceId) {
        this.serviceId = serviceId;
    }
    public Integer getBuyOrSellApply() {
        return buyOrSellApply;
    }
    public void setBuyOrSellApply(Integer buyOrSellApply) {
        this.buyOrSellApply = buyOrSellApply;
    }
    public String getServiceSummary() {
        return serviceSummary;
    }
    public void setServiceSummary(String serviceSummary) {
        this.serviceSummary = serviceSummary;
    }
    public String getServiceContent() {
        return serviceContent;
    }
    public void setServiceContent(String serviceContent) {
        this.serviceContent = serviceContent;
    }
    public Date getEndDate() {
        return endDate;
    }
    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }
    public Integer getLang() {
        return lang;
    }
    public void setLang(Integer lang) {
        this.lang = lang;
    }
    public Integer getDealStatus() {
        return dealStatus;
    }
    public void setDealStatus(Integer dealStatus) {
        this.dealStatus = dealStatus;
    }
    public String getCauseOfAudit() {
        return causeOfAudit;
    }
    public void setCauseOfAudit(String causeOfAudit) {
        this.causeOfAudit = causeOfAudit;
    }
    public Long getDealUserId() {
        return dealUserId;
    }
    public void setDealUserId(Long dealUserId) {
        this.dealUserId = dealUserId;
    }
    public Date getDealDate() {
        return dealDate;
    }
    public void setDealDate(Date dealDate) {
        this.dealDate = dealDate;
    }
    public Long getCompanyId() {
        return companyId;
    }
    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }
    public Integer getIsDelete() {
        return isDelete;
    }
    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }
    public Date getPublishDate() {
        return publishDate;
    }
    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

}