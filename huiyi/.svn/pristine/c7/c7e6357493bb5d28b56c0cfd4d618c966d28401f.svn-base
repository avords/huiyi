package com.mvc.product.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.BaseEntity;
@Entity(name="P_SKU")
public class Sku extends BaseEntity{

    private static final long serialVersionUID = -2322190202200126388L;
    //商品状态
    public static final int PRODUCT_STATUS_DRAFT = 1;     //草稿
    public static final int PRODUCT_STATUS_WAIT_CHECK = 2;//待审核
    public static final int PRODUCT_STATUS_CHECK_NOT = 3; //审核不通过
    public static final int PRODUCT_STATUS_WAIT_SALE= 4;  //待上架
    public static final int PRODUCT_STATUS_IN_SALE = 5;   //上架中
    public static final int PRODUCT_STATUS_NOT_SALE = 6;  //已下架
    @NotNull
    private Long productId;//商品主表id
    @NotNull
    @Length(max=50)
    private String skuNo;//商品编号
    @NotNull
    private Double sellPriceZh;//人民币销售价格
    @NotNull
    private Double sellPriceEn;//美元销售价格
    @NotNull
    private Integer status;//商品状态
    private Date startDate;//上架时间
    private Date endDate;//下架时间
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
    public Date getEndDate() {
        return endDate;
    }
    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

}
