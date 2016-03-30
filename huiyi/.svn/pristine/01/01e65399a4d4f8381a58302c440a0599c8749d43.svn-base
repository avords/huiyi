package com.mvc.security.web;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.framework.service.PageManager;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.web.PageController;
import com.mvc.security.model.User;
import com.mvc.security.service.UserManager;

@Controller
@RequestMapping("/selectSingleUser")
public class SelectSingleUserController extends PageController<User> {
	
	private static final String BASE_DIR = "security/";
	@Autowired
	private UserManager userManager;

	@Override
	public PageManager<User> getEntityManager() {
		return userManager;
	}

	@Override
	public String getFileBasePath() {
		return BASE_DIR;
	}
	
	@Override
	protected String handlePage(HttpServletRequest request, PageSearch page) {
		super.handlePage(request, page);
		return getFileBasePath() + "selectSingleUser";
	}
}
