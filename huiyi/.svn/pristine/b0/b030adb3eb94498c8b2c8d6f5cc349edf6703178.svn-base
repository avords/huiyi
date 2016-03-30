package com.mvc.member.service;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;

import com.mvc.framework.service.BaseService;
import com.mvc.member.model.Exhibition;

@Service
public class ExhibitionManager extends BaseService<Exhibition, Serializable>{
	
	public List<Exhibition> getBycompanyId(Long companyId) {
        String hql = "select A from "+Exhibition.class.getName()+" A where A.companyId=?";
        return super.searchBySql(hql, companyId);
    }
	
	/**
	 * 技术知识显示的展会列表
	 */
	@SuppressWarnings("unchecked")
	public List<Exhibition> getExhibitions(int size) {
		String hql = "select A from " + Exhibition.class.getName() + " A  order by A.startDate desc";
		Query query = getSession().createQuery(hql);
        query.setFirstResult(0);
        query.setMaxResults(size);
        return query.list();
	}
}
