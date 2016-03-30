package com.mvc.service.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Service;

import com.mvc.framework.service.BaseService;
import com.mvc.service.model.ServiceCategory;

@Service
public class ServiceCategoryManager extends BaseService<ServiceCategory, Serializable>{

	public void deleteByServiceId(Long serviceId) {
		
		deleteByWhere("serviceId = " + serviceId);
	}
	
	@SuppressWarnings ("unchecked" )
    public List<ServiceCategory> getByServiceId(Long serviceId) {
      String sql = "select A from " + getActualArgumentType().getName() + " A"+" where A.serviceId= " +serviceId;
            return searchBySql( sql);
    }
}
