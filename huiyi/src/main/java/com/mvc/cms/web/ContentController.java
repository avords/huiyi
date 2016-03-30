package com.mvc.cms.web;

import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.base.service.FileManager;
import com.mvc.cms.model.Channel;
import com.mvc.cms.model.Content;
import com.mvc.cms.service.ChannelManager;
import com.mvc.cms.service.ContentChannelManager;
import com.mvc.cms.service.ContentManager;
import com.mvc.framework.dao.PropertyFilter;
import com.mvc.framework.model.AbstractEntity;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.util.AjaxUtils;
import com.mvc.framework.util.FileUpDownUtils;
import com.mvc.framework.util.ListUtils;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.util.UploadFile;
import com.mvc.framework.web.PageController;
import com.mvc.util.ImageUtils;

/**
 * 内容
 */
@Controller
@RequestMapping("/admin/content")
public class ContentController extends PageController<Content>{
	@Autowired
	private ContentManager contentManager;
	@Autowired
	private ChannelManager channelManager;
	@Autowired
	private ContentChannelManager contentChannelManager;
	@Resource(name="fileManagerExpand")
    private FileManager fileManager;
	
	@Override
	public PageManager<Content> getEntityManager() {
		return contentManager;
	}
	
	@Override
	public String getFileBasePath() {
		return "cms/";
	}

	@Override
	protected String handleDelete(HttpServletRequest request, HttpServletResponse response, Long objectId)
			throws Exception {
		contentManager.delete(objectId);
		return "redirect:../page" + getMessage("common.base.deleted", request) + "&" + appendAjaxParameter(request);
	}
	
	protected String handlePage(HttpServletRequest request, PageSearch page) {
		page.getFilters().add(new PropertyFilter(Content.class.getName(),"EQI_deleted","0"));
		getEntityManager().findPart(page,"txtZh","txtEn");
		request.setAttribute("action", "page");
		return getFileBasePath() + "listContent";
	}
	
	@Override
	protected String handleEdit(HttpServletRequest request, HttpServletResponse response, Long objectId)
			throws Exception {
		//栏目编号获取
		//获取所有栏目
		List<Channel> allChannels = channelManager.getAll();
		List<Channel> haveChannels = null;
		try {
			haveChannels=contentChannelManager.getChannelsById(objectId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		@SuppressWarnings("unchecked")
		List<Channel> notHaveChannels = ListUtils.filter(allChannels, haveChannels);
		request.setAttribute("haveChannels", haveChannels);
		request.setAttribute("notHaveChannels", notHaveChannels);
		
		if (null != objectId) {
			Content entity = contentManager.getByObjectId(objectId);
			request.setAttribute("entity", entity);
		}
		return getFileBasePath() + "edit" + getActualArgumentType().getSimpleName();
	}
	
	@Override
	protected String handleSave(HttpServletRequest request, ModelMap modelMap, Content t) throws Exception {
		//保存Content
		contentManager.save(t);
		//保存栏目和文章()
		String menuIds[] = request.getParameterValues("menuId");
		
		if(menuIds != null && menuIds.length > 0){
			contentChannelManager.save(t.getObjectId(),menuIds);
		}
		return "redirect:edit/" + ((AbstractEntity) t).getObjectId() + getMessage("common.base.success", request);
	}
	
	@RequestMapping("/uploadContentPic")
    @ResponseBody
    public String uploadContentPic(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String result = "false";
        Map<String, Object> map = new HashMap<String, Object>();
        UploadFile uploadFile = FileUpDownUtils.getUploadFile(request, "uploadFile");
        String fileName = uploadFile.getFileName();
        if (StringUtils.isNotBlank(fileName) && fileName.endsWith(".jpg")) {
            byte[] fileData = FileUpDownUtils.getFileContent(uploadFile.getFile());
            String filePath = fileManager.saveProductImage(fileData, uploadFile.getFileName());
            BufferedImage image = ImageUtils.readImage(uploadFile.getFile().getAbsolutePath());
            result = "true";
            map.put("filePath", filePath.trim());
            if (image != null) {
                map.put("width", image.getWidth() + "");
                map.put("height", image.getHeight() + "");
            }
        } else {
            map.put("message", "图片格式必须为.jpg");
        }
        map.put("result", result);
        AjaxUtils.doAjaxResponseOfMap(response, map);
        return null;
    }
	
	@RequestMapping("/deleteContentPic")
    public String deleteContentPic(HttpServletRequest request, HttpServletResponse response, ModelMap map) throws Exception {
        String filePath = request.getParameter("filePath");
        boolean result = fileManager.deleteFile(filePath);
        map.addAttribute("result", result);
        return "jsonView";
    }
}
