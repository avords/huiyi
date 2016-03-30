package com.mvc.base.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.web.PageController;
import com.mvc.base.model.Country;
import com.mvc.base.service.CountryManager;

@Controller
@RequestMapping("/admin/country")
public class CountryController extends PageController<Country> {

	private static final String BASE_DIR = "base/";

	@Autowired
	private CountryManager countryManager;

	@Override
	public PageManager<Country> getEntityManager() {
		return countryManager;
	}

	@Override
	public String getFileBasePath() {
		return this.BASE_DIR;
	}
}
