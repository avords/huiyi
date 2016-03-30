package com.mvc.product.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

import com.mvc.HYConstants;
import com.mvc.framework.service.BaseService;
import com.mvc.product.model.Category;
@Service
public class CategoryManager extends BaseService<Category, Long>{

    private static final Logger LOGGER = Logger.getLogger(CategoryManager.class);
    public Long getChildrenCountByParentId(Long parentId) {
        String sql = "select count(*) from "+Category.class.getName()+" A where A.parentId=? and A.status="+HYConstants.STATUS_YES;
        Session session = getSession();
        Query query = session.createQuery(sql);
        query.setParameter(0, parentId);
        List<Long> list = query.list();
        return list.get(0);
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
        String hql = "update "+Category.class.getName()+" A set A.sortNo=? where A.objectId=?";
        Session session = getSession();
        Query query = session.createQuery(hql);
        query.setParameter(0, sortNo);
        query.setParameter(1, objectId);
        query.executeUpdate();
    }

    public void updateStatus(Long objectId, Integer status) {
        String hql = "update "+Category.class.getName()+" A set A.status=? where A.objectId=?";
        Session session = getSession();
        Query query = session.createQuery(hql);
        query.setParameter(0, status);
        query.setParameter(1, objectId);
        query.executeUpdate();
    }

    public List<Category> getSecondCategoryByParentId(Long parentId, Integer status) {
        String sql = "select A from "+Category.class.getName()+" A where A.parentId=? and A.status=?";
        Session session = getSession();
        Query query = session.createQuery(sql);
        query.setParameter(0, parentId);
        query.setParameter(1, status);
        List<Category> list = query.list();
        return list;
    }

    public List<Category> getAllCategory(Integer layer,Integer status) {
        String sql = "select A from "+Category.class.getName()+" A where A.layer=? and A.status=?";
        Session session = getSession();
        Query query = session.createQuery(sql);
        query.setParameter(0, layer);
        query.setParameter(1, status);
        List<Category> list = query.list();
        return list;
    }

}
