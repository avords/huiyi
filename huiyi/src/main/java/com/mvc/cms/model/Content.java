package com.mvc.cms.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.ForeverEntity;

/**
 * 文章
 */
@Entity(name = "CMS_CONTENT")
public class Content extends ForeverEntity {

	private static final long serialVersionUID = 1L;
	
	public static final int STATUS_PUBLISH = 4; // 已发布的文章

	// 文章标题
	@NotNull
	@Length(max=64)
	private String nameZh;
	@NotNull
	@Length(max=64)
	private String nameEn;
	// 开始时间
	private Date beginDate;
	// 结束时间
	private Date endDate;
	// 优先级
	private Double priority;
	//文章类型
	private Integer type;
	
//    @Transient
//    private Integer visitorCount=0;  //文章访问量

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
	 * 6：审核失敗
	 */
	private Integer status;
	/**
	 * 中文内容
	 */
	@Column(columnDefinition="MEDIUMTEXT")
	private String txtZh;
	/**
	 * 英文内容
	 */
	@Column(columnDefinition="MEDIUMTEXT")
	private String txtEn;
	
	//文章图片
	@Length(max=128)
	private String picPath;
	
	// 文章摘要
	@Length(max=128)
	private String summaryZh;
	@Length(max=128)
	private String summaryEn;
	
	public String getSummaryZh() {
		return summaryZh;
	}
	public void setSummaryZh(String summaryZh) {
		this.summaryZh = summaryZh;
	}
	public String getSummaryEn() {
		return summaryEn;
	}
	public void setSummaryEn(String summaryEn) {
		this.summaryEn = summaryEn;
	}
	public String getPicPath() {
		return picPath;
	}
	public void setPicPath(String picPath) {
		this.picPath = picPath;
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
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getTxtZh() {
		return txtZh;
	}
	public void setTxtZh(String txtZh) {
		this.txtZh = txtZh;
	}
	public String getTxtEn() {
		return txtEn;
	}
	public void setTxtEn(String txtEn) {
		this.txtEn = txtEn;
	}
}