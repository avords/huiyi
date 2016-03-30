package com.mvc.cms.web;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.cms.model.Channel;
import com.mvc.cms.model.Content;
import com.mvc.cms.service.ChannelManager;
import com.mvc.cms.service.ContentManager;
import com.mvc.component.file.BaseFileManager;
import com.mvc.config.ApplicationConfig;
import com.mvc.framework.FrameworkConstants;
import com.mvc.framework.dao.PropertyFilter;
import com.mvc.framework.model.AbstractEntity;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.util.FileUpDownUtils;
import com.mvc.framework.util.ListUtils;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.util.UploadFile;
import com.mvc.framework.web.FrameworkFactory;
import com.mvc.framework.web.PageController;
import com.mvc.security.SecurityConstants;
import com.mvc.security.model.Role;
import com.mvc.security.model.User;
import com.mvc.security.service.RoleManager;
import com.mvc.security.service.UserManager;

/**
 * 内容
 */
@Controller
@RequestMapping("/content")
public class ContentController extends PageController<Content>{
	@Autowired
	private ContentManager contentManager;
	@Autowired
	private ChannelManager channelManager;

	@Autowired
	private RoleManager roleManager;
	@Autowired
	private UserManager userManager;

	@Override
	public PageManager<Content> getEntityManager() {
		return contentManager;
	}
	@Override
	public String getFileBasePath() {
		return "cms/";
	}

	protected String handlePage(HttpServletRequest request, PageSearch page) {
		
		return getFileBasePath() + "list" + getActualArgumentType().getSimpleName();
	}
	
	protected String handleEdit(HttpServletRequest request, HttpServletResponse response, Long id) throws Exception {
		
		return getFileBasePath() + "edit" + getActualArgumentType().getSimpleName();
	}
	
	protected String handleView(HttpServletRequest request, HttpServletResponse response, Long objectId)
			throws Exception {
		
		return getFileBasePath() + "view" + getActualArgumentType().getSimpleName();
	}
	
	protected String handleSave(HttpServletRequest request, ModelMap modelMap, Content t) throws Exception {
		
		return "redirect:edit/" + ((AbstractEntity) t).getObjectId() + getMessage("common.base.success", request) ;
	}

	protected String handleDelete(HttpServletRequest request, HttpServletResponse response, Long objectId)
			throws Exception {
		contentManager.delete(objectId);;
		return "redirect:../page" + getMessage("common.base.deleted", request) + "&" + appendAjaxParameter(request);
	}
	
}
