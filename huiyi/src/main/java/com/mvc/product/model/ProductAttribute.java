package com.mvc.product.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

@Entity(name="P_PRODUCT_ATTRIBUTE")
public class ProductAttribute implements Serializable{
    private static final long serialVersionUID = -2587556955876260556L;
    @Id
    @NotNull
    private Long productId;//产品主表id
    @Id
    @NotNull
    private Long attributeId;//属性id
    private Long attributeValId;//属性值id
    private String value;//属性值

    @Transient
    private Attribute attribute;
    @Transient
    private List<AttributeVal> AttributeVals;
    @Transient
    private String attributeName;
    @Transient
    private String attributeValue;

    public Long getProductId() {
        return productId;
    }
    public void setProductId(Long productId) {
        this.productId = productId;
    }
    public Long getAttributeId() {
        return attributeId;
    }
    public void setAttributeId(Long attributeId) {
        this.attributeId = attributeId;
    }
    public Long getAttributeValId() {
        return attributeValId;
    }
    public void setAttributeValId(Long attributeValId) {
        this.attributeValId = attributeValId;
    }
    public String getValue() {
        return value;
    }
    public void setValue(String value) {
        this.value = value;
    }
    public Attribute getAttribute() {
        return attribute;
    }
    public void setAttribute(Attribute attribute) {
        this.attribute = attribute;
    }
    public List<AttributeVal> getAttributeVals() {
        return AttributeVals;
    }
    public void setAttributeVals(List<AttributeVal> attributeVals) {
        AttributeVals = attributeVals;
    }
    public String getAttributeName() {
        return attributeName;
    }
    public void setAttributeName(String attributeName) {
        this.attributeName = attributeName;
    }
    public String getAttributeValue() {
        return attributeValue;
    }
    public void setAttributeValue(String attributeValue) {
        this.attributeValue = attributeValue;
    }

}
