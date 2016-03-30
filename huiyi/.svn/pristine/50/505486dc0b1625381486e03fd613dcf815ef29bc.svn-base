package com.mvc.member.model;

import java.util.Date;
import javax.persistence.Entity;
import com.mvc.framework.model.BaseEntity;

/**
 * 报价
 * 
 */
@Entity(name = "T_REPORT_PRICE")
public class ReportPrice extends BaseEntity {

	private static final long serialVersionUID = 1L;

	// 发送公司id
	private Long fromCompanyId;
	// 接收公司id
	private Long toCompanyId;
	// 名稱
	private String name;
	// 内容
	private String msg;
	// 是否有附件
	private Integer isFile;
	// 语言
	private Integer lang;

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

	/**
	 * 待定信息
	 */
	// 购买数量
	private String enquiryNum;
	// 购买单位
	private String enquiryUnit;
	// 總價
	private String sum;

	// 交易币种
	private Integer priceCny;
	// 交易方式（多选）
	private String tradeTerms;
	// 支付方式（多选）
	private String payment;

}