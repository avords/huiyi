package com.mvc.business.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

import com.mvc.HYConstants;
import com.mvc.business.model.MallCategory;
import com.mvc.business.model.MallCategoryMapping;
import com.mvc.framework.service.I18nFilterManager;
import com.mvc.product.model.Category;

@Service
public class MallCategoryManager extends I18nFilterManager<MallCategory, Long> {

	public void updateSortNoByObjectId(String objectIds, String sortNos) {
		String[] ids = objectIds.split(",");
		String[] nos = sortNos.split(",");
		for (int i = 0; i < ids.length; i++) {
			try {
				Long objectId = Long.parseLong(ids[i]);
				Double sortNo = Double.parseDouble(nos[i]);
				this.updateSortNo(objectId, sortNo);
			} catch (Exception e) {
			}
		}
	}

	private void updateSortNo(Long objectId, Double sortNo) {
		String hql = "update " + Category.class.getName() + " A set A.sortNo=? where A.objectId=?";
		Session session = getSession();
		Query query = session.createQuery(hql);
		query.setParameter(0, sortNo);
		query.setParameter(1, objectId);
		query.executeUpdate();
	}
	
	public List<MallCategory> getMappedByType(Integer type){
		String sql = "select distinct A from " + MallCategory.class.getName() + " A ,"  + MallCategoryMapping.class.getName() + " B, "
				+ Category.class.getName() +  " C where A.objectId = B.mallCategoryId and B.categoryId = C.objectId and C.type = ? and C.status = ?"; 
		return searchBySql(sql, type, HYConstants.STATUS_VALID);
	}

}
