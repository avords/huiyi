package com.mvc.business.service;

import java.io.Serializable;

import org.hibernate.Query;
import org.springframework.stereotype.Service;

import com.mvc.business.model.InquiryItem;
import com.mvc.framework.service.BaseService;

@Service
public class InquiryItemManager extends BaseService<InquiryItem, Serializable>{
	
	public void updateOfferStatus(Integer status,Long companyId,Long inquiryId){
		String sql = "update t_inquiry_item set status = "+status+" where 1=1 " ;
			if(companyId!=null){
				sql += " and to_company_id = "+companyId;
			}
			if(inquiryId!=null){
				sql += " and inquiry_id = "+inquiryId;
			}
		Query query = getSession().createSQLQuery(sql);
		query.executeUpdate();
	}
	
}
