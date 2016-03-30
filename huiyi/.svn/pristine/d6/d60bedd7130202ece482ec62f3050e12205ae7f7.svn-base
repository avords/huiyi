package com.mvc.base.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.mvc.base.model.Area;
import com.mvc.base.service.AreaManager;
import com.mvc.framework.model.BaseTree;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.web.PageController;


@Controller
@RequestMapping("home/area")
public class AreaController  extends PageController<Area> {
	@Autowired
	private AreaManager areaManager;


	@Override
	public PageManager<Area> getEntityManager() {
		return areaManager;
	}

	@Override
	public String getFileBasePath() {
		return "base/";
	}


	@RequestMapping("areaTree")
	public String index(HttpServletRequest request) {
		request.setAttribute("root", Area.ROOT);
		return getFileBasePath() + "areaTree";
	}

	@RequestMapping("getChildren")
	public @ResponseBody String getChildren(Long objectId) throws Exception {
		List<Area> trees = new ArrayList<Area>();
		if(objectId==null){
			trees.add(Area.ROOT);
		}
		if(objectId!=null){
			trees = areaManager.getChildren(objectId);
		}
		return parseJsonTree(trees);
	}

	private String parseJsonTree(List<Area> trees) {
		StringBuilder children = new StringBuilder(140 * trees.size());
		children.append("[");
		int i=0;
		Gson gson = new GsonBuilder().create();
		for ( Area tree : trees) {
			if(i>0){
				children.append(",");
			}
			children.append(gson.toJson(tree));
			i++;
		}
		children.append("]");
		return children.toString();
	}

	@RequestMapping("getChildrenByCode/{code}")
	public String getChildrenByCode(ModelMap modelMap, @PathVariable String code) {
		boolean result = false;
		List<Area> list = areaManager.getChildrenByCode(code);
		modelMap.addAttribute("list", list);
		if (list.size()>0) {
			result = true;
		}
		modelMap.addAttribute("result", result);
		return "jsonView";
	}

	@RequestMapping("treeDelete/{treeId}")
	public String treeDelete(ModelMap modelMap, @PathVariable Long treeId) {
		Area tree = areaManager.getByObjectId(treeId);
		boolean result = false;
		if (tree != null) {
			areaManager.delete(tree);
			result = true;
		}
		modelMap.addAttribute("status", result);
		return "jsonView";
	}

	@RequestMapping(value="/treeSave")
	public String treeSave(ModelMap modelMap, Area entity) throws Exception {
		if (entity.getObjectId() != null) {
			Area old = areaManager.getByObjectId(entity.getObjectId());
			entity.setParentId(old.getParentId());
			entity.setLevel(old.getLevel());
			//SET CODE?
		}
		areaManager.save(entity);
		modelMap.remove("tree");
		modelMap.addAttribute("result", true);
		modelMap.addAttribute("entity", entity);
		return "jsonView";
	}

	@RequestMapping("getRoot")
	public String getRoot(ModelMap modelMap) {
		List<Area> areaList=areaManager.getChildren(BaseTree.ROOT);
		modelMap.addAttribute("allProvince", areaList);
		return "jsonView";
	}

	@RequestMapping("select/{targetId}")
	public String select(HttpServletRequest request, @PathVariable Long targetId) throws Exception {
		PageSearch page  = preparePage(request);
		handlePage(request, page);
		afterPage(request, page,0);
		request.setAttribute("targetId", targetId);
		return getFileBasePath() + "selectTree";
	}

	@RequestMapping("/update/{entity}")
	public void update(Area tree){
		areaManager.save(tree);
	}

	@SuppressWarnings("unused")
    private Area getTree(List<Area> all,Long treeId){
		for(Area tree : all){
			if(tree.getObjectId().equals(treeId)){
				return tree;
			}
		}
		return null;
	}

	@RequestMapping(value="/getChildren/{code}")
	public String getChildren(HttpServletRequest request, ModelMap modelMap,@PathVariable String code){
		List<Area> areas =areaManager.getChildrenByCode(code);
		modelMap.addAttribute("areas",areas);
		return "jsonView";
	}

	@RequestMapping(value="/getCurrent/{code}")
    public String getCurrent(HttpServletRequest request, ModelMap modelMap,@PathVariable String code){
        Area area =areaManager.getAreaByCode(code);
        modelMap.addAttribute("area",area);
        return "jsonView";
    }
	@RequestMapping(value="/getParent/{code}")
    public String getParent(HttpServletRequest request, ModelMap modelMap,@PathVariable String code){
        Area area =areaManager.getParentAreaByCode(code);
        modelMap.addAttribute("area",area);
        return "jsonView";
    }

}
