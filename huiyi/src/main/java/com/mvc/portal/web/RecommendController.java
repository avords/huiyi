package com.mvc.portal.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.framework.service.PageManager;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.web.PageController;
import com.mvc.member.model.Company;
import com.mvc.member.service.CompanyManager;
import com.mvc.portal.model.Recommend;
import com.mvc.portal.service.RecommendManager;
import com.mvc.product.model.Product;
import com.mvc.product.service.ProductManager;
import com.mvc.product.service.SkuManager;


@Controller
@RequestMapping("/admin/recommend")
public class RecommendController extends PageController<Recommend>{
	@Autowired
	private RecommendManager recommendManager;
	@Autowired
	private CompanyManager companyManager;
	@Autowired
	private SkuManager skuManager;
	@Autowired 
	private ProductManager productManager;
	
	@Override
	public PageManager<Recommend> getEntityManager() {
		return recommendManager;
	}

	@Override
	public String getFileBasePath() {
		return "portal/";
	}

	@RequestMapping("/editRecommend/{itemId}")
	protected String handleEdit(HttpServletRequest request, HttpServletResponse response, @PathVariable Long itemId)
			throws Exception {
		request.setAttribute("companies", companyManager.getPassCompany());
		request.setAttribute("products", productManager.getOnSellProducts());
		request.setAttribute("entity",recommendManager.getByItemId(itemId) );
		return getFileBasePath() + "edit" + getActualArgumentType().getSimpleName();
	}
	
	@Override
	protected String handleSave(HttpServletRequest request, ModelMap modelMap, Recommend t) throws Exception {
		Long typee=Long.parseLong(request.getParameter("biaoqian"));
		if(typee==1){
			t.setType(2);//typee==1表示前台传来的是产品，所以将recommend中type设置为2.
		}else{
			t.setType(1);
		}
		getManager().save(t);
		return "redirect:editRecommend/" +t.getItemId() + getMessage("common.base.success", request)
				+ "&" + appendAjaxParameter(request) + "&action=" + request.getParameter("action");
	}
	
	
	@Override
	protected String handlePage(HttpServletRequest request, PageSearch page) {
		page.setSortProperty("priority");
        page.setSortOrder("asc");
		getEntityManager().find(page);
		List<Recommend> ls=page.getList();
		for (Recommend recommend : ls) {
			Recommend rec=recommendManager.getByItemId(recommend.getItemId());
			if (rec.getType()==1){
				Company company = companyManager.getByObjectId(rec.getItemId());
				recommend.setName(company.getNameZh());
				
			}else{
				Product product=productManager.getByObjectId(rec.getItemId());
				recommend.setName(product.getNameZh());
			}
		}
		request.setAttribute("action", "page");
		return getFileBasePath() + "list" + getActualArgumentType().getSimpleName();
	}
	
	@Override
	protected String handleDelete(HttpServletRequest request, HttpServletResponse response, Long itemId)
			throws Exception {
		recommendManager.deleteByItemId(itemId);
		return "redirect:../page" + getMessage("common.base.deleted", request) + "&" + appendAjaxParameter(request);
	}
	
}
