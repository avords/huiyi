package com.mvc.business.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.I18nFilter;
import com.mvc.product.model.Category;

@Entity(name="T_STANDARD")
@DynamicUpdate(false)
public class Standard extends I18nFilter {
	
	@NotNull
	@Length(max=64)
	private String nameZh;
	
	@NotNull
	@Length(max=128)
	private String nameEn;
	
	@NotNull
	private Integer status;
	
	 //详情
    @NotNull
    @Column(columnDefinition="MEDIUMTEXT")
    private String detailZh;
    
	//详情
    @NotNull
    @Column(columnDefinition="MEDIUMTEXT")
    private String detailEn;
    
    @Transient
	private List<Category> categorys = new ArrayList<Category>();
    
    public List<Category> getCategorys() {
		return categorys;
	}
	public void setCategorys(List<Category> categorys) {
		this.categorys = categorys;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
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
	public String getDetailEn() {
		return detailEn;
	}
	public void setDetailEn(String detailEn) {
		this.detailEn = detailEn;
	}
	public String getDetailZh() {
		return detailZh;
	}
	public void setDetailZh(String detailZh) {
		this.detailZh = detailZh;
	}
}