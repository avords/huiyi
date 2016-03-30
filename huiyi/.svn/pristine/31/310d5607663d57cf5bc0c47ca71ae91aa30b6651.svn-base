package com.mvc.product.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.BaseEntity;
@Entity(name="P_CATEGORY")
public class Category extends BaseEntity{
    private static final long serialVersionUID = 528246897726539522L;
    public static final int TYPE_SERVICE = 1;     //服务
    public static final int TYPE_COMMON_PRODUCT = 2; //普通产品
    @NotNull
    @Length(max=64)
    private String nameZh;//中文名称
    @NotNull
    @Length(max=64)
    private String nameEn;//英文名称
    @NotNull
    private Long parentId;//父类id
    @NotNull
    private Integer layer;//层级 1 2 3
    @NotNull
    @Column(precision=7,scale=1)
    private Double sortNo;//排序字段
    @NotNull
    private Integer status;
    @NotNull
    private Integer type;

    @Transient
    private Long childrenCount;
    @Transient
    private String parentName;
    @Transient
    private String attributeName;
    
    @Transient
    private List<Category> children  = new ArrayList<Category>(); // add by zengruhui
    
	public Integer getLayer() {
        return layer;
    }
    public Long getParentId() {
        return parentId;
    }
    public Double getSortNo() {
        return sortNo;
    }
    public Integer getStatus() {
        return status;
    }
    public void setLayer(Integer layer) {
        this.layer = layer;
    }
    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }
    public void setSortNo(Double sortNo) {
        this.sortNo = sortNo;
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
    public Long getChildrenCount() {
        return childrenCount;
    }
    public void setChildrenCount(Long childrenCount) {
        this.childrenCount = childrenCount;
    }
    public String getParentName() {
        return parentName;
    }
    public void setParentName(String parentName) {
        this.parentName = parentName;
    }
    public String getAttributeName() {
        return attributeName;
    }
    public void setAttributeName(String attributeName) {
        this.attributeName = attributeName;
    }
    public Integer getType() {
        return type;
    }
    public void setType(Integer type) {
        this.type = type;
    }
	public List<Category> getChildren() {
		return children;
	}
	public void setChildren(List<Category> children) {
		this.children = children;
	}
}
