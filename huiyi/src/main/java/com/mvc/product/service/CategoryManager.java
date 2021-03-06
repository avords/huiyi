package com.mvc.product.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

import com.mvc.HYConstants;
import com.mvc.framework.service.BaseService;
import com.mvc.product.model.Category;
@Service
public class CategoryManager extends BaseService<Category, Long>{

    private static final Logger LOGGER = Logger.getLogger(CategoryManager.class);

    public Long getChildrenCountByParentId(Long parentId) {
        //String sql = "select count(*) from "+Category.class.getName()+" A where A.parentId=? and A.status="+HYConstants.STATUS_YES;
    	//修改:去掉状态过滤条件，bug:1514
    	String sql = "select count(*) from "+Category.class.getName()+" A where A.parentId=?";
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
        String sql = "select A from "+Category.class.getName()+" A where A.parentId=? and A.status=? order by A.sortNo ";
        Session session = getSession();
        Query query = session.createQuery(sql);
        query.setParameter(0, parentId);
        query.setParameter(1, status);
        List<Category> list = query.list();
        return list;
    }
    public List<Category> getSecondCategoryByParentId(Long parentId) {
        String sql = "select A from "+Category.class.getName()+" A where A.parentId=? order by A.sortNo ";
        Session session = getSession();
        Query query = session.createQuery(sql);
        query.setParameter(0, parentId);
        List<Category> list = query.list();
        return list;
    }

    public List<Category> getAllCategory(Integer layer,Integer status) {
        String sql = "select A from "+Category.class.getName()+" A where A.layer=? and A.status=? order by A.sortNo ";
        Session session = getSession();
        Query query = session.createQuery(sql);
        query.setParameter(0, layer);
        query.setParameter(1, status);
        List<Category> list = query.list();
        return list;
    }
    public List<Category> getAllCategory(Integer layer) {
        String sql = "select A from "+Category.class.getName()+" A where A.layer=? order by A.sortNo ";
        Session session = getSession();
        Query query = session.createQuery(sql);
        query.setParameter(0, layer);
        List<Category> list = query.list();
        return list;
    }

    public String getCategoryNameByCategoryId(Long categoryId,Integer status) {
        String sql = "select concat(p2.name_zh,'>',p1.name_zh) from p_category p1 left join p_category p2 on(p1.parent_id=p2.object_id)"+
                " where p1.object_id=? and p1.status=?";
        Session session = getSession();
        SQLQuery query = session.createSQLQuery(sql);
        query.setParameter(0, categoryId);
        query.setParameter(1, status);
        List<String> list = query.list();
        if(list.size()>0){
            return list.get(0);
        }
        return null;
    }

	/**
	 * 首页显示的目录列表
	 * add by zengruhui
	 */
	public List<Category> getCategoryTreeByType(int type) {
		String sql = "select A from " + Category.class.getName() + " A where A.layer=1 and A.status=1 and A.type=? order by A.sortNo ";
		Session session = getSession();
		Query query = session.createQuery(sql);
		query.setParameter(0, type);
		List<Category> list = query.list();
		List<Category> listAllCategory = new ArrayList<Category>();
		Category category = null;
		List<Category> subList = null;
		for (int i = 0; i < list.size(); i++) {
			category = new Category();
			category = list.get(i);
			subList = getSecondCategoryByParentId(category.getObjectId(), HYConstants.STATUS_VALID);
			category.setChildren(subList);
			listAllCategory.add(category);
		}
		return listAllCategory;
	}

	public List<Category> getAllValid() {
		String sql = "select A from " + Category.class.getName() + " A where A.status= ? order by A.sortNo ";
		return searchBySql(sql, HYConstants.STATUS_VALID);
	}

	public List<Category> getAllValidByType(int type) {
		String sql = "select A from " + Category.class.getName() + " A where A.status= ? and type = ? order by A.sortNo ";
		return searchBySql(sql, HYConstants.STATUS_VALID,type);
	}

    public boolean isHaveValidChildren(Long objectId) {
        String sql = "select count(A) from " + Category.class.getName() + " A where A.parentId=? and A.status=1";
        Session session = getSession();
        Query query = session.createQuery(sql);
        query.setParameter(0, objectId);
        Long count = (Long) query.list().get(0);
        if(count>0){
            return true;
        }
        return false;
    }

}
