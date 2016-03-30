
package com.mvc.search.model;

import java.io.Serializable;

public class ProductDocument implements Serializable{

	private static final long serialVersionUID = -719530681680614958L;

	private Long id;
	private String name;
	private String subName;
    private String mainPicture;
    private Double minPrice;
    private Integer minBuyNumber;
    //企业有关
    private Long supplierId;
    private String companyName;//公司名称
    private Integer memberLevel;//会员级别
    private Integer isCheckFactory;//是否验厂
    private String companyCertifica;//企业资质证书
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getSubName() {
        return subName;
    }
    public void setSubName(String subName) {
        this.subName = subName;
    }
    public String getMainPicture() {
        return mainPicture;
    }
    public void setMainPicture(String mainPicture) {
        this.mainPicture = mainPicture;
    }
    public Double getMinPrice() {
        return minPrice;
    }
    public void setMinPrice(Double minPrice) {
        this.minPrice = minPrice;
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getCompanyName() {
        return companyName;
    }
    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }
    public Integer getMemberLevel() {
        return memberLevel;
    }
    public void setMemberLevel(Integer memberLevel) {
        this.memberLevel = memberLevel;
    }
    public String getCompanyCertifica() {
        return companyCertifica;
    }
    public void setCompanyCertifica(String companyCertifica) {
        this.companyCertifica = companyCertifica;
    }
    public Integer getIsCheckFactory() {
        return isCheckFactory;
    }
    public void setIsCheckFactory(Integer isCheckFactory) {
        this.isCheckFactory = isCheckFactory;
    }
    public Integer getMinBuyNumber() {
        return minBuyNumber;
    }
    public void setMinBuyNumber(Integer minBuyNumber) {
        this.minBuyNumber = minBuyNumber;
    }
    public Long getSupplierId() {
        return supplierId;
    }
    public void setSupplierId(Long supplierId) {
        this.supplierId = supplierId;
    }

}
