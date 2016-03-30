package com.mvc.member.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.framework.service.PageManager;
import com.mvc.framework.web.PageController;
import com.mvc.member.model.Company;
import com.mvc.member.service.CompanyManager;

@Controller
@RequestMapping("companyBuyer")
public class CompanyController  extends PageController<Company>{

	@Autowired
	private CompanyManager companyManager;
	@Override
	public PageManager<Company> getEntityManager() {
		return companyManager;
	}

	@Override
	public String getFileBasePath() {
		return "member/";
	}

}
