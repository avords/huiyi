package com.mvc.member.model;

import java.util.Date;
import javax.persistence.Entity;
import com.mvc.framework.model.BaseEntity;

/**
 * 收藏
 * 
 */
@Entity(name = "T_FAVORITES")
public class Favorites extends BaseEntity {

	private static final long serialVersionUID = 1L;

	// 对应的 企业id、产品id
	private Long entityId;
	// 实体类型
	/**
	 * 字典表配置： 0：产品 1：企业
	 */
	private Integer type;
	// 收藏时间
	private Date favoritesDate;

	// 企业id
	private Long companyId;
	// 是否删除
	private Integer isDelete;
	
}