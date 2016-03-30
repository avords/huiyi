package com.mvc.business.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mvc.business.model.MallCategoryMapping;
import com.mvc.framework.service.BaseService;

@Service
public class MallCategoryMappingManager extends BaseService<MallCategoryMapping, Long>{
	
	
	public List<MallCategoryMapping> getMallCategoryMappingByMallCategoryId(Long mallCategoryId) {
		String sql = "select A from " + MallCategoryMapping.class.getName() + " A where A.mallCategoryId = ? ";
		return this.searchBySql(sql, mallCategoryId);
	}

	
	public int deleteByMallCategoryId(Long mallCategoryId) {
		return this.deleteEntitiesByWhere(MallCategoryMapping.class, "mallCategoryId=?", mallCategoryId);
	}
	
	public void save(Long mallCategoryId, String[] categoryIds){
		deleteByMallCategoryId(mallCategoryId);
		for(String categoryId : categoryIds){
			MallCategoryMapping standardCategory = new MallCategoryMapping();
			standardCategory.setMallCategoryId(mallCategoryId);
			standardCategory.setCategoryId(Long.parseLong(categoryId));
			save(standardCategory);
		}
	}
}
