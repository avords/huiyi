package com.mvc.service.service;

import java.io.Serializable;

import org.hibernate.Query;
import org.springframework.stereotype.Service;

import com.mvc.framework.service.BaseService;

@Service
public class ServiceManager extends BaseService<com.mvc.service.model.Service, Serializable>{

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
	  
	  public void submitForCheck(Long objectId,Integer status) {
	        String hql = "update "+com.mvc.service.model.Service.class.getName()+" set status=? where objectId=?";
	        Query query = getSession().createQuery(hql);
	        query.setParameter(0, status);
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
}
