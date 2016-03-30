package com.mvc.product.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.I18nFilter;

@Entity(name="P_PRODUCT")
public class Product extends I18nFilter {
    private static final long serialVersionUID = -7328112296982638102L;
    public static final int TYPE_SERVICE = 1;     //服务
    public static final int TYPE_COMMON_PRODUCT = 2; //普通商品
    @NotNull
    @Length(max=50)
    private String nameZh;//中文名称
    @NotNull
    @Length(max=50)
    private String nameEn;//英文名称
    @NotNull
    @Length(max=1024)
    private String subNameZh;//中文子标题
    @NotNull
    @Length(max=1024)
    private String subNameEn;//英文子标题
    @NotNull
    @Length(max=512)
    private String keywordsZh;//中文关键词
    @NotNull
    @Length(max=512)
    private String keywordsEn;//英文关键词
    @NotNull
    private Long supplierId;//供应商id
    @NotNull
    private Integer minBuyNumber;//最小购买数量
    @NotNull
    private Integer buyUnit;//购买单位
    @NotNull
    private Long categoryId;//分类id
    @NotNull
    @Column(columnDefinition="MEDIUMTEXT")
    private String descriptionEn;//英文描述
    @NotNull
    @Column(columnDefinition="MEDIUMTEXT")
    private String descriptionZh;//中文描述
    @NotNull
    private Integer isInvoice;//是否发票
    @NotNull
    private Integer isMantenance;//是否售后
    @NotNull
    @Length(max=512)
    private String mainPicture;//主图
    private String packageListZh;//包装清单
    private String packageListEn;//包装清单
    private String remarkZh;//中文其他
    private String remarkEn;//中文其他
    private String productModel;//商品类型
    private Date startDate;//指定上架时间
    private Date endDate;//指定下架时间
    @NotNull
    private Integer contryId;//国家id
    @NotNull
    private Integer type;//国家id
    @Override
    public String getNameZh() {
        return nameZh;
    }
    public void setNameZh(String nameZh) {
        this.nameZh = nameZh;
    }
    @Override
    public String getNameEn() {
        return nameEn;
    }
    public void setNameEn(String nameEn) {
        this.nameEn = nameEn;
    }
    public String getSubNameZh() {
        return subNameZh;
    }
    public void setSubNameZh(String subNameZh) {
        this.subNameZh = subNameZh;
    }
    public String getSubNameEn() {
        return subNameEn;
    }
    public void setSubNameEn(String subNameEn) {
        this.subNameEn = subNameEn;
    }
    public String getKeywordsZh() {
        return keywordsZh;
    }
    public void setKeywordsZh(String keywordsZh) {
        this.keywordsZh = keywordsZh;
    }
    public String getKeywordsEn() {
        return keywordsEn;
    }
    public void setKeywordsEn(String keywordsEn) {
        this.keywordsEn = keywordsEn;
    }
    public Long getSupplierId() {
        return supplierId;
    }
    public void setSupplierId(Long supplierId) {
        this.supplierId = supplierId;
    }
    public Integer getMinBuyNumber() {
        return minBuyNumber;
    }
    public void setMinBuyNumber(Integer minBuyNumber) {
        this.minBuyNumber = minBuyNumber;
    }
    public Integer getBuyUnit() {
        return buyUnit;
    }
    public void setBuyUnit(Integer buyUnit) {
        this.buyUnit = buyUnit;
    }
    public Long getCategoryId() {
        return categoryId;
    }
    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }
    public String getDescriptionEn() {
        return descriptionEn;
    }
    public void setDescriptionEn(String descriptionEn) {
        this.descriptionEn = descriptionEn;
    }
    public String getDescriptionZh() {
        return descriptionZh;
    }
    public void setDescriptionZh(String descriptionZh) {
        this.descriptionZh = descriptionZh;
    }
    public Integer getIsInvoice() {
        return isInvoice;
    }
    public void setIsInvoice(Integer isInvoice) {
        this.isInvoice = isInvoice;
    }
    public Integer getIsMantenance() {
        return isMantenance;
    }
    public void setIsMantenance(Integer isMantenance) {
        this.isMantenance = isMantenance;
    }
    public String getMainPicture() {
        return mainPicture;
    }
    public void setMainPicture(String mainPicture) {
        this.mainPicture = mainPicture;
    }
    public String getPackageListZh() {
        return packageListZh;
    }
    public void setPackageListZh(String packageListZh) {
        this.packageListZh = packageListZh;
    }
    public String getPackageListEn() {
        return packageListEn;
    }
    public void setPackageListEn(String packageListEn) {
        this.packageListEn = packageListEn;
    }
    public String getRemarkZh() {
        return remarkZh;
    }
    public void setRemarkZh(String remarkZh) {
        this.remarkZh = remarkZh;
    }
    public String getRemarkEn() {
        return remarkEn;
    }
    public void setRemarkEn(String remarkEn) {
        this.remarkEn = remarkEn;
    }
    public String getProductModel() {
        return productModel;
    }
    public void setProductModel(String productModel) {
        this.productModel = productModel;
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
    public Integer getContryId() {
        return contryId;
    }
    public void setContryId(Integer contryId) {
        this.contryId = contryId;
    }
    public Integer getType() {
        return type;
    }
    public void setType(Integer type) {
        this.type = type;
    }

}
