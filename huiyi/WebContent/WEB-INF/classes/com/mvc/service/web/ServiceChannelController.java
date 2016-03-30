package com.mvc.service.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.cms.model.Channel;
import com.mvc.framework.model.AbstractEntity;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.web.PageController;
import com.mvc.service.model.ServiceChannel;
import com.mvc.service.service.ServiceChannelManager;

@Controller
@RequestMapping("serviceChannel")
public class ServiceChannelController extends PageController<ServiceChannel>{

	@Autowired
	private ServiceChannelManager serviceChannelManager;
	
	@Override
	public PageManager<ServiceChannel> getEntityManager() {
		return serviceChannelManager;
	}
	
	@Override
	public String getFileBasePath() {
		return "service/";
	}
	
	@Override
	protected String handleSave(HttpServletRequest request, ModelMap modelMap, ServiceChannel t) throws Exception {
		String fullName="";
		if(t.getParentId()!=null){
			fullName=serviceChannelManager.getByObjectId(t.getParentId()).getFullName()+" > ";
			t.setCategoryLevel(2);
		}
		else {
			t.setCategoryLevel(1);
		}
		
		t.setFullName(fullName+t.getServiceNameZh());//拼接完整名称
		serviceChannelManager.save(t);// 保存对象
		Long objectId=((AbstractEntity) t).getObjectId();//获得当前对象的objectId
		this.updateChildFullName(objectId);//更新子栏目的完整名称
		return super.handleSave(request, modelMap, t);
}

	private void updateChildFullName(Long objectId){
		List<ServiceChannel> childServiceChannels=serviceChannelManager.getChildChannelByObjectId(objectId);
		for(ServiceChannel c : childServiceChannels){//如果有子栏目,就不断遍历更新
			String childFullName=serviceChannelManager.getByObjectId(c.getParentId()).getFullName()+" > "+c.getServiceNameZh();
			c.setFullName(childFullName);
			serviceChannelManager.save(c);
			Long currentId=((AbstractEntity) c).getObjectId();
			this.updateChildFullName(currentId);//递归调用
		}
	}
	
	 protected String handleEdit(HttpServletRequest request, HttpServletResponse response, Long objectId) throws Exception {
			List<ServiceChannel> serviceChannels=serviceChannelManager.getByCategoryLevel(1);
			request.setAttribute("serviceChannels", serviceChannels);
			
			return super.handleEdit(request, response, objectId);
	 }	
}
