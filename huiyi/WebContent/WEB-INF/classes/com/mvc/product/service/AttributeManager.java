package com.mvc.product.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

import com.mvc.HYConstants;
import com.mvc.framework.service.BaseService;
import com.mvc.product.model.Attribute;

@Service
public class AttributeManager extends BaseService<Attribute, Long>{
    private static final Logger LOGGER = Logger.getLogger(AttributeManager.class);

    public List<Attribute> getByCategoryId(Long categoryId, Integer status) {
        String hql = "select A from "+Attribute.class.getName()+" A where A.categoryId=? and A.status=?";
        return super.searchBySql(hql, categoryId,status);
    }

    public void updateSortNoByObjectId(String objectIds, String sortNos) {
        String[] ids = objectIds.split(",");
        String[] nos = sortNos.split(",");
        for(int i =0; i<ids.length;i++){
            try{
                Long objectId = Long.parseLong(ids[i]);
                Double sortNo = Double.parseDouble(nos[i]);
                this.updateSortNo(objectId,sortNo);
            }catch (Exception e){
                LOGGER.error(e);
            }
        }
    }
    private void updateSortNo(Long objectId, Double sortNo) {
        String hql = "update "+Attribute.class.getName()+" A set A.sortNo=? where A.objectId=?";
        Session session = getSession();
        Query query = session.createQuery(hql);
        query.setParameter(0, sortNo);
        query.setParameter(1, objectId);
        query.executeUpdate();
    }

    public List<Attribute> getSkuAttributeByCategoryId(Long categoryId) {
        String hql = "select A from "+Attribute.class.getName()+" A where A.categoryId=? and A.status=? and A.type=?";
        return super.searchBySql(hql, categoryId,HYConstants.STATUS_VALID,Attribute.TYPE_SKU);
    }

    public List<Attribute> getOtherAttributeByCategoryId(Long categoryId) {
        String hql = "select A from "+Attribute.class.getName()+" A where A.categoryId=? and A.status=? and A.type!=?";
        return super.searchBySql(hql, categoryId,HYConstants.STATUS_VALID,Attribute.TYPE_SKU);
    }
}
