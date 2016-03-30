package com.mvc.business.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name="T_MALL_CATEGORY_MAPPING")
public class MallCategoryMapping implements Serializable{
	@Id
	private Long mallCategoryId;
	
	@Id
	private Long categoryId;

	public Long getMallCategoryId() {
		return mallCategoryId;
	}

	public void setMallCategoryId(Long mallCategoryId) {
		this.mallCategoryId = mallCategoryId;
	}

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
}
