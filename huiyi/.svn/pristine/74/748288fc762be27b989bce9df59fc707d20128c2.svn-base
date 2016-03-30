package com.mvc.member.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Service;

import com.mvc.framework.service.BaseService;
import com.mvc.member.model.BusinessType;

@Service
public class BusinessTypeManager extends BaseService<BusinessType, Serializable>{
	
	public List<BusinessType> getBusinessTypeByCompanyId(Long companyId){
		return searchBySql("select A from " + BusinessType.class.getName() +" A where A.companyId = ?", companyId);
	}
	
	public void deleteByCompanyId(Long companyId){
		super.deleteByWhere("companyId = " + companyId);
	}
}
