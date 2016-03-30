package com.mvc.base.service;

import java.io.Serializable;
import org.springframework.stereotype.Service;

import com.mvc.base.model.AdvertPosition;
import com.mvc.framework.service.BaseService;
@Service
public class AdvertPositionManager extends BaseService<AdvertPosition, Serializable>{

	public AdvertPosition getAdvertPositionByPositionCode(String positionCode) {
		return super.searchByWhere("positionCode =?", positionCode);
	}

}
