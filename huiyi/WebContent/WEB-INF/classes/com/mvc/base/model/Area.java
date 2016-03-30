package com.mvc.base.model;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import com.mvc.framework.model.BaseEntity;
import com.mvc.framework.model.BaseTree;
/**
 * 地区
 */
@Entity(name="B_AREA")
public class Area extends BaseEntity implements BaseTree {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5084314831740262315L;
	public static final Area ROOT= new Area();
	static {
		ROOT.setObjectId(BaseTree.ROOT);
		ROOT.setName("地区树");
		ROOT.setIsParent(true);
	}
	/**
	 * 新城
	 */
	public static final int PROPERTY_NEW_CITY=1;
	/**
	 * 旧城
	 */
	public static final int PROPERTY_OLD_CITY=2;
	@NotNull
	private String name;
	
	private Long parentId;
	@NotNull
	private String code;
	
	private Integer level;
	
	private Integer status;
	
	private Boolean isParent;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getParentId() {
		return parentId;
	}
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Boolean getIsParent() {
		return isParent;
	}
	public void setIsParent(Boolean isParent) {
		this.isParent = isParent;
	}

}
