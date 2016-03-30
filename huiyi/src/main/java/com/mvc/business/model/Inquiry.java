package com.mvc.business.model;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.BaseEntity;

/**
 * 询盘
 * 
 */
@Entity(name = "T_INQUIRY")
public class Inquiry extends BaseEntity {

	private static final long serialVersionUID = 1L;

	// 发送人
	@NotNull
	private Long memberId;
	
	private Long fromCompanyId;
	@NotNull
	private Long productId;
	// 产品名称, 如果是具体产品，把产品名称拷贝过来
	@Length(max=64)
	@NotNull
	private String productName;
	// 产品描述
	@Length(max=256)
	private String description;
	// 一级分类
	@NotNull
	private Long catogoryId;
	// 二级分类
	@NotNull
	private Long secondCatogoryId;
	// 状态:未读，已读，已报价
	@NotNull
	//批量or单个
	private Integer status;
	// 发送时间
	@NotNull
	private Date sendDate;
	//失效时间
	@NotNull
	private Date expiredDate;
	//购买数量
	@NotNull
	private Double quantity;
	// 计数单位
	@NotNull
	private Integer unit;
	//报价个数
	@Transient
	private Integer number;
	
	//未读报价个数
	@Transient
	private Integer notReadNumber;
	
	@Transient
	private Integer offerStatus;
	//询盘公司名称
	@Transient
	private String companyName;
	
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	@Transient
	private String productImg;
	public Long getFromCompanyId() {
		return fromCompanyId;
	}
	public void setFromCompanyId(Long fromCompanyId) {
		this.fromCompanyId = fromCompanyId;
	}
	public Long getProductId() {
		return productId;
	}
	public void setProductId(Long productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Long getCatogoryId() {
		return catogoryId;
	}
	public void setCatogoryId(Long catogoryId) {
		this.catogoryId = catogoryId;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getSendDate() {
		return sendDate;
	}
	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}
	public Date getExpiredDate() {
		return expiredDate;
	}
	public void setExpiredDate(Date expiredDate) {
		this.expiredDate = expiredDate;
	}
	public Double getQuantity() {
		return quantity;
	}
	public void setQuantity(Double quantity) {
		this.quantity = quantity;
	}
	public Integer getUnit() {
		return unit;
	}
	public void setUnit(Integer unit) {
		this.unit = unit;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public Long getMemberId() {
		return memberId;
	}
	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}
	public Integer getOfferStatus() {
		return offerStatus;
	}
	public void setOfferStatus(Integer offerStatus) {
		this.offerStatus = offerStatus;
	}
	public String getProductImg() {
		return productImg;
	}
	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}
	public Long getSecondCatogoryId() {
		return secondCatogoryId;
	}
	public void setSecondCatogoryId(Long secondCatogoryId) {
		this.secondCatogoryId = secondCatogoryId;
	}
	public Integer getNotReadNumber() {
		return notReadNumber;
	}
	public void setNotReadNumber(Integer notReadNumber) {
		this.notReadNumber = notReadNumber;
	}
	
}