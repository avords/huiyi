package com.mvc.member.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Transient;

import com.mvc.framework.model.I18nFilter;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;

/**
 * 企业信息
 * 
 */
@Entity(name = "T_COMPANY")
public class Company extends I18nFilter {
	/*
	 * 草稿
	 */
	public static final int COMPANY_STATUS_DRAFT = 1;
	/*
	 * 待审核
	 */
	public static final int COMPANY_STATUS_WAIT_CHECK = 2;
	/*
	 * 审核通过
	 */
	public static final int COMPANY_STATUS_PASSED = 3;
	/*
	 * 审核不通过
	 */
	public static final int COMPANY_STATUS_NO_PASSED = 4;
	/*
	 * 合同过期
	 */
	public static final int COMPANY_STATUS_CONTRACT_EXPIRES = 5;
	/*
	 * 终止合同
	 */
	public static final int COMPANY_STATUS_CONTRACT_END = 6;
	
	/*
	 * 企业身份(供应商)
	 */
	public static final int COMPANY_ISSUPPLIER_TRUE =1;
	
	/*
	 * 企业身份(买家)
	 */
	public static final int COMPANY_ISSUPPLIER_FALSE = 0;
	
	/*
	 * 企业注册方式(前台)
	 */
	public static final int COMPANY_REGISTERWAY_FOREGROUND=1;
	
	/*
	 * 企业注册方式(后台)
	 */
	public static final int COMPANY_REGISTERWAY_BACKGROUND=2;
	
	/*
	 * 企业公共参数(否)
	 */
	public static final int COMMON_PARAMETER_FALSE=0;
	
	/*
	 * 企业会员默认等级
	 */
	public static final int COMPANY_MEMBER_LEVEL1=1;
	
	private static final long serialVersionUID = 1L;

	// 企业名称英文
	@NotNull
	@Length(max=64)
	private String nameEn;
	// 企业名称
	@NotNull
	@Length(max=64)
	private String nameZh;
	// 是否供应商(dictionary_id = 109)
	@NotNull
	private Integer isSupplier;
	// 公司邮箱
	@NotNull
	@Length(max=128)
	private String email;
	// 手机
	@Length(max=32)
	private String telphone;
	// 公司电话区号
	@Length(max=32)
	@NotNull
	private String phoneAreaCode;
	// 公司电话号码
	@NotNull
	@Length(max=32)
	private String phone;
	// 公司传真区号
	@NotNull
	@Length(max=32)
	private String faxAreaCode;
	// 公司传真
	@NotNull
	@Length(max=32)
	private String fax;
	// 公司网址
	@Length(max=64)
	private String website;
	// 所属国家
	@NotNull
	private Long countryId;
	// 公司详细地址英文
	@Length(max=128)
	@NotNull
	private String addressEn;
	// 公司详细地址
	@Length(max=128)
	@NotNull
	private String addressZh;
	// 主要经营产品
	@Length(max=128)
	@NotNull
	private String mainProductsZh;
	// 主要经营产品英文
	@Length(max=128)
	@NotNull
	private String mainProductsEn;
	/**
	 * 工商注册信息
	 */
	// 工商注册号
	@Length(max=64)
	private String registNumber;
	// 注册资本
	private Long registCapital;
	// 成立时间
	private Date foundingDate;
	// 企业规模(dictionary_id = 1111)
	private Integer numEmployees;
	//企业Logo
	@Length(max=512)
	private String logoAddress;
	//企业展示主图
	@Length(max=512)
	private String mainPicture;
	//营业执照
	@Length(max=512)
	private String businessLicence;
	//税务登记证
	@Length(max=512)
	private String taxRegistrationCertificate;
    //组织机构代码
	@Length(max=512)
	private String organizationRegistrationCode;
	
	/**
	 * 平台验证信息
	 */
	
	// 是否验厂(dictionary_id = 109)
	@NotNull
	private Integer isCheck;
	// 是否许可(dictionary_id = 109)
	@NotNull
	private Integer isAllow;
	/**
	 * 企业会员信息
	 */
	// 注册时间
	private Date registerDate;
	// 更新时间
	private Date updateDate;
	// 注册方式
	private Integer registerWay;
	// 会员级别(dictionary_id = 1402)
	@NotNull
	private Integer level;
	/**
	 * 系统记录
	 */
	// 状态(dictionary_id = 1112)
	private Integer status;
	
	// 企业描述英文
	@NotNull
	@Column(columnDefinition = "MEDIUMTEXT")
	private String descriptionZh;
	// 企业描述
	@NotNull
	@Column(columnDefinition = "MEDIUMTEXT")
	private String descriptionEn;
	
	@Transient
	private List<CompanyCertificate> certificates;
	@Transient
	private List<BusinessType> busType;
	@Transient
	private String txtDescription;
	
	public String getTxtDescription() {
		return txtDescription;
	}

	public void setTxtDescription(String txtDescription) {
		this.txtDescription = txtDescription;
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

	public Integer getIsSupplier() {
		return isSupplier;
	}

	public void setIsSupplier(Integer isSupplier) {
		this.isSupplier = isSupplier;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelphone() {
		return telphone;
	}

	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}

	public String getPhoneAreaCode() {
		return phoneAreaCode;
	}

	public void setPhoneAreaCode(String phoneAreaCode) {
		this.phoneAreaCode = phoneAreaCode;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFaxAreaCode() {
		return faxAreaCode;
	}

	public void setFaxAreaCode(String faxAreaCode) {
		this.faxAreaCode = faxAreaCode;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public Long getCountryId() {
		return countryId;
	}

	public void setCountryId(Long countryId) {
		this.countryId = countryId;
	}

	public String getAddressEn() {
		return addressEn;
	}

	public void setAddressEn(String addressEn) {
		this.addressEn = addressEn;
	}

	public String getAddressZh() {
		return addressZh;
	}

	public void setAddressZh(String addressZh) {
		this.addressZh = addressZh;
	}

	public String getMainProductsZh() {
		return mainProductsZh;
	}

	public void setMainProductsZh(String mainProductsZh) {
		this.mainProductsZh = mainProductsZh;
	}

	public String getMainProductsEn() {
		return mainProductsEn;
	}

	public void setMainProductsEn(String mainProductsEn) {
		this.mainProductsEn = mainProductsEn;
	}

	public String getRegistNumber() {
		return registNumber;
	}

	public void setRegistNumber(String registNumber) {
		this.registNumber = registNumber;
	}

	public Long getRegistCapital() {
		return registCapital;
	}

	public void setRegistCapital(Long registCapital) {
		this.registCapital = registCapital;
	}

	public Date getFoundingDate() {
		return foundingDate;
	}

	public void setFoundingDate(Date foundingDate) {
		this.foundingDate = foundingDate;
	}

	public Integer getNumEmployees() {
		return numEmployees;
	}

	public void setNumEmployees(Integer numEmployees) {
		this.numEmployees = numEmployees;
	}

	public String getLogoAddress() {
		return logoAddress;
	}

	public void setLogoAddress(String logoAddress) {
		this.logoAddress = logoAddress;
	}

	public String getMainPicture() {
		return mainPicture;
	}

	public void setMainPicture(String mainPicture) {
		this.mainPicture = mainPicture;
	}

	public String getBusinessLicence() {
		return businessLicence;
	}

	public void setBusinessLicence(String businessLicence) {
		this.businessLicence = businessLicence;
	}

	public String getTaxRegistrationCertificate() {
		return taxRegistrationCertificate;
	}

	public void setTaxRegistrationCertificate(String taxRegistrationCertificate) {
		this.taxRegistrationCertificate = taxRegistrationCertificate;
	}

	public String getOrganizationRegistrationCode() {
		return organizationRegistrationCode;
	}

	public void setOrganizationRegistrationCode(String organizationRegistrationCode) {
		this.organizationRegistrationCode = organizationRegistrationCode;
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

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public Integer getRegisterWay() {
		return registerWay;
	}

	public void setRegisterWay(Integer registerWay) {
		this.registerWay = registerWay;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getDescriptionZh() {
		return descriptionZh;
	}

	public void setDescriptionZh(String descriptionZh) {
		this.descriptionZh = descriptionZh;
	}

	public String getDescriptionEn() {
		return descriptionEn;
	}

	public void setDescriptionEn(String descriptionEn) {
		this.descriptionEn = descriptionEn;
	}

	public List<CompanyCertificate> getCertificates() {
		return certificates;
	}

	public void setCertificates(List<CompanyCertificate> certificates) {
		this.certificates = certificates;
	}
    
	public List<BusinessType> getBusType() {
		return busType;
	}

	public void setBusType(List<BusinessType> busType) {
		this.busType = busType;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
}