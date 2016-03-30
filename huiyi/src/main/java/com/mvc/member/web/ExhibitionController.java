package com.mvc.member.web;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.framework.dao.PropertyFilter;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.web.PageController;
import com.mvc.member.model.Company;
import com.mvc.member.model.Exhibition;
import com.mvc.member.service.CompanyManager;
import com.mvc.member.service.ExhibitionManager;

@Controller
@RequestMapping("/admin/exhibition")
public class ExhibitionController extends PageController<Exhibition> {

	private static final String BASE_DIR = "member/";

	@Autowired
	private ExhibitionManager exhibitionManager;
	
	@Autowired
	private CompanyManager companyManager;

	@Override
	public PageManager<Exhibition> getEntityManager() {
		return exhibitionManager;
	}

	@Override
	public String getFileBasePath() {
		return this.BASE_DIR;
	}
	
	@Override
    public String handleEdit(HttpServletRequest request, HttpServletResponse response, Long objectId)throws Exception{
		Exhibition entity =exhibitionManager.getByObjectId(objectId);
		if (entity!=null) {
			Company company =companyManager.getByObjectId(entity.getCompanyId());
			entity.setCompanyName(company.getNameZh());
		}
        request.setAttribute("entity",entity);
    	return getFileBasePath() + "edit" + getActualArgumentType().getSimpleName();
    }
	
	@Override
	protected String handlePage(HttpServletRequest request, PageSearch page) {
		String attendDate=request.getParameter("attendDate");
		if (attendDate != null && !attendDate.equals("")) {
			page.getFilters().add(new PropertyFilter(Exhibition.class.getName(), "LED_startDate", attendDate));
			page.getFilters().add(new PropertyFilter(Exhibition.class.getName(), "GED_endDate", attendDate));
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			try {
				request.setAttribute("attendDate", df.parse(attendDate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
        page.setSortProperty("startDate");
        page.setSortOrder("desc");
        getEntityManager().find(page);
		List<Exhibition> list=page.getList();
		if (list.size()>0) {
			for (Exhibition ex : list) {
				Company company =companyManager.getByObjectId(ex.getCompanyId());
				ex.setCompanyName(company.getNameZh());
			}
		}
		page.setList(list);
		request.setAttribute("action", "page");
		return getFileBasePath() + "list" + getActualArgumentType().getSimpleName();
	}
	
	@Override
	protected String handleSave(HttpServletRequest request, ModelMap modelMap, Exhibition t) throws Exception {
		super.handleSave(request, modelMap, t);
		return "redirect:/admin/exhibition/edit/"+t.getObjectId()+"?message=success";
	}
}
