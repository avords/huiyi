package com.mvc.service.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * 产品目录与服务的关联表
 * @author bob.pu
 *
 */
@Entity(name="T_PRODUCT_CATEGORY_SERVICE")
public class ProductCategoryService implements Serializable{
	@Id
	private Long productCategoryId;//一级产品目录
	@Id
	private Long serviceId;
	
	public Long getProductCategoryId() {
		return productCategoryId;
	}
	public void setProductCategoryId(Long productCategoryId) {
		this.productCategoryId = productCategoryId;
	}
	public Long getServiceId() {
		return serviceId;
	}
	public void setServiceId(Long serviceId) {
		this.serviceId = serviceId;
	}
}
