package com.mvc.product.model;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import com.mvc.framework.model.BaseEntity;

@Entity(name="P_PRODUCT_ATTRIBUTE")
public class ProductAttribute extends BaseEntity{

    private static final long serialVersionUID = 4324536155160358410L;
    @NotNull
    private Long productId;//商品主表id
    @NotNull
    private Long attributeId;//属性id
    private Long attributeValId;//属性值id
    private String value;//属性值
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

}
