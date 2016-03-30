/*
 * (#)OnlineUser.java 1.0 2010-12-2
 */
package com.mvc.portal.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import com.mvc.Constants;
import com.mvc.framework.dao.Comment;
import com.mvc.framework.model.BaseEntity;

/**
 * 
 * @author bangxiong.pu
 *
 */
@Entity(name="F_ONLINE_USER")
@Comment("在线用户表")
public class OnlineUser extends BaseEntity{
	public static final int STATUS_OFFLINE = 0;
	public static final int STATUS_ONLINE = 1;
	
	// 会员前台登录
	public static final int TYPE_MEMBER = 1;
	// 用户后台登录
	public static final int TYPE_USER = 2;
	
	@NotNull
	@Comment("用户ID")
	private Long userId;
	@Comment("访问时间")
	private Date visiteDate;
	@NotNull
	@Comment("开始时间")
	private Date beginDate;
	@Column(length=Constants.ModelDefine.MEDIUM_LENGTH)
	@Comment("用户名称")
	private String userName;
	@NotNull
	@Column(length=Constants.ModelDefine.LARGE_LENGTH)
	@Comment("会话ID")
	private String sessionId;
	/**
	 *  0 :need login out
	 *  1 :normal online
	 */
	@NotNull
	@Comment("状态")
	private Integer status;

	private Integer userType;
	
	public Integer getUserType() {
		return userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}

	public Date getVisiteDate() {
		return visiteDate;
	}

	public void setVisiteDate(Date visiteDate) {
		this.visiteDate = visiteDate;
	}

	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	public Long getUserId() {
    	return userId;
    }

	public void setUserId(Long userId) {
    	this.userId = userId;
    }

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}
