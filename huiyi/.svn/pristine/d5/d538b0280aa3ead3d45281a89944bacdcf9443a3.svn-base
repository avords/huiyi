package com.mvc.base.model;

import java.util.Date;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.BaseEntity;

/**
 * 站内信
 * 
 */
@Entity(name = "T_MESSAGE")
public class Message extends BaseEntity {

	private static final long serialVersionUID = 1L;
	
	// 发送人
	@NotNull
	private Long fromUser;
	//发送标题
	@NotNull
	@Length(max=50)
	private String title;
	// 发送企业
	private Long fromCompany;
	// 接收企业
	private Long toCompany;
	// 内容
	@NotNull
	@Length(max=255)
	private String content;
	
	// 发送时间
	@NotNull
	private Date sendDate;
	// 是否查看（1.是 0.否）
	@NotNull
	private Integer isSee;
	
	//消息类型1.站内信  2.询盘  3.报价
	@NotNull
	private Integer type;
	
	public Long getFromCompany() {
		return fromCompany;
	}
	public void setFromCompany(Long fromCompany) {
		this.fromCompany = fromCompany;
	}
	public Long getToCompany() {
		return toCompany;
	}
	public void setToCompany(Long toCompany) {
		this.toCompany = toCompany;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getSendDate() {
		return sendDate;
	}
	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}
	public Integer getIsSee() {
		return isSee;
	}
	public void setIsSee(Integer isSee) {
		this.isSee = isSee;
	}
	public Long getFromUser() {
		return fromUser;
	}
	public void setFromUser(Long fromUser) {
		this.fromUser = fromUser;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
}