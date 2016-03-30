package com.mvc.member.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Service;

import com.mvc.framework.service.BaseService;
import com.mvc.member.model.PaymentTerm;

@Service
public class PaymentTermManager extends BaseService<PaymentTerm, Serializable>{
	
	public List<PaymentTerm> getPaymentTermByQuotationId(Long quotationId){
		return searchBySql("select A from " + PaymentTerm.class.getName() +" A where A.quotationId = ?", quotationId);
	}
	
	public void deleteByQuotationId(Long quotationId){
		super.deleteByWhere("quotationId = " + quotationId);
	}
}
