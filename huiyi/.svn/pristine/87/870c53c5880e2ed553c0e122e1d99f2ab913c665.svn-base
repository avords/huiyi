package com.mvc.base.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mvc.base.model.SearchWords;
import com.mvc.base.service.SearchWordsManager;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.web.PageController;

@Controller
@RequestMapping("/admin/searchWords")
public class SearchWordsController extends PageController<SearchWords>{

	@Override
	public PageManager<SearchWords> getEntityManager() {
		return searchWordsManager;
	}

	@Autowired
	private SearchWordsManager searchWordsManager;
	
	@Override
	public String getFileBasePath() {
		return "base/";
	}
	
	@Override
	protected String handleSave(HttpServletRequest request, ModelMap modelMap, SearchWords t) throws Exception {
		t.setHasChinese(false);
		t.setHasEnglish(false);
		if(t.getNameZh()!=null){
			t.setHasChinese(true);
		}else if(t.getNameEn()!=null){
			t.setHasEnglish(true);
		}
		return super.handleSave(request, modelMap, t);
	}


}
