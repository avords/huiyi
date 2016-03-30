package com.mvc.base.model;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.I18nFilter;

/**
 * 热门搜索
 * @author bob.pu
 *
 */
@Entity(name="T_SEARCH_WORDS")
public class SearchWords extends I18nFilter {
	@NotNull
	@Length(max=32)
	private String nameZh;
	@NotNull
	@Length(max=32)
	private String nameEn;
	
	@NotNull
	private Double sortNo;
	
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
	public Double getSortNo() {
		return sortNo;
	}
	public void setSortNo(Double sortNo) {
		this.sortNo = sortNo;
	}
}
