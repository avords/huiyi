package com.mvc.framework.service;

import java.io.Serializable;

import com.mvc.framework.model.I18nFilter;

public class I18nFilterManager<T extends I18nFilter, PK extends Serializable > extends BaseService<T, Serializable>{
	
	public void save(T entity){
		entity.setHasChinese(entity.hasChinese());
		entity.setHasEnglish(entity.hasEnglish());
		super.save(entity);
	}
	
	
//	public void find(final PageSearch page, final Integer language) {
//		if(language!=null){
//			if(HYConstants.LANGUAGE_CHANIESE == language){
//				page.getFilters().add(new PropertyFilter(getActualArgumentType().getName(),"hasChinese","1"));
//			}else if(HYConstants.LANGUAGE_ENGLISH == language){
//				page.getFilters().add(new PropertyFilter(getActualArgumentType().getName(),"hasChinese","1"));
//			}
//		}
//		
//		DetachedCriteria detachedCriteria = HibernateWebUtils.createCriteria(page);
//		Criteria criteria = detachedCriteria.getExecutableCriteria(getSession());
//		if (0 == page.getTotalCount()) {
//			criteria.setProjection(Projections.rowCount());
//			Object object = criteria.uniqueResult();
//			int total = object == null ? 0 : ((Number) object).intValue();
//			page.setTotalCount(total);
//		}
//		addOrder(page, criteria);
//		criteria.setProjection(null);
//		page.setList(criteria.setFirstResult(page.getBegin()).setMaxResults(page.getPageSize()).list());
//	} 
}
