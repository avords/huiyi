package com.mvc.service.web;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.framework.dao.PropertyFilter;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.web.PageController;
import com.mvc.service.model.Service;
import com.mvc.service.service.ServiceManager;

@Controller
@RequestMapping("service")
public class ServiceController extends PageController<Service>{

	@Autowired
	private ServiceManager serviceManager;
	
	@Override
	public PageManager<Service> getEntityManager() {
		return serviceManager;
	}
	
	@Override
	public String getFileBasePath() {
		return "service/";
	}
	
	@RequestMapping(value = "/isDeleted/{objectId}")
	protected String isDeleted(HttpServletRequest request, HttpServletResponse response, @PathVariable Long objectId)
			throws Exception {
		Service service = serviceManager.getByObjectId(objectId);
		if (service.getIsDeleted()==2) {
			serviceManager.isDeleted(objectId);
			serviceManager.update(objectId);
		}
		if (service.getIsDeleted()==1) {
			serviceManager.notDeleted(objectId);
			serviceManager.update(objectId);
		}
		return "redirect:../page" + getMessage("common.base.success", request) + "&" + appendAjaxParameter(request);
	}
	
	@Override
	protected String handleSave(HttpServletRequest request, ModelMap modelMap, Service service) throws Exception {
		if (request.getParameter("createdDate")==null
				){
			service.setCreatedDate(new Date());
		}
		service.setUpdatedDate(new Date());
		try {
			int status =Integer.parseInt(request.getParameter("status").toString());
			service.setStatus(status);
		} catch (Exception e) {
		}
		serviceManager.save(service);
		return "redirect:/service/edit/"+service.getObjectId()+getMessage("common.base.success", request);
	}
	
	@RequestMapping("/submitForCheck/{objectId}")
	 public String submitForCheck(HttpServletRequest request, HttpServletResponse response, @PathVariable Long objectId) throws Exception{
		serviceManager.setStatus(objectId, Service.SERVICE_STATUS_WAIT_CHECK);
		serviceManager.update(objectId);
		return "redirect:../page" + getMessage("common.base.success", request) + "&" + appendAjaxParameter(request);
    }
	 
	@RequestMapping("/pass/{objectId}")
	 public String pass(HttpServletRequest request, HttpServletResponse response, @PathVariable Long objectId) throws Exception{
		serviceManager.setStatus(objectId, Service.SERVICE_STATUS_PASS);
		serviceManager.update(objectId);
		return "redirect:../check" + getMessage("common.base.success", request) + "&" + appendAjaxParameter(request);
   }
	
	@RequestMapping("/unPass/{objectId}")
	 public String unPass(HttpServletRequest request, HttpServletResponse response, @PathVariable Long objectId) throws Exception{
		serviceManager.setStatus(objectId, Service.SERVICE_STATUS_UNPASS);
		serviceManager.update(objectId);
		return "redirect:../check" + getMessage("common.base.success", request) + "&" + appendAjaxParameter(request);
  }
	
	@RequestMapping("/publish")
    public String publishPage(HttpServletRequest request,Integer backPage) throws Exception{
   	    PageSearch page  = preparePage(request);
   	    String status=""+Service.SERVICE_STATUS_WAIT_PUBLISH;
	    page.getFilters().add(new PropertyFilter(Service.class.getName(), "EQI_status",status));
        page.setSortProperty("createdDate");
        page.setSortOrder("desc");
        getEntityManager().find(page);
        request.setAttribute("action", "page");
        request.setAttribute("status", status);
        afterPage(request, page,backPage);
    	return getFileBasePath() + "list" + getActualArgumentType().getSimpleName()+"Publish";
    }
	
	@RequestMapping("/check")
    public String checkPage(HttpServletRequest request,Integer backPage) throws Exception{
   	    PageSearch page  = preparePage(request);
   	    String status=""+Service.SERVICE_STATUS_WAIT_CHECK;
	    page.getFilters().add(new PropertyFilter(Service.class.getName(), "EQI_status",status));
        page.setSortProperty("createdDate");
        page.setSortOrder("desc");
        getEntityManager().find(page);
        request.setAttribute("action", "page");
        request.setAttribute("status", status);
        afterPage(request, page,backPage);
    	return getFileBasePath() + "list" + getActualArgumentType().getSimpleName()+"Check";
    }
}
