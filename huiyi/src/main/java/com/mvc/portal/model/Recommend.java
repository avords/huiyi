package com.mvc.portal.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

//首页推荐配置表
@Entity(name = "T_RECOMMEND")
public class Recommend implements Serializable {
	
	public static final int TYPE_COMPANY = 1; // 推荐企业
	public static final int TYPE_PRODUCT = 2; // 推荐产品

	@Id
	private Long itemId;

	// 1:供应商；2：产品
	@Id
	private Integer type;
	@Transient
    @Length(max=50)
	private String name;
	
	@NotNull
	private Double priority;

	public Long getItemId() {
		return itemId;
	}

	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Double getPriority() {
		return priority;
	}

	public void setPriority(Double priority) {
		this.priority = priority;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
