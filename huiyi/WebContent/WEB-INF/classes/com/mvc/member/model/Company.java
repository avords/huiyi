package com.mvc.member.model;

import java.util.Date;

import javax.persistence.Entity;

import com.mvc.framework.model.I18nFilter;

/**
 * 企业信息
 * 
 */
@Entity(name = "T_COMPANY")
public class Company extends I18nFilter {

	private static final long serialVersionUID = 1L;

	/**
	 * 注册账号收集信息
	 */
	// 是否国内企业
	private Integer isChina;
	// 地区
	private Long country;
	// 买家or卖家or买卖家
	private Integer sellOrBuy;
	// 企业注册方式(自己注册or平台注册)
	private Integer registerWay;

	/**
	 * 企业基础信息
	 */
	// 优先级
	private Integer priority;
	// 企业名称英文
	private String nameEn;
	// 企业名称
	private String nameZh;
	// 公司地址英文
	private String addressEn;

	/**
	 * 企业在平台关键信息
	 */
	// 商业类型（工厂，供应商，公司 多选）
	private String businessType;
	// 主要经营产品
	private String mainProducts;
	// 企业描述英文
	private String descriptionEn;
	// 企业描述
	private String description;

	/**
	 * 工商注册信息
	 */
	// 工商注册号
	private String registNumber;
	// 注册资本
	private String registCapital;
	// 成立时间
	private Date foundingDate;
	// 公司性质
	private Integer companyNature;
	// 企业规模
	private Integer numEmployees;

	/**
	 * 平台验证信息
	 */
	// 是否验厂
	private Integer isCheck;
	// 是否许可
	private Integer isAllow;
	// 验证资质（根据客户提供，字典表配置，多项选择）
	private String checkInfo;

	/**
	 * 会员信息
	 */
	// 注册时间
	private Date registerDate;
	// 信用等级
	private Integer creditLevel;
	// 付费等级
	private Integer paymentLevel;

	/**
	 * 联系企业
	 */
	// 公司地址英文
	private String linkAddressEn;
	// 公司地址
	private String linkAddress;
	// 公司邮箱
	private String email;
	// 公司电话区号
	private String businessPhoneF;
	// 公司电话号码
	private String businessPhoneS;
	// 公司传真区号
	private String businessFaxF;
	// 公司传真
	private String businessFaxS;
	// 公司网址
	private String website;

	/**
	 * 企业联系人信息
	 */
	// 联系人姓名英文
	private String linkManEn;
	// 联系人姓名
	private String linkMan;
	// 联系人电话
	private String linkTelephone;
	// 联系人手机
	private String linkMobilePhone;
	// 联系人邮箱
	private String linkEmail;

	/**
	 * 系统记录
	 */
	// 状态
	private Integer status;
	// 是否删除
	private Integer isDeleted;
	// 创建时间
	private Date createdDate;
	// 创建人
	private String createdBy;
	// 修改时间
	private Date updatedDate;
	// 修改人
	private String updatedBy;
	public Integer getIsChina() {
		return isChina;
	}
	public void setIsChina(Integer isChina) {
		this.isChina = isChina;
	}
	public Long getCountry() {
		return country;
	}
	public void setCountry(Long country) {
		this.country = country;
	}
	public Integer getSellOrBuy() {
		return sellOrBuy;
	}
	public void setSellOrBuy(Integer sellOrBuy) {
		this.sellOrBuy = sellOrBuy;
	}
	public Integer getRegisterWay() {
		return registerWay;
	}
	public void setRegisterWay(Integer registerWay) {
		this.registerWay = registerWay;
	}
	public Integer getPriority() {
		return priority;
	}
	public void setPriority(Integer priority) {
		this.priority = priority;
	}
	public String getNameEn() {
		return nameEn;
	}
	public void setNameEn(String nameEn) {
		this.nameEn = nameEn;
	}
	public String getNameZh() {
		return nameZh;
	}
	public void setNameZh(String nameZh) {
		this.nameZh = nameZh;
	}
	public String getAddressEn() {
		return addressEn;
	}
	public void setAddressEn(String addressEn) {
		this.addressEn = addressEn;
	}
	public String getBusinessType() {
		return businessType;
	}
	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}
	public String getMainProducts() {
		return mainProducts;
	}
	public void setMainProducts(String mainProducts) {
		this.mainProducts = mainProducts;
	}
	public String getDescriptionEn() {
		return descriptionEn;
	}
	public void setDescriptionEn(String descriptionEn) {
		this.descriptionEn = descriptionEn;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getRegistNumber() {
		return registNumber;
	}
	public void setRegistNumber(String registNumber) {
		this.registNumber = registNumber;
	}
	public String getRegistCapital() {
		return registCapital;
	}
	public void setRegistCapital(String registCapital) {
		this.registCapital = registCapital;
	}
	public Date getFoundingDate() {
		return foundingDate;
	}
	public void setFoundingDate(Date foundingDate) {
		this.foundingDate = foundingDate;
	}
	public Integer getCompanyNature() {
		return companyNature;
	}
	public void setCompanyNature(Integer companyNature) {
		this.companyNature = companyNature;
	}
	public Integer getNumEmployees() {
		return numEmployees;
	}
	public void setNumEmployees(Integer numEmployees) {
		this.numEmployees = numEmployees;
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
	public String getCheckInfo() {
		return checkInfo;
	}
	public void setCheckInfo(String checkInfo) {
		this.checkInfo = checkInfo;
	}
	public Date getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	public Integer getCreditLevel() {
		return creditLevel;
	}
	public void setCreditLevel(Integer creditLevel) {
		this.creditLevel = creditLevel;
	}
	public Integer getPaymentLevel() {
		return paymentLevel;
	}
	public void setPaymentLevel(Integer paymentLevel) {
		this.paymentLevel = paymentLevel;
	}
	public String getLinkAddressEn() {
		return linkAddressEn;
	}
	public void setLinkAddressEn(String linkAddressEn) {
		this.linkAddressEn = linkAddressEn;
	}
	public String getLinkAddress() {
		return linkAddress;
	}
	public void setLinkAddress(String linkAddress) {
		this.linkAddress = linkAddress;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBusinessPhoneF() {
		return businessPhoneF;
	}
	public void setBusinessPhoneF(String businessPhoneF) {
		this.businessPhoneF = businessPhoneF;
	}
	public String getBusinessPhoneS() {
		return businessPhoneS;
	}
	public void setBusinessPhoneS(String businessPhoneS) {
		this.businessPhoneS = businessPhoneS;
	}
	public String getBusinessFaxF() {
		return businessFaxF;
	}
	public void setBusinessFaxF(String businessFaxF) {
		this.businessFaxF = businessFaxF;
	}
	public String getBusinessFaxS() {
		return businessFaxS;
	}
	public void setBusinessFaxS(String businessFaxS) {
		this.businessFaxS = businessFaxS;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getLinkManEn() {
		return linkManEn;
	}
	public void setLinkManEn(String linkManEn) {
		this.linkManEn = linkManEn;
	}
	public String getLinkMan() {
		return linkMan;
	}
	public void setLinkMan(String linkMan) {
		this.linkMan = linkMan;
	}
	public String getLinkTelephone() {
		return linkTelephone;
	}
	public void setLinkTelephone(String linkTelephone) {
		this.linkTelephone = linkTelephone;
	}
	public String getLinkMobilePhone() {
		return linkMobilePhone;
	}
	public void setLinkMobilePhone(String linkMobilePhone) {
		this.linkMobilePhone = linkMobilePhone;
	}
	public String getLinkEmail() {
		return linkEmail;
	}
	public void setLinkEmail(String linkEmail) {
		this.linkEmail = linkEmail;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(Integer isDeleted) {
		this.isDeleted = isDeleted;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public Date getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}
	public String getUpdatedBy() {
		return updatedBy;
	}
	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}
}