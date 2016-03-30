package com.mvc.product.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.I18nFilter;

@Entity(name="P_PRODUCT")
public class Product extends I18nFilter {
    private static final long serialVersionUID = -7328112296982638102L;
    public static final int TYPE_SERVICE = 1;     //服务
    public static final int TYPE_COMMON_PRODUCT = 2; //普通产品

    public static final int platform_operation = 1;     //运营端
    public static final int platform_supplier = 2; //供应商端
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
    @Length(max=512)
    private String mainPicture;//主图
    @Column(columnDefinition="MEDIUMTEXT")
    private String packageListZh;//包装清单
    @Column(columnDefinition="MEDIUMTEXT")
    private String packageListEn;//包装清单
    @Column(columnDefinition="MEDIUMTEXT")
    private String remarkZh;//中文其他
    @Column(columnDefinition="MEDIUMTEXT")
    private String remarkEn;//中文其他
    private String productModel;//产品类型
//    private Date startDate;//指定上架时间
//    private Date endDate;//指定下架时间
    @NotNull
    private Long countryId;//国家id
    @NotNull
    private Integer type;//服务类型
    @NotNull
    private Integer isMain;//是否主产品
    @NotNull
    private Integer isInSale;//是否销售中
    private Date updatedOn;//solr用

    private Double rmbPrice;
    private Double usdPrice;
    @Column(nullable=false,columnDefinition="double default 0")
    private Double minSellPriceZh;
    @Column(nullable=false,columnDefinition="double default 0")
    private Double minSellPriceEn;
    @Column(nullable=false,columnDefinition="double default 0")
    private Double maxSellPriceZh;
    @Column(nullable=false,columnDefinition="double default 0")
    private Double maxSellPriceEn;
    @Transient
    private List<Product> similarProduct;
    @Transient
    private String categoryName;
    @Transient
    private String supplierName;
    @Transient
    private String sellPrice;//用于页面显示
    @NotNull
    private Integer platform;//1 运营端 2供应商端
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
    public Integer getType() {
        return type;
    }
    public void setType(Integer type) {
        this.type = type;
    }
    public Double getRmbPrice() {
        return rmbPrice;
    }
    public void setRmbPrice(Double rmbPrice) {
        this.rmbPrice = rmbPrice;
    }
    public Double getUsdPrice() {
        return usdPrice;
    }
    public void setUsdPrice(Double usdPrice) {
        this.usdPrice = usdPrice;
    }
    public String getCategoryName() {
        return categoryName;
    }
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
    public Integer getIsMain() {
        return isMain;
    }
    public void setIsMain(Integer isMain) {
        this.isMain = isMain;
    }
    public Integer getIsInSale() {
        return isInSale;
    }
    public void setIsInSale(Integer isInSale) {
        this.isInSale = isInSale;
    }
    public Date getUpdatedOn() {
        return updatedOn;
    }
    public void setUpdatedOn(Date updatedOn) {
        this.updatedOn = updatedOn;
    }
    public String getSellPrice() {
        return sellPrice;
    }
    public void setSellPrice(String sellPrice) {
        this.sellPrice = sellPrice;
    }
    public Long getCountryId() {
        return countryId;
    }
    public void setCountryId(Long countryId) {
        this.countryId = countryId;
    }
    public Integer getPlatform() {
        return platform;
    }
    public void setPlatform(Integer platform) {
        this.platform = platform;
    }
    public String getSupplierName() {
        return supplierName;
    }
    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }
    public Double getMinSellPriceZh() {
        return minSellPriceZh;
    }
    public void setMinSellPriceZh(Double minSellPriceZh) {
        this.minSellPriceZh = minSellPriceZh;
    }
    public Double getMinSellPriceEn() {
        return minSellPriceEn;
    }
    public void setMinSellPriceEn(Double minSellPriceEn) {
        this.minSellPriceEn = minSellPriceEn;
    }
    public Double getMaxSellPriceZh() {
        return maxSellPriceZh;
    }
    public void setMaxSellPriceZh(Double maxSellPriceZh) {
        this.maxSellPriceZh = maxSellPriceZh;
    }
    public Double getMaxSellPriceEn() {
        return maxSellPriceEn;
    }
    public void setMaxSellPriceEn(Double maxSellPriceEn) {
        this.maxSellPriceEn = maxSellPriceEn;
    }
	public List<Product> getSimilarProduct() {
		return similarProduct;
	}
	public void setSimilarProduct(List<Product> similarProduct) {
		this.similarProduct = similarProduct;
	}

}
