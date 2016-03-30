package com.mvc.cms.model;

import java.util.Date;
import javax.persistence.Entity;
import com.mvc.framework.model.BaseEntity;

/**
 * 文章
 */
@Entity(name = "T_CONTENT")
public class Content extends BaseEntity {

	private static final long serialVersionUID = 1L;

	// 优先级
	private Integer priority;
	// 文章标题
	private String title;
	// 文章内容
	private String description;
	// 栏目id
	private Long channelId;
	// 语言
	private Integer lang;
	// 结束时间
	private Date endDate;

	/**
	 * 审核
	 */
	// 状态
	/**
	 * 字典表配置：  
	 * 0：草稿  
	 * 1：提交审核(待审核)  
	 * 2：审核不通过  
	 * 3：审核通过 
	 * 4：发布  
	 * 5：撤销发布  
	 * 6：審核失敗
	 */
	private Integer checkStatus;
	// 审核失败原因（是下拉选还是文本框，还是都有？）
	private String causeOfAudit;
	// 审核人
	private Long checkUser;
	// 审核时间
	private Date checkDate;

	/**
	 * 系统记录
	 */
	// 状态
	private Integer status;
	// 是否删除
	private Integer isDeleted;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Long getChannelId() {
		return channelId;
	}
	public void setChannelId(Long channelId) {
		this.channelId = channelId;
	}
	public Integer getLang() {
		return lang;
	}
	public void setLang(Integer lang) {
		this.lang = lang;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public Integer getCheckStatus() {
		return checkStatus;
	}
	public void setCheckStatus(Integer checkStatus) {
		this.checkStatus = checkStatus;
	}
	public String getCauseOfAudit() {
		return causeOfAudit;
	}
	public void setCauseOfAudit(String causeOfAudit) {
		this.causeOfAudit = causeOfAudit;
	}
	public Long getCheckUser() {
		return checkUser;
	}
	public void setCheckUser(Long checkUser) {
		this.checkUser = checkUser;
	}
	public Date getCheckDate() {
		return checkDate;
	}
	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
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