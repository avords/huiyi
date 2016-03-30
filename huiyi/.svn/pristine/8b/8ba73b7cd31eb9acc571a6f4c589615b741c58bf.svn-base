package com.mvc.member.web;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.framework.service.PageManager;
import com.mvc.framework.web.PageController;
import com.mvc.member.model.Favorites;
import com.mvc.member.model.History;
import com.mvc.member.service.CompanyManager;
import com.mvc.member.service.FavoritesManager;
import com.mvc.member.service.HistoryManager;
import com.mvc.product.service.ProductManager;

@Controller
@RequestMapping("/favorites")
public class FavoritesController extends PageController<Favorites>{
	@Autowired
	private FavoritesManager favoritesManager;
	@Autowired
	private HistoryManager historyManager;
	@Autowired
	private ProductManager productManager;
	@Override
	public PageManager<Favorites> getEntityManager() {
		return favoritesManager;
	}

	@Override
	public String getFileBasePath() {
		return "member/";
	}
	
	@RequestMapping("/addFavorites/{objectId}")
	public String addFavorites(HttpServletRequest request, HttpServletResponse response,Integer type,@PathVariable Long objectId,Model model) {
			boolean flag=favoritesManager.checkEntityId(objectId);
			if (flag == true) {
				Favorites f=new Favorites();
				f.setType(type);
				f.setIsDelete(1);
				f.setFavoritesDate(new Date());
				if(type==0){
					f.setEntityId(objectId);
					f.setCompanyId(0l);
				}else{
					f.setCompanyId(objectId);
					f.setEntityId(0l);
				}
				favoritesManager.save(f);
				model.addAttribute("message", "添加成功！");
			}else{
				model.addAttribute("message", "已添加过，请勿重复添加！");
			}
		return "jsonView";
	}
	
	@RequestMapping("/deleteFavorites/{objectId}")
	public String deleteFavorites(HttpServletRequest request, HttpServletResponse response,@PathVariable Long objectId,Model model) {
		favoritesManager.executeAudit(objectId, 0);	
		model.addAttribute("message", "删除成功！");
		return "jsonView";
	}
	
	@RequestMapping("/addAllToFavorites")
	public String addAllToFavorites(HttpServletRequest request, HttpServletResponse response,Model model) {
		String objectIdStr = request.getParameter("objectIdStr");
		String[] objectIds = objectIdStr.split(",");
		 if(objectIds!=null&&objectIds.length>0){
			 for(String objectId:objectIds){
					boolean flag=favoritesManager.checkEntityId(Long.parseLong(objectId));
					if (flag == true){
						Favorites f=new Favorites();
						f.setType(0);
						f.setIsDelete(1);
						f.setCompanyId(productManager.getByObjectId(Long.parseLong(objectId)).getSupplierId());
						f.setEntityId(Long.valueOf(objectId));
						f.setFavoritesDate(new Date());
						favoritesManager.save(f);
						model.addAttribute("message", "全部添加成功！");
					}else{
						model.addAttribute("message", "已全部添加过！");
						 }
			 }
	}
	return "jsonView"; 
	}
	
	@RequestMapping("/deleteAllFavorites")
	public String deleteAllFavorites(HttpServletRequest request, HttpServletResponse response,Model model) {
		List<History> li=historyManager.getAllHistoryByType(0);
		for (History history : li) {
				history.setIsDelete(0);
				historyManager.save(history);
				model.addAttribute("message", "全部删除成功！");
			}
	return "jsonView";
	}
	
}
