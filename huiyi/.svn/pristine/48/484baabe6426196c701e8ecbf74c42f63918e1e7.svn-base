package com.mvc.business.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.HYConstants;
import com.mvc.business.model.Inquiry;
import com.mvc.business.model.Quotation;
import com.mvc.business.service.InquiryManager;
import com.mvc.business.service.QuotationManager;
import com.mvc.framework.dao.PropertyFilter;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.util.PageUtils;
import com.mvc.framework.web.PageController;
import com.mvc.member.model.Company;
import com.mvc.member.service.CompanyManager;
import com.mvc.product.model.Product;

@Controller
@RequestMapping("/admin/inquiry")
public class InquiryController  extends PageController<Inquiry>{

	@Autowired
	private InquiryManager inquiryManager;
	@Autowired
	private QuotationManager quotationManager;
	@Autowired
	private CompanyManager companyManager;

	@Override
	public String getFileBasePath() {
		return "business/";
	}

	@Override
	public PageManager<Inquiry> getEntityManager() {
		return inquiryManager;
	}
	
	@Override
	public String handlePage(HttpServletRequest request, PageSearch page) {
		String companyName = (String)page.getFilterValue("LIKES_companyName");
		String productName = (String)page.getFilterValue("LIKES_productName");
		page.getFilters().clear();
		if(StringUtils.isNotBlank(companyName)){
			List<Long> companyIds = companyManager.getCompanyIdsByName(companyName);
			String fromCompanyIds = "";
			for(Long companyId:companyIds){
				if(StringUtils.isBlank(fromCompanyIds)){
					fromCompanyIds += companyId;
				}else{
					fromCompanyIds += ","+companyId;
				}
				
			}
			page.getFilters().add(new PropertyFilter(Inquiry.class.getName(), "ICL_fromCompanyId", fromCompanyIds));
		}
		if(StringUtils.isNotBlank(productName)){
			page.getFilters().add(new PropertyFilter(Inquiry.class.getName(), "LIKES_productName", productName));
		}
		getEntityManager().find(page);
		List<Inquiry> inquirys=page.getList();
		for (int j = 0; j < inquirys.size(); j++) {
			Inquiry inquiry = inquirys.get(j);
			Long o = inquiry.getObjectId();
			Object[] params = new Object[2];
			params[0] = o;
			params[1] = inquiry.getFromCompanyId();
			List<Quotation> ss = quotationManager.search("A.inquiryId = ? and A.toCompanyId = ?", params);
			inquirys.get(j).setNumber(ss.size());
			Company company = companyManager.getByObjectId(inquiry.getFromCompanyId());
			if(company!=null){
				inquirys.get(j).setCompanyName(company.getNameZh());
			}
		}
		request.setAttribute("action", "page");
		return getFileBasePath() + "list" + getActualArgumentType().getSimpleName();
	}
	
	
}
