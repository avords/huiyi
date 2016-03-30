package com.mvc.business.service;

import java.io.Serializable;
import java.util.List;
import org.springframework.stereotype.Service;
import com.mvc.business.model.StandardCategory;
import com.mvc.framework.service.BaseService;

@Service
public class StandardCategoryManager extends BaseService<StandardCategory, Serializable> {

	/**
	 * 根据标准id，查询出对应的产品分类id列表
	 */
	public List<StandardCategory> getCategoryByStandardId(Long standardId) {
		String sql = "select A from " + StandardCategory.class.getName() + " A where A.standardId = ? ";
		return this.searchBySql(sql, standardId);
	}

	/**
	 * 根据标准id，删除对应的产品分类id列表
	 */
	public int deleteByStandardId(Long standardId) {
		return this.deleteEntitiesByWhere(StandardCategory.class, " standardId = ? ", standardId);
	}
	
	public void save(Long standardId, String[] categoryIds){
		deleteByStandardId(standardId);
		for(String categoryId : categoryIds){
			StandardCategory standardCategory = new StandardCategory();
			standardCategory.setStandardId(standardId);
			standardCategory.setCategoryId(Long.parseLong(categoryId));
			save(standardCategory);
		}
	}
}