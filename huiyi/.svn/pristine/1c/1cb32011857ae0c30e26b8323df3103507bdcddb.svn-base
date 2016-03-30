package com.mvc.product.model;

import java.util.Date;
import javax.persistence.Entity;
import com.mvc.framework.model.BaseEntity;

/**
 * 询价表
 *
 */
@Entity(name = "T_ENQUIRY")
public class Enquiry extends BaseEntity {

	private static final long serialVersionUID = 1L;
	
	// 是否指定产品或者类目询价
	private Integer isAppoint;
	// 对应 产品id or 某類id
	private Long entityId;
	// 实体类型
	/**
	 * 字典表配置： 0：针对单个产品询价 1：针对某类产品询价
	 */
	private Integer entiryType;

	// 询盘名稱
	private String enquiryName;
	// 询盘内容
	private String enquiryContent;
	// 是否有附件
	private Integer isFile;
	// 结束时间
	private Date endDate;
	// 狀態：撤銷(已結束)
	private Integer state;
	// 语言
	private Integer lang;

	// 对应的 @企业id（暫時定一個）
	private String companyIds;
	// 是否@企业(0:沒有；1：一個企業；2：所有)
	private Integer isCall;

	// 已经收到报价个数
	private Integer reportCount;

	/**
	 * 待定信息
	 */
	// 购买数量
	private String enquiryNum;
	// 购买单位
	private String enquiryUnit;
	// 品牌
	private Integer brand;
	// 产品型号
	private String modul;
	// 要求的发布商商业类型（多选）
	private String businessTypeOfComp;

	// 交易币种
	private Integer priceCny;
	// 交易方式（多选）
	private String tradeTerms;
	// 支付方式（多选）
	private String payment;

	/**
	 * 系统记录
	 */
	// 询价企業id
	private Long userId;
	// 是否删除
	private Integer isDelete;
	// 发布时间
	private Date enquiryDate;
	// 修改时间
	private Date updateDate;

}