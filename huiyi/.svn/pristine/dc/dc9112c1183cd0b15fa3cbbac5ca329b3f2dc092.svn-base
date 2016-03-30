package com.mvc.product.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.BaseEntity;
@Entity(name="P_ATTRIBUTE")
public class Attribute extends BaseEntity{

    private static final long serialVersionUID = 8347526627933751650L;
    public static final int TYPE_KEY = 1;//关键属性
    public static final int TYPE_NOT_KEY = 2;//非关键属性
    public static final int TYPE_SKU = 3;//sku属性

    public static final int INPUT_TYPE_TEXT = 1;//文本框
    public static final int INPUT_TYPE_SELECT = 2;//下拉框

    @NotNull
    private Long categoryId;//产品分类
    @NotNull
    @Length(max=20)
    private String nameZh;//属性中文名称
    @NotNull
    @Length(max=20)
    private String nameEn;//属性英文名称
    @NotNull
    private Double sortNo;//排序字段
    @NotNull
    private Integer status;//状态
    @NotNull
    private Integer type;//1、关键属性 2、非关键属性 3、sku属性
    @NotNull
    private Integer inputType;//1、文本框 2、下拉框

    @Transient
    private String valueNames;
    @Transient
    private List<AttributeVal> attributeVals;

    public Long getCategoryId() {
        return categoryId;
    }
    public Double getSortNo() {
        return sortNo;
    }
    public Integer getStatus() {
        return status;
    }
    public Integer getType() {
        return type;
    }
    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }
    public void setSortNo(Double sortNo) {
        this.sortNo = sortNo;
    }
    public void setStatus(Integer status) {
        this.status = status;
    }
    public void setType(Integer type) {
        this.type = type;
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
    public Integer getInputType() {
        return inputType;
    }
    public void setInputType(Integer inputType) {
        this.inputType = inputType;
    }
    public String getValueNames() {
        return valueNames;
    }
    public void setValueNames(String valueNames) {
        this.valueNames = valueNames;
    }
    public List<AttributeVal> getAttributeVals() {
        return attributeVals;
    }
    public void setAttributeVals(List<AttributeVal> attributeVals) {
        this.attributeVals = attributeVals;
    }

}
