package com.mvc.business.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.business.model.Standard;
import com.mvc.business.model.StandardCategory;
import com.mvc.business.service.StandardCategoryManager;
import com.mvc.business.service.StandardManager;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.web.PageController;
import com.mvc.product.model.Category;
import com.mvc.product.service.CategoryManager;

@Controller
@RequestMapping("/admin/standard")
public class StandardController extends PageController<Standard> {
	private static final String BASE_DIR = "business/";

	@Autowired
	private StandardManager standardManager;
	
	@Autowired
	private StandardCategoryManager standardCategoryManager;

	@Autowired
	private CategoryManager categoryManager;
	
	@Override
	public PageManager<Standard> getEntityManager() {
		return this.standardManager;
	}

	@Override
	public String getFileBasePath() {
		return BASE_DIR;
	}

	@RequestMapping(value = "/configStandardCategory/{objectId}")
	public String configStandardCategory(HttpServletRequest request, @PathVariable Long objectId) throws Exception {
		Standard standard = standardManager.getByObjectId(objectId);
		// 根据标准id获得该id下面的已存在产品分类id
		List<StandardCategory> selected = standardCategoryManager.getCategoryByStandardId(objectId);
		// 所有产品二级目录，用来增加
		List<Category> categories = categoryManager.getAllValid();
		List<Category> seconds = new ArrayList<Category>();
		for (Category ca : categories) {
			if(ca.getLayer() == 2){//第二级
				Category parentCate = getByParentId(categories, ca.getParentId());
				if (parentCate != null) {
					ca.setNameZh(parentCate.getNameZh() + " > " + ca.getNameZh());
				}
				ca.setStatus(0);//未选择
				for(StandardCategory standardCategory : selected){
					if(standardCategory.getCategoryId().equals(ca.getObjectId())){
						ca.setStatus(1);//已选择
					}
				}
				seconds.add(ca);
			}
		}
		request.setAttribute("standard", standard);
		request.setAttribute("categories", seconds);
		return BASE_DIR + "configStandardCategory";
	}
	
	private Category getByParentId(List<Category> categories, long parentId){
		for(Category category : categories){
			if(category.getObjectId()==parentId){
				return category; 
			}
		}
		return null;
	}
	
	@RequestMapping("/saveStandardCategory/{objectId}")
	public String addStandardCategory(HttpServletRequest request, @PathVariable Long objectId) throws Exception {
		String[] categoryIds = request.getParameterValues("categoryId");
		standardCategoryManager.save(objectId,categoryIds);
		request.setAttribute("message", "操作成功!");
		return "redirect:../configStandardCategory/" + objectId + getMessage("common.base.success", request)
		+ "&" + appendAjaxParameter(request) + "&action=" + request.getParameter("action");
	}

	/**
	 * 删除标准，关联该标准下面的产品分类也删除
	 */
	@Override
	protected String handleDelete(HttpServletRequest request, HttpServletResponse response, Long objectId)
			throws Exception {
		standardCategoryManager.deleteByStandardId(objectId);
		return super.handleDelete(request, response, objectId);
	}

	
	@Override
	protected String handleSave(HttpServletRequest request, ModelMap modelMap, Standard t) throws Exception {
		t.setHasChinese(t.hasChinese());
		t.setHasEnglish(t.hasEnglish());
		return super.handleSave(request, modelMap, t);
	}
		
}