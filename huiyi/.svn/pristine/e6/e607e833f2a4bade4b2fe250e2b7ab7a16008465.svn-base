package com.mvc.cms.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.cms.model.Channel;
import com.mvc.cms.model.Content;
import com.mvc.cms.model.ContentChannel;
import com.mvc.cms.service.ChannelManager;
import com.mvc.cms.service.ContentChannelManager;
import com.mvc.framework.dao.PropertyFilter;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.web.PageController;
import com.mvc.framework.web.WebServiceResult;

//栏目管理
@Controller
@RequestMapping("/admin/channel")
public class ChannelController extends PageController<Channel>{

	@Autowired
	private ChannelManager channelManager;

	@Autowired
	private ContentChannelManager contentChannelManager;
	
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
		List<Channel> channels=channelManager.getAll();
		request.setAttribute("channels", channels);
		//page.getFilters().add(new PropertyFilter(Channel.class.getName(),"EQI_deleted", 0 +""));
		getEntityManager().find(page);
		List ls=page.getList();
		request.setAttribute("action", "page");
		return getFileBasePath() + "list" + getActualArgumentType().getSimpleName();
	}
	
	@Override
	protected String handleSave(HttpServletRequest request, ModelMap modelMap, Channel t) throws Exception {
		
		//判断级别
		//完整名称
		String fullName="";
		Integer parentLevel=0;
		if(t.getParentId()!=null&&t.getParentId()!=-1){
		parentLevel=channelManager.getprentLevelBy(t.getParentId());
			fullName = channelManager.getByObjectId(t.getParentId()).getFullName()+" > ";
		}
		t.setLevel(parentLevel+1);
		t.setFullName(fullName+t.getNameZh());
		t.setHasChinese(false);
		t.setHasEnglish(true);
		return super.handleSave(request, modelMap, t);
	}

	@Override
    protected String handleEdit(HttpServletRequest request, HttpServletResponse response, Long objectId) throws Exception {
		List<Channel> channels=channelManager.getAll();
		request.setAttribute("channels", channels);  
		return super.handleEdit(request, response, objectId);
	}
	
	@Override
    public String jsonDelete(HttpServletRequest request, HttpServletResponse response, @PathVariable Long objectId)
			throws Exception {
		WebServiceResult result = new WebServiceResult();
		//判断是否有所属文章且文章不被删除
		List<ContentChannel> ccs=contentChannelManager.getByChannelId(objectId);
		if (ccs.size()!=0) {
			result.setResult("false");
			result.setMessage("有隶属文章内容，不能删除！");
			return result.toJson();
		}
		
		//判断是否有子栏目
		List<Channel> channels=channelManager.getChildChannelByObjectId(objectId);
		if(channels.size()==0){
			try{
				channelManager.delete(objectId);
				result.setMessage("删除成功！");
				result.setResult("true");
			}catch(Exception e){
				result.setMessage("删除失败！");
				result.setResult("false");
			}
		}else{
			result.setMessage("有隶属子栏目,不能删除！");
			result.setResult("false");
		}

		return result.toJson();
	}
	
	@RequestMapping("/isNewPositionCode")
	public String isNewPositionCode(HttpServletRequest request,HttpServletResponse response,ModelMap map)
			throws Exception {
		boolean result = false;
		map.addAttribute("result", result);
		String positionCode=request.getParameter("positionCode");
		Long objId=0L;
		try {
			objId=Long.parseLong(request.getParameter("objId"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<Channel> channels=channelManager.isNewCodeByPositionCodeAndObjId(positionCode,objId);
		if(channels.size()==0){
			result=true;
			map.remove("result");
			map.addAttribute("result", result);
		}
		return "jsonView";
	}

}
