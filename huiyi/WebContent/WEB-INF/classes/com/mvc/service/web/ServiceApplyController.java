package com.mvc.service.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.framework.service.PageManager;
import com.mvc.framework.web.PageController;
import com.mvc.service.model.ServiceApply;
import com.mvc.service.service.ServiceApplyManager;

@Controller
@RequestMapping("serviceApply")
public class ServiceApplyController extends PageController<ServiceApply>{
	
	@Autowired
	private ServiceApplyManager serviceApplyManager;
	
	@Override
	public PageManager<ServiceApply> getEntityManager() {
		return serviceApplyManager;
	}
	
	@Override
	public String getFileBasePath() {
		return "service/";
	}
}
