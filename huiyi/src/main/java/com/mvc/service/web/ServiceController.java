package com.mvc.service.web;

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
import com.mvc.service.model.ServiceCategory;
import com.mvc.service.service.ServiceCategoryManager;
import com.mvc.service.service.ServiceManager;

@Controller
@RequestMapping("/admin/service")
public class ServiceController extends PageController<Service> {

	@Autowired
	private ServiceManager serviceManager;
	@Autowired
	private ServiceCategoryManager serviceCategoryManager;

	@Override
	public PageManager<Service> getEntityManager() {
		return serviceManager;
	}

	@Override
	public String getFileBasePath() {
		return "service/";
	}

	@Override
	protected String handleSave(HttpServletRequest request, ModelMap modelMap, Service service) throws Exception {
		serviceManager.save(service);
		Long objectId = service.getObjectId();
		String[] categorys = request.getParameterValues("categorys");

		if (categorys == null) {
			serviceCategoryManager.deleteByServiceId(objectId);
			return "redirect:/admin/service/edit/" + service.getObjectId() + getMessage("common.base.success", request);
		} else {
			serviceCategoryManager.deleteByServiceId(objectId);
			for (int i = 0; i < categorys.length; i++) {
				ServiceCategory sc = new ServiceCategory();
				;
				sc.setCategoryId(Long.parseLong(categorys[i]));
				sc.setServiceId(objectId);
				serviceCategoryManager.save(sc);
			}

			return "redirect:/admin/service/edit/" + service.getObjectId() + getMessage("common.base.success", request);
		}
	}

	@Override
	protected String handleEdit(HttpServletRequest request, HttpServletResponse response, Long objectId) throws Exception {
		return super.handleEdit(request, response, objectId);
	}

	@Override
	protected String handlePage(HttpServletRequest request, PageSearch page) {
		return super.handlePage(request, page);
	}

	@RequestMapping("/submitForCheck/{objectId}")
	public String submitForCheck(HttpServletRequest request, HttpServletResponse response, @PathVariable Long objectId) throws Exception {
		serviceManager.setStatus(objectId, Service.SERVICE_STATUS_WAIT_CHECK);
		serviceManager.update(objectId);
		return "redirect:/admin/service/page" + getMessage("common.base.success", request) + "&" + appendAjaxParameter(request);
	}

	@RequestMapping("/submitForPublish/{objectId}")
	public String submitForPublish(HttpServletRequest request, HttpServletResponse response, @PathVariable Long objectId) throws Exception {
		serviceManager.setStatus(objectId, Service.SERVICE_STATUS_PUBLISHED);
		serviceManager.update(objectId);
		return "redirect:/admin/service/page" + getMessage("common.base.success", request) + "&" + appendAjaxParameter(request);
	}
	
	@RequestMapping("/handelStatus/{objectId}")
	public String audit(HttpServletRequest request, HttpServletResponse response, @PathVariable Long objectId, int status) {
		serviceManager.setStatus(objectId, status);
		serviceManager.update(objectId);
		status = serviceManager.getByObjectId(objectId).getStatus();
		String url = "";
		if (status == Service.SERVICE_STATUS_PASS || status == Service.SERVICE_STATUS_UNPASS) {
			url = "redirect:/admin/service/check";
		} else if (status == Service.SERVICE_STATUS_PUBLISHED) {
			url = "redirect:/admin/service/publish";
		} else if (status == Service.SERVICE_STATUS_OFFLINE) {
			url = "redirect:/admin/service/offline";
		}
		return url;
	}

	@RequestMapping("/publish")
	public String publishPage(HttpServletRequest request, Integer backPage) throws Exception {
		PageSearch page = preparePage(request);
		String status = "" + Service.SERVICE_STATUS_PASS;
		page.getFilters().add(new PropertyFilter(Service.class.getName(), "EQI_status", status));
		getEntityManager().find(page);
		request.setAttribute("action", "page");
		request.setAttribute("status", status);
		afterPage(request, page, backPage);
		return getFileBasePath() + "list" + getActualArgumentType().getSimpleName() + "Publish";
	}

	@RequestMapping("/check")
	public String checkPage(HttpServletRequest request, Integer backPage) throws Exception {
		PageSearch page = preparePage(request);
		String status = "" + Service.SERVICE_STATUS_WAIT_CHECK;
		page.getFilters().add(new PropertyFilter(Service.class.getName(), "EQI_status", status));
		getEntityManager().find(page);
		request.setAttribute("action", "page");
		request.setAttribute("status", status);
		afterPage(request, page, backPage);
		return getFileBasePath() + "list" + getActualArgumentType().getSimpleName() + "Check";
	}

	@RequestMapping("/offline")
	public String offline(HttpServletRequest request, Integer backPage) throws Exception {
		PageSearch page = preparePage(request);
		String status = "" + Service.SERVICE_STATUS_PUBLISHED;
		page.getFilters().add(new PropertyFilter(Service.class.getName(), "EQI_status", status));
		getEntityManager().find(page);
		request.setAttribute("action", "page");
		request.setAttribute("status", status);
		afterPage(request, page, backPage);
		return getFileBasePath() + "list" + getActualArgumentType().getSimpleName() + "Offline";
	}

	// 查看服务
	@RequestMapping("/viewService/{objectId}")
	public String viewService(HttpServletRequest request, @PathVariable Long objectId) {
		if (null != objectId) {
			Service service = serviceManager.getByObjectId(objectId);
			request.setAttribute("entity", service);
		}
		return getFileBasePath() + "viewService";
	}
}
