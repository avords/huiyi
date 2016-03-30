package com.mvc.member.model;

import java.util.Date;
import javax.persistence.Entity;
import com.mvc.framework.model.BaseEntity;

/**
 * 我的足迹
 * 
 */
@Entity(name = "T_VIEW_HISTORY")
public class History extends BaseEntity {

	private static final long serialVersionUID = 1L;

	// 对应的 企业id、产品id
	private Long entityId;
	// 实体类型
	/**
	 * 字典表配置： 0：产品 1：企业
	 */
	private Integer type;
	// 访问时间
	private Date visitDate;

	// 企業id
	private Long companyId;
	// 是否删除
	private Integer isDelete;

}