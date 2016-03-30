package com.mvc.product.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

import com.mvc.framework.service.BaseService;
import com.mvc.product.model.AttributeVal;

@Service
public class AttributeValManager extends BaseService<AttributeVal, Long>{

    public List<AttributeVal> getByAttributeId(Long attributeId) {
        String hql = "select A from "+AttributeVal.class.getName()+" A where A.attributeId=? order by A.sortNo asc";
        Session session = getSession();
        Query query = session.createQuery(hql);
        query.setParameter(0, attributeId);
        List<AttributeVal> list = query.list();
        return list;
    }

}
