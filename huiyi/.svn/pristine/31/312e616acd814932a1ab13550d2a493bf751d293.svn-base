package com.mvc.base.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Service;
import com.mvc.framework.service.BaseService;
import com.mvc.base.model.Country;

@Service
public class CountryManager extends BaseService<Country, Serializable> {

	public List<Country> getCountryByStatus(int status){
		return searchBySql("select A from " + Country.class.getName() +" A where A.status = ?", status);
	}
}
