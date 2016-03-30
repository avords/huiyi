package com.mvc.business.web;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.business.model.Quotation;
import com.mvc.business.service.QuotationManager;
import com.mvc.framework.dao.PropertyFilter;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.web.PageController;

@Controller
@RequestMapping("/admin/reportPrice")
public class QuotationController  extends PageController<Quotation>{

	@Autowired
	private QuotationManager quotationManager;
	
	@Override
	public PageManager<Quotation> getEntityManager() {
		return quotationManager;
	}
	@Override
	public String getFileBasePath() {
		return "business/";
	}
	@Override
	public String handlePage(HttpServletRequest request, PageSearch page) {
		String inquiryIdStr = request.getParameter("inquiryId");
		String companyIdStr = request.getParameter("companyId");
		if(StringUtils.isNotBlank(inquiryIdStr)){
			page.getFilters().add(new PropertyFilter(Quotation.class.getName(), "EQL_inquiryId", inquiryIdStr));
		}
		if(StringUtils.isNotBlank(companyIdStr)){
			page.getFilters().add(new PropertyFilter(Quotation.class.getName(), "EQL_toCompanyId", companyIdStr));
		}
		getEntityManager().find(page);
		request.setAttribute("action", "page");
		request.setAttribute("inquiryId", inquiryIdStr);
		request.setAttribute("companyId", companyIdStr);
		return getFileBasePath() + "list" + getActualArgumentType().getSimpleName();
	}
}