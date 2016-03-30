package com.mvc.member.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * 企业业务类型表
 * 多对多
 * @author bob.pu
 *
 */
@Entity(name="T_PAYMENTTERM")
public class PaymentTerm implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private Long quotationId;
	@Id
	private Integer paymentTermId;
	
	public Long getQuotationId() {
		return quotationId;
	}
	public void setQuotationId(Long quotationId) {
		this.quotationId = quotationId;
	}
	public Integer getPaymentTermId() {
		return paymentTermId;
	}
	public void setPaymentTermId(Integer paymentTermId) {
		this.paymentTermId = paymentTermId;
	}

	
}
