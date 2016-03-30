package com.mvc.product.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
@Entity(name="P_SKU_ATTRIBUTE_ATTACHED")
public class SkuAttributeAttached implements Serializable{
    private static final long serialVersionUID = 2707402831625655749L;
    @NotNull
    @Id
    private Long productId;//商品id
    @NotNull
    @Id
    private Long attributeId;//属性id
    @NotNull
    @Id
    private Long attributeValId;//属性值id
    @NotNull
    private String nameZh;//中文名称
    @NotNull
    private String nameEn;//英文名称
    @Length(max=512)
    private String imageUrl;//图片路径
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
    public String getImageUrl() {
        return imageUrl;
    }
    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}
