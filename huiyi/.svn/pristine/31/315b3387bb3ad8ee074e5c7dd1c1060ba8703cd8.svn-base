package com.mvc.product.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.ForeverEntity;
@Entity(name="P_SKU")
public class Sku extends ForeverEntity{

    private static final long serialVersionUID = -2322190202200126388L;
    //产品状态
    public static final int PRODUCT_STATUS_DRAFT = 1;     //草稿
    public static final int PRODUCT_STATUS_WAIT_CHECK = 2;//待审核
    public static final int PRODUCT_STATUS_CHECK_NOT = 3; //审核不通过
    public static final int PRODUCT_STATUS_WAIT_SALE= 4;  //待上架
    public static final int PRODUCT_STATUS_IN_SALE = 5;   //上架中
    public static final int PRODUCT_STATUS_NOT_SALE = 6;  //已下架
    @NotNull
    private Long productId;//产品主表id
    @NotNull
    @Length(max=50)
    private String skuNo;//产品编号
    @NotNull
    private Double sellPriceZh;//人民币销售价格
    @NotNull
    private Double sellPriceEn;//美元销售价格
    @NotNull
    private Integer status;//产品状态
    private Date startDate;//上架时间
    private Date endDate;//下架时间
    private String attributeVals;//属性串

    @Transient
    private Product product;
    @Transient
    private String attributeValsZh;
    @Transient
    private String attributeValsEn;
    public Long getProductId() {
        return productId;
    }
    public void setProductId(Long productId) {
        this.productId = productId;
    }
    public String getSkuNo() {
        return skuNo;
    }
    public void setSkuNo(String skuNo) {
        this.skuNo = skuNo;
    }
    public Double getSellPriceZh() {
        return sellPriceZh;
    }
    public void setSellPriceZh(Double sellPriceZh) {
        this.sellPriceZh = sellPriceZh;
    }
    public Double getSellPriceEn() {
        return sellPriceEn;
    }
    public void setSellPriceEn(Double sellPriceEn) {
        this.sellPriceEn = sellPriceEn;
    }
    public Integer getStatus() {
        return status;
    }
    public void setStatus(Integer status) {
        this.status = status;
    }
    public Date getStartDate() {
        return startDate;
    }
    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }
    public String getAttributeVals() {
        return attributeVals;
    }
    public void setAttributeVals(String attributeVals) {
        this.attributeVals = attributeVals;
    }
    public Date getEndDate() {
        return endDate;
    }
    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }
    public Product getProduct() {
        return product;
    }
    public void setProduct(Product product) {
        this.product = product;
    }
    public String getAttributeValsZh() {
        return attributeValsZh;
    }
    public void setAttributeValsZh(String attributeValsZh) {
        this.attributeValsZh = attributeValsZh;
    }
    public String getAttributeValsEn() {
        return attributeValsEn;
    }
    public void setAttributeValsEn(String attributeValsEn) {
        this.attributeValsEn = attributeValsEn;
    }

}
