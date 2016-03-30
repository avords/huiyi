package com.mvc.service.service;

import java.io.Serializable;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.springframework.stereotype.Service;

import com.mvc.framework.dao.HibernateWebUtils;
import com.mvc.framework.service.I18nFilterManager;
import com.mvc.framework.util.PageSearch;

@Service
public class ServiceManager extends I18nFilterManager<com.mvc.service.model.Service, Serializable>{

	  public void isDeleted(Long objectId) {
	        String hql = "update "+com.mvc.service.model.Service.class.getName()+" set is_deleted=? where objectId=?";
	        Query query = getSession().createQuery(hql);
	        query.setParameter(0, 1);
	        query.setParameter(1, objectId);
	        query.executeUpdate();
	    }
	  public void notDeleted(Long objectId) {
		  String hql = "update "+com.mvc.service.model.Service.class.getName()+" set is_deleted=? where objectId=?";
	        Query query = getSession().createQuery(hql);
	        query.setParameter(0, 2);
	        query.setParameter(1, objectId);
	        query.executeUpdate();
	    }
	  
	  public void setStatus(Long objectId,Integer status) {
	        String hql = "update "+com.mvc.service.model.Service.class.getName()+" set status=? where objectId=?";
	        Query query = getSession().createQuery(hql);
	        query.setParameter(0, status);
	        query.setParameter(1, objectId);
	        query.executeUpdate();
	    }
	  
	public List<com.mvc.service.model.Service> getByTypeAndBusinessType(Integer type,String businessType) {
		 String sql ="select A from " + getActualArgumentType().getName() + " A  where A.status= " +com.mvc.service.model.Service.SERVICE_STATUS_PUBLISHED + "and A.type=" +type; 
		 if (StringUtils.isNotBlank(businessType)) {
			sql+=" and A.businessType="+Integer.parseInt(businessType);
		 }
         return searchBySql(sql);
	}
	
	public List<com.mvc.service.model.Service> getPublishServiceByType(Integer type) {
	     String sql = "select A from " + getActualArgumentType().getName() + " A  where A.status= " +com.mvc.service.model.Service.SERVICE_STATUS_PUBLISHED + "and A.type=" +type;
	     return searchBySql(sql);
	}
	
	public List<com.mvc.service.model.Service> getPublishServiceByBusinessType(Integer businessType) {
	     String sql = "select A from " + getActualArgumentType().getName() + " A  where A.status= " +com.mvc.service.model.Service.SERVICE_STATUS_PUBLISHED + "and A.businessType=" +businessType;
	     return searchBySql(sql);
	}
	
	public void searchServicesList(PageSearch page) {
		Object[] params = HibernateWebUtils.getQueryParameter(page.getFilters());
        String sql ="SELECT service.object_id,service.name_zh,service.main_picture,service.summary_zh,service.begin_date,service.end_date,service.business_type "
        		+" FROM t_service service WHERE service.status=5"; 
        String whereSql = HibernateWebUtils.buildSql(page.getFilters());
        if (0 == page.getTotalCount()){
            String countSql = "select count(*) from (" + sql +whereSql+") a";
            SQLQuery query = getSession().createSQLQuery(countSql);
            HibernateWebUtils.setQueryParameter(query, params);
            List<Long> count = query.list();
            int total = count == null ? 0 : ((Number)count.get(0)).intValue();
            page.setTotalCount(total);
        }
        String orderSql = " order by service.priority asc";
        SQLQuery query = getSession().createSQLQuery(sql+whereSql+orderSql);
        HibernateWebUtils.setQueryParameter(query, params);
        List<Object[]> items = query.setFirstResult(page.getBegin()).setMaxResults(page.getPageSize()).list();
        page.setList(items);
	}
}
