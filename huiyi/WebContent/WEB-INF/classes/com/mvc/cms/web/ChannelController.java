package com.mvc.cms.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.cms.model.Channel;
import com.mvc.cms.service.ChannelManager;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.web.PageController;

//栏目管理
@Controller
@RequestMapping("channel")
public class ChannelController extends PageController<Channel>{

	@Autowired
	private ChannelManager channelManager;

	@Override
	public PageManager<Channel> getEntityManager() {
		return channelManager;
	}

	@Override
	public String getFileBasePath() {
		return "cms/";
	}

	@Override
    protected String handlePage(HttpServletRequest request, PageSearch page) {
		return super.handlePage(request, page);
	}
	
	@Override
	protected String handleSave(HttpServletRequest request, ModelMap modelMap, Channel t) throws Exception {
		
		//判断级别
		Integer parentLevel=0;
		if(t.getParentId()!=null){
		parentLevel=channelManager.getprentLevelBy(t.getParentId());
		}
		t.setLevel(parentLevel+1);
		
		//完整名称
		String fullName="";
		if(t.getParentId()!=null){
			fullName=channelManager.getByObjectId(t.getParentId()).getFullName()+" > ";
		}
		t.setFullName(fullName+t.getName());
		
		return super.handleSave(request, modelMap, t);
	}

	@Override
    protected String handleEdit(HttpServletRequest request, HttpServletResponse response, Long objectId) throws Exception {
		       
		return super.handleEdit(request, response, objectId);
	}

}
