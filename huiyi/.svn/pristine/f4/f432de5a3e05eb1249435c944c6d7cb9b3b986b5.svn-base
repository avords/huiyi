package com.mvc.business.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import com.mvc.framework.model.BaseEntity;

/**
 * 报价
 * 
 */
@Entity(name = "T_QUOTATION")
public class Quotation extends BaseEntity {

	private static final long serialVersionUID = 1L;
	// 报价公司id
	@NotNull
	private Long fromCompanyId;
	// 询盘公司id
	@NotNull
	private Long toCompanyId;
	
	private Long productId;
	
	@NotNull
	private Long inquiryId;
	// 发送时间
	@NotNull
	private Date sendDate;
	// 是否已读
	private Integer status;
	
	private String content;
	//单价
	@NotNull
	private Double price;
	//报价单位：美元等
	@NotNull
	private Integer priceUnit;
	//购买数量
	@NotNull
	private Double quantity;
	// 计数单位
	@NotNull
	private Integer unit;
	
	
	private String productName;
	
	@NotNull
	private String toCompanyName;
	
	@NotNull
	private String fromCompanyName;
	

	public String getToCompanyName() {
		return toCompanyName;
	}

	public void setToCompanyName(String toCompanyName) {
		this.toCompanyName = toCompanyName;
	}

	public Long getFromCompanyId() {
		return fromCompanyId;
	}

	public void setFromCompanyId(Long fromCompanyId) {
		this.fromCompanyId = fromCompanyId;
	}

	public Long getToCompanyId() {
		return toCompanyId;
	}

	public void setToCompanyId(Long toCompanyId) {
		this.toCompanyId = toCompanyId;
	}

	public Long getInquiryId() {
		return inquiryId;
	}

	public void setInquiryId(Long inquiryId) {
		this.inquiryId = inquiryId;
	}

	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getPriceUnit() {
		return priceUnit;
	}

	public void setPriceUnit(Integer priceUnit) {
		this.priceUnit = priceUnit;
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

	public String getFromCompanyName() {
		return fromCompanyName;
	}

	public void setFromCompanyName(String fromCompanyName) {
		this.fromCompanyName = fromCompanyName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}
	
}