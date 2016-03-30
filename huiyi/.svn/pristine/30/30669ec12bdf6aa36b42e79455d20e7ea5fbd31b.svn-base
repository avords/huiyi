package com.mvc.product.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
@Entity(name="P_PRODUCT_ATTACHED")
public class ProductAttached implements Serializable{
    private static final long serialVersionUID = 7930612386946424778L;
    public static final int TYPE_PAYMENT = 1;
    public static final int TYPE_QUALIFICATION = 2;
    @Id
    @NotNull
    private Long productId;
    @Id
    @NotNull
    private Integer type;
    @Id
    @NotNull
    private Long value;
    @Length(max=512)
    private String remark;
    public Long getProductId() {
        return productId;
    }
    public void setProductId(Long productId) {
        this.productId = productId;
    }
    public Integer getType() {
        return type;
    }
    public void setType(Integer type) {
        this.type = type;
    }
    public Long getValue() {
        return value;
    }
    public void setValue(Long value) {
        this.value = value;
    }
    public String getRemark() {
        return remark;
    }
    public void setRemark(String remark) {
        this.remark = remark;
    }
}
