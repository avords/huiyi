package com.mvc.product.model;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import com.mvc.framework.model.BaseEntity;

@Entity(name="P_SKU_ATTRIBUTE")
public class SkuAttribute extends BaseEntity{
    private static final long serialVersionUID = 6311029383816494948L;
    @NotNull
    private Long skuId;//商品id
    @NotNull
    private Long attributeId;//属性id
    @NotNull
    private Long attributeValId;//属性值id
    public Long getSkuId() {
        return skuId;
    }
    public void setSkuId(Long skuId) {
        this.skuId = skuId;
    }
    public Long getAttributeValId() {
        return attributeValId;
    }
    public void setAttributeValId(Long attributeValId) {
        this.attributeValId = attributeValId;
    }
    public Long getAttributeId() {
        return attributeId;
    }
    public void setAttributeId(Long attributeId) {
        this.attributeId = attributeId;
    }

}
