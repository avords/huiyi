package com.mvc.base.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.BaseEntity;

@Entity(name="B_Advert")
public class Advert extends BaseEntity{
	private static final long serialVersionUID = 4835171961957355828L;
	
	/*
	 * 草稿
	 */
	public static final int ADVERT_STATUS_DRAFT = 1;
	/*
	 * 待审核
	 */
	public static final int ADVERT_STATUS_WAIT_CHECK = 2;
	/*
	 * 审核通过
	 */
	public static final int ADVERT_STATUS_CHECKED = 3;
	/*
	 * 复核通过
	 */
	public static final int ADVERT_STATUS_REVIEWED = 4;
	/*
	 * 发布
	 */
	public static final int ADVERT_STATUS_PUBLISH = 5;
	
	@Length(max=32)
	@NotNull
	private String advertName;
	@Length(max=32)
	@NotNull
	private String positionCode;  //广告位置
	@Length(max=250)
	private String url;  //链接地址
	@Length(max=128)
	private String pictureAddress;  //图片地址
	@NotNull
	private Date uploadDate;  
	@NotNull
	private Long uploadPersonId;   
	@NotNull
	private Integer dispalyOrder;  //显示顺序
	@NotNull
	private Integer advertStatus;
	
	public String getAdvertName() {
		return advertName;
	}

	public void setAdvertName(String advertName) {
		this.advertName = advertName;
	}

	public String getPositionCode() {
		return positionCode;
	}

	public void setPositionCode(String positionCode) {
		this.positionCode = positionCode;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public Long getUploadPersonId() {
		return uploadPersonId;
	}

	public void setUploadPersonId(Long uploadPersonId) {
		this.uploadPersonId = uploadPersonId;
	}

	public Integer getDispalyOrder() {
		return dispalyOrder;
	}

	public void setDispalyOrder(Integer dispalyOrder) {
		this.dispalyOrder = dispalyOrder;
	}

	public Integer getAdvertStatus() {
		return advertStatus;
	}

	public void setAdvertStatus(Integer advertStatus) {
		this.advertStatus = advertStatus;
	}

	public String getPictureAddress() {
		return pictureAddress;
	}

	public void setPictureAddress(String pictureAddress) {
		this.pictureAddress = pictureAddress;
	}
	
}
