package com.mvc.base.model;

import java.util.Date;
import javax.persistence.Entity;
import com.mvc.framework.model.BaseEntity;

/**
 * 站内信
 * 
 */
@Entity(name = "T_MESSAGE")
public class Message extends BaseEntity {

	private static final long serialVersionUID = 1L;

	// 发送企业
	private Long fromCompany;
	// 接收企业
	private Long toCompany;
	// 内容
	private String msg;
		
	// 站内信来源
	/**
	 * 字典表配置：
	 * 0：企业详情下面  
	 * 1：产品详情下面  
	 * 2：询价下面
	 */
	private Integer source;
	
	// 发送时间
	private Date sendDate;
	// 是否查看
	private Integer isSee;
	// 查看时间
	private Date seeDate;
	// 是否回复
	private Integer isReply;
	// 回复时间
	private Date replyDate;

	
}