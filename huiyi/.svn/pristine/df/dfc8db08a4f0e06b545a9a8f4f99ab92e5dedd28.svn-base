package com.mvc.base.web;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.base.model.Advert;
import com.mvc.base.model.AdvertPosition;
import com.mvc.base.service.AdvertManager;
import com.mvc.base.service.AdvertPositionManager;
import com.mvc.framework.dao.PropertyFilter;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.web.PageController;
import com.mvc.security.SecurityConstants;
import com.mvc.security.model.User;
import com.mvc.security.service.UserManager;

@Controller
@RequestMapping("/admin/advert")
public class AdvertController extends PageController<Advert>  {

	@Autowired
	private AdvertManager advertManager;

	@Autowired
	private AdvertPositionManager advertPositionManager;

	@Autowired
	private UserManager userManager;

	@Override
	public PageManager<Advert> getEntityManager() {
		return advertManager;
	}

	@Override
	public String getFileBasePath() {
		return "base/";
	}

	@Override
	protected String handleSave(HttpServletRequest request, ModelMap modelMap, Advert t) throws Exception {
		Long uploadPersonId=(Long)request.getSession().getAttribute(SecurityConstants.USER_ID);
		t.setUploadDate(new Date());
		t.setUploadPersonId(uploadPersonId);
		if (t.getAdvertStatus()==null) {
			t.setAdvertStatus(Advert.ADVERT_STATUS_DRAFT);
		}else if (t.getAdvertStatus()==Advert.ADVERT_STATUS_CHECKED||t.getAdvertStatus()==Advert.ADVERT_STATUS_REVIEWED||t.getAdvertStatus()==Advert.ADVERT_STATUS_PUBLISH) {
			t.setAdvertStatus(Advert.ADVERT_STATUS_WAIT_CHECK);
		}
		advertManager.save(t);
		return "redirect:/admin/advert/edit/"+t.getObjectId()+"?message=success";
	}

	@RequestMapping("/check/page")
    public String checkPage(HttpServletRequest request,Integer backPage) throws Exception{
   	    PageSearch page  = preparePage(request);
   	    String advertStatus=""+Advert.ADVERT_STATUS_WAIT_CHECK;
	    page.getFilters().add(new PropertyFilter(Advert.class.getName(), "EQI_advertStatus",advertStatus));
        page.setSortProperty("uploadDate");
        page.setSortOrder("desc");
        getEntityManager().find(page);
        request.setAttribute("action", "page");
        request.setAttribute("positions",advertPositionManager.getAll());
        request.setAttribute("advertStatus", advertStatus);
        request.setAttribute("searchPath","/admin/advert/check/page");
        afterPage(request, page,backPage);
    	return getFileBasePath() + "list" + getActualArgumentType().getSimpleName()+"Check";
    }

	@RequestMapping("/audit/{objectId}")
    public String audit(HttpServletRequest request, HttpServletResponse response,@PathVariable Long objectId,int advertStatus){
		advertManager.executeAudit(objectId,advertStatus);
		advertManager.update(objectId);
    	request.setAttribute("positions",advertPositionManager.getAll());
		return "redirect:/admin/advert/check/page";
    }

	@Override
	protected String handlePage(HttpServletRequest request, PageSearch page) {
		request.setAttribute("positions",advertPositionManager.getAll());
		return super.handlePage(request, page);
	}

	@RequestMapping("/viewAdvert/{objectId}")
    public String viewAdvert(HttpServletRequest request,@PathVariable Long objectId){
        if (null != objectId) {
        	Advert advert =advertManager.getByObjectId(objectId);
            User modifier=userManager.getByObjectId((Long)request.getSession().getAttribute(SecurityConstants.USER_ID));
            request.setAttribute("entity", advert);
            request.setAttribute("modifier", modifier);
            request.setAttribute("positions",advertPositionManager.getAll());
        }
        return getFileBasePath() + "viewAdvert";
    }

    @Override
    public String handleEdit(HttpServletRequest request, HttpServletResponse response, Long objectId)throws Exception{
        Advert entity =advertManager.getByObjectId(objectId);
        request.setAttribute("entity",entity);
    	request.setAttribute("positions",advertPositionManager.getAll());
    	return getFileBasePath() + "edit" + getActualArgumentType().getSimpleName();
    }

    @RequestMapping("/selectAdvertPosition/{positionCode}")
    public String selectAdvertPosition(HttpServletRequest request,@PathVariable String positionCode,ModelMap modelMap) throws IOException{
		AdvertPosition ad=advertPositionManager.getAdvertPositionByPositionCode(positionCode);
		modelMap.addAttribute("result", true);
		modelMap.addAttribute("advertPosition", ad);
		return "jsonView";
    }
}
