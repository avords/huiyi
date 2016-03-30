package com.mvc.service.service;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;

import com.mvc.base.model.Message;
import com.mvc.framework.service.BaseService;
import com.mvc.service.model.ServiceApply;

@Service
public class ServiceApplyManager extends BaseService<ServiceApply, Serializable>{

	  public void setDealStatus(Long objectId,Integer dealStatus) {
	        String hql = "update "+ServiceApply.class.getName()+" set dealStatus=? where objectId=?";
	        Query query = getSession().createQuery(hql);
	        query.setParameter(0, dealStatus);
	        query.setParameter(1, objectId);
	        query.executeUpdate();
	    }
	  
	  
	 /**
	 * 会员中心显示的汇医服务申请
	 */
	@SuppressWarnings("unchecked")
	public List<ServiceApply> getServiceApplies(int size,Long memberId) {
		String hql = "select A from " + ServiceApply.class.getName() +" A where A.memberId =" +memberId+ " AND A.status=1 order by A.createdOn desc";
		Query query = getSession().createQuery(hql);
        query.setFirstResult(0);
        query.setMaxResults(size);
        return query.list();
	}
}
