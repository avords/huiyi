package com.mvc.product.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import com.mvc.framework.model.BaseEntity;

@Entity(name="P_SKU_CHECK")
public class SkuCheck extends BaseEntity{
    private static final long serialVersionUID = 5497159508737701303L;
    public static final int TYPE_NOT_PASS=0;
    public static final int TYPE_PASS=1;
    @NotNull
    private Long productId;
    @NotNull
    private Long skuId;
    private String checkReason;
    @NotNull
    private Long examineUserId;
    @NotNull
    private Date examineDate;
    @NotNull
    private Integer type;
    @Transient
    private String userName;
    public Long getProductId() {
        return productId;
    }
    public void setProductId(Long productId) {
        this.productId = productId;
    }
    public Long getSkuId() {
        return skuId;
    }
    public void setSkuId(Long skuId) {
        this.skuId = skuId;
    }
    public String getCheckReason() {
        return checkReason;
    }
    public void setCheckReason(String checkReason) {
        this.checkReason = checkReason;
    }
    public Long getExamineUserId() {
        return examineUserId;
    }
    public void setExamineUserId(Long examineUserId) {
        this.examineUserId = examineUserId;
    }
    public Date getExamineDate() {
        return examineDate;
    }
    public void setExamineDate(Date examineDate) {
        this.examineDate = examineDate;
    }
    public Integer getType() {
        return type;
    }
    public void setType(Integer type) {
        this.type = type;
    }
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }

}
