package com.mvc.business.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.I18nFilter;
import com.mvc.product.model.Category;

@Entity(name = "t_mall_category")
public class MallCategory extends I18nFilter {
	@NotNull
	@Length(max=64)
	private String nameZh;
	
	@NotNull
	@Length(max=128)
	private String nameEn;
	
	@NotNull
	@Length(max=128)
	private String image;
	
	@NotNull
	private Double sortNo;
	
	@Transient
	private List<Category> categories = new ArrayList<Category>();
	
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Double getSortNo() {
		return sortNo;
	}
	
	public void setSortNo(Double sortNo) {
		this.sortNo = sortNo;
	}
	public List<Category> getCategories() {
		return categories;
	}
}
