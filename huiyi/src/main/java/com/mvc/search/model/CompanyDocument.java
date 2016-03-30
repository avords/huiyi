package com.mvc.search.model;

import java.io.Serializable;
import java.util.List;

public class CompanyDocument implements Serializable{
    private static final long serialVersionUID = -1273262808194840097L;
    private Long id;//企业id
    private String name;//企业名称
    private Integer memberLevel;//会员级别
    private Integer isCheck;//是否已验厂
    private Integer isAllow;//是否许可
    private List<Integer> companyType;//企业类型
    private String qualityCertifica;//资质证书字符串
    private String countryName;//所属国家
    private List<Integer> auditProfile;//已验证的资质证书类型
    private String mainProductStr;//已验证的资质证书类型

    private List<MainProductView> mainProducts;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getMemberLevel() {
        return memberLevel;
    }

    public void setMemberLevel(Integer memberLevel) {
        this.memberLevel = memberLevel;
    }

    public Integer getIsCheck() {
        return isCheck;
    }

    public void setIsCheck(Integer isCheck) {
        this.isCheck = isCheck;
    }

    public Integer getIsAllow() {
        return isAllow;
    }

    public void setIsAllow(Integer isAllow) {
        this.isAllow = isAllow;
    }

    public List<Integer> getCompanyType() {
        return companyType;
    }

    public void setCompanyType(List<Integer> companyType) {
        this.companyType = companyType;
    }

    public String getQualityCertifica() {
        return qualityCertifica;
    }

    public void setQualityCertifica(String qualityCertifica) {
        this.qualityCertifica = qualityCertifica;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    public List<Integer> getAuditProfile() {
        return auditProfile;
    }

    public void setAuditProfile(List<Integer> auditProfile) {
        this.auditProfile = auditProfile;
    }

    public List<MainProductView> getMainProducts() {
        return mainProducts;
    }

    public void setMainProducts(List<MainProductView> mainProducts) {
        this.mainProducts = mainProducts;
    }

    public String getMainProductStr() {
        return mainProductStr;
    }

    public void setMainProductStr(String mainProductStr) {
        this.mainProductStr = mainProductStr;
    }


}
