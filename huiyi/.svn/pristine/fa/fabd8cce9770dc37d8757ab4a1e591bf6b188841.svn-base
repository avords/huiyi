package com.mvc.member.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Transient;

import com.mvc.framework.model.BaseEntity;
import com.mvc.product.model.Product;

/**
 * 我的足迹
 * 
 */
@Entity(name = "T_VIEW_HISTORY")
public class History extends BaseEntity {

	private static final long serialVersionUID = 1L;

	// 对应的 企业id、产品id
	private Long entityId;
	// 实体类型
	/**
	 * 字典表配置： 0：产品 1：企业
	 */
	private Integer type;
	// 访问时间
	private Date visitDate;

	// 企業id
	private Long companyId;
	// 是否删除
	private Integer isDelete;
    @Transient
    private List<Product> similarProduct;
    @Transient
	private List<CompanyCertificate> certificates;
	@Transient
	private List<BusinessType> busType;
	@Transient
	private Object entity;
	public Long getEntityId() {
		return entityId;
	}
	public void setEntityId(Long entityId) {
		this.entityId = entityId;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Date getVisitDate() {
		return visitDate;
	}
	public void setVisitDate(Date visitDate) {
		this.visitDate = visitDate;
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
	public Object getEntity() {
		return entity;
	}
	public void setEntity(Object entity) {
		this.entity = entity;
	}
	public List<Product> getSimilarProduct() {
		return similarProduct;
	}
	public void setSimilarProduct(List<Product> similarProduct) {
		this.similarProduct = similarProduct;
	}
	public List<CompanyCertificate> getCertificates() {
		return certificates;
	}
	public void setCertificates(List<CompanyCertificate> certificates) {
		this.certificates = certificates;
	}
	public List<BusinessType> getBusType() {
		return busType;
	}
	public void setBusType(List<BusinessType> busType) {
		this.busType = busType;
	}
	
}