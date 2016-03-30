package com.mvc.member.model;

import java.util.Date;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import com.mvc.framework.model.BaseEntity;

/**
 * 收藏
 * 
 */
@Entity(name = "T_FAVORITES")
public class Favorites extends BaseEntity {

	private static final long serialVersionUID = 1L;

	// 对应的 企业id、产品id
	@NotNull
	private Long entityId;
	// 实体类型
	/**
	 * 字典表配置： 0：产品 1：企业
	 */
	@NotNull
	private Integer type;
	// 收藏时间
	@NotNull
	private Date favoritesDate;
	// 企业id
	@NotNull
	private Long companyId;
	// 是否删除
	@NotNull
	/**
	 *  0：删除  1：有效
	 */
	private Integer isDelete;
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
	public Date getFavoritesDate() {
		return favoritesDate;
	}
	public void setFavoritesDate(Date favoritesDate) {
		this.favoritesDate = favoritesDate;
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
	
}