package com.mvc.service.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.HYConstants;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.web.PageController;
import com.mvc.member.model.Company;
import com.mvc.member.service.CompanyManager;
import com.mvc.security.model.User;
import com.mvc.security.service.UserManager;
import com.mvc.service.model.Service;
import com.mvc.service.model.ServiceApply;
import com.mvc.service.service.ServiceApplyManager;
import com.mvc.service.service.ServiceManager;

@Controller
@RequestMapping("/admin/serviceApply")
public class ServiceApplyController extends PageController<ServiceApply>{
	
	@Autowired
	private ServiceApplyManager serviceApplyManager;
	
	@Autowired
	private ServiceManager serviceManager;

	@Autowired
	private CompanyManager companyManager;
	
	@Autowired
	private UserManager userManager;
	
	@Override
	public PageManager<ServiceApply> getEntityManager() {
		return serviceApplyManager;
	}
	
	@Override
	public String getFileBasePath() {
		return "service/";
	}
	
	@Override
	protected String handlePage(HttpServletRequest request, PageSearch page) {
		List<Service> services=serviceManager.getAll();
		for (Service service : services) {
			if (service.getType().equals(HYConstants.SERVICE_TYPE_SOURCING)) {
				service.setServiceType("优化采购");
			}else if (service.getType().equals(HYConstants.SERVICE_TYPE_PROMOTING)) {
				service.setServiceType("优化推广");
			}else if (service.getType().equals(HYConstants.SERVICE_TYPE_HELPING)) {
				service.setServiceType("汇医助手");
			}else {
				service.setServiceType("");
			}
		}
		List<Company> companys=companyManager.getAll();
		List<User> users=userManager.getValidUsers();
		request.setAttribute("services", services);
		request.setAttribute("companys", companys);
		request.setAttribute("users", users);
       return super.handlePage( request, page);
	}
	
	@RequestMapping("/viewApply/{objectId}")
	public String viewApply(HttpServletRequest request,@PathVariable Long objectId) {
		if (null != objectId) {
			ServiceApply serviceApply = serviceApplyManager.getByObjectId(objectId);
			request.setAttribute("entity", serviceApply);
		}
		List<Service> services=serviceManager.getAll();
		List<Company> companys=companyManager.getAll();
		request.setAttribute("services", services);
		request.setAttribute("companys", companys);
		
		return getFileBasePath() + "viewServiceApply";
	}
	
	@RequestMapping(value = "/audit/{objectId}")
	 public String audit(HttpServletRequest request, HttpServletResponse response, @PathVariable Long objectId ,int dealStatus) throws Exception{
			serviceApplyManager.setDealStatus(objectId, dealStatus);
			serviceApplyManager.update(objectId);
			return "redirect:/admin/serviceApply/page" + getMessage("common.base.success", request) + "&" + appendAjaxParameter(request);
	   }
	
	
	@RequestMapping(value = "/handel/{objectId}")
	 public String handel(HttpServletRequest request, HttpServletResponse response, @PathVariable Long objectId) throws Exception{
		if (null != objectId) {
			Object entity = getManager().getByObjectId(objectId);
			request.setAttribute("entity", entity);
		}
			return getFileBasePath() + "handelServiceApply";	  
	}
	
	@RequestMapping(value = "/saveHandel/{objectId}")
	public String saveHandel(HttpServletRequest request, HttpServletResponse response, @PathVariable Long objectId ) throws Exception{
		ServiceApply serviceApply = serviceApplyManager.getByObjectId(objectId);
		serviceApply.setStatus(Integer.parseInt(request.getParameter("status")));
		serviceApply.setHandleContent(request.getParameter("handleContent"));
		serviceApplyManager.save(serviceApply);
		return "redirect:/admin/serviceApply/handel/"+serviceApply.getObjectId()+"?message=success&ajax=1";
	}
}
