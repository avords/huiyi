package com.mvc.business.service;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;

import com.mvc.business.model.Standard;
import com.mvc.business.model.StandardCategory;
import com.mvc.framework.service.BaseService;

@Service
public class StandardManager extends BaseService<Standard, Serializable> {

    public List<Standard> getByCategoryId(Long categoryId) {
        String hql="select A from "+Standard.class.getName()+" A,"+StandardCategory.class.getName()+" B where A.objectId=B.standardId and B.categoryId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, categoryId);
        return query.list();
    }

}