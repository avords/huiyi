package com.mvc.product.model;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.BaseEntity;
@Entity(name="P_ATTRIBUTE_VAL")
public class AttributeVal extends BaseEntity{
    private static final long serialVersionUID = -5359729533119563139L;
    @NotNull
    private Long attributeId;//属性id
    @NotNull
    @Length(max=20)
    private String nameZh;//中文名称
    @NotNull
    @Length(max=20)
    private String nameEn;//英文名称
    @NotNull
    private Double sortNo;//排序字段
    public Long getAttributeId() {
        return attributeId;
    }
    public Double getSortNo() {
        return sortNo;
    }
    public void setAttributeId(Long attributeId) {
        this.attributeId = attributeId;
    }
    public void setSortNo(Double sortNo) {
        this.sortNo = sortNo;
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


}
