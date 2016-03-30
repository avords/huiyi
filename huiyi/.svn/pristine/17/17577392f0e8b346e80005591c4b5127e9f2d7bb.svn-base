package com.mvc.product.service;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mvc.HYConstants;
import com.mvc.framework.dao.BaseHibernateDao;
import com.mvc.framework.dao.HibernateWebUtils;
import com.mvc.framework.model.BaseEntity;
import com.mvc.framework.model.ForeverEntity;
import com.mvc.framework.service.BaseService;
import com.mvc.framework.util.PageSearch;
import com.mvc.product.model.Sku;
import com.mvc.product.model.SkuCheck;

@Service
public class SkuManager extends BaseService<Sku, Long>{
    @Autowired
    private BaseHibernateDao<Sku, Serializable> baseHibernateDao;
    @Autowired
    private SkuAttributeManager skuAttributeManager;
    @Autowired
    private SkuCheckManager skuCheckManager;
    @Autowired
    private ProductManager productManager;

    public void save(Long memberId,Long productId,String[] skuObjectId, String[] skuNo, String[] skuStatus,String[] attributeValueIds, String[] sellPriceZh,
            String[] sellPriceEn, Integer status,boolean isCreate) {
        for(int i=0;i<attributeValueIds.length;i++){
            Sku sku = new Sku();
            sku.setDeleted(HYConstants.STATUS_NO);
            if(StringUtils.isNotBlank(skuObjectId[i])){
                sku.setObjectId(Long.parseLong(skuObjectId[i]));
                sku.setUpdatedBy(memberId);
                sku.setUpdatedOn(new Date());
            }else{
                sku.setCreatedBy(memberId);
                sku.setCreatedOn(new Date());
            }
            if(StringUtils.isNotBlank(skuNo[i])){
                sku.setSkuNo(skuNo[i]);
            }else{
                sku.setSkuNo(productId+"-"+(i+1));
            }
            sku.setProductId(productId);
            if(isCreate){
                sku.setStatus(status);
            }else{
                //判断sku价格是否有变化
                Long skuId = Long.parseLong(skuObjectId[i]);
                Integer statusTmp = getSkuStatus(skuId);
                if(statusTmp==Sku.PRODUCT_STATUS_WAIT_CHECK||statusTmp==Sku.PRODUCT_STATUS_IN_SALE){
                    sku.setStatus(skuStatus[i]==null?0:Integer.parseInt(skuStatus[i]));
                }else{
                    sku.setStatus(status);
                }
            }
            //属性值从小到大排列===========
            String[] attributeValues = attributeValueIds[i].split(",");
            Long[] attributeVs = new Long[attributeValues.length];
            for(int j=0;j<attributeValues.length;j++){
                attributeVs[j] = Long.parseLong(attributeValues[j]);
            }
            Arrays.sort(attributeVs);
            sku.setAttributeVals(StringUtils.join(attributeVs, ","));
            //end=====================================
            sku.setSellPriceZh(Double.parseDouble(sellPriceZh[i]));
            sku.setSellPriceEn(Double.parseDouble(sellPriceEn[i]));
            this.save(sku);
            //保存sku属性值id
            Long skuId = sku.getObjectId();
            String[] avi = attributeValueIds[i].split(",");
            skuAttributeManager.save(skuId,avi);
        }
    }
    public Long getCountByProductId(Long productId) {
        String hql = "select count(A) from "+Sku.class.getName()+" A where A.productId=? and A.deleted=0";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, productId);
        List<Long> list = query.list();
        return list.get(0);
    }
    public List<Sku> getByProductId(Long productId) {
        String hql = "select A from "+Sku.class.getName()+" A where A.productId=? and A.deleted=0";
        return super.searchBySql(hql, productId);
    }
    public List<Sku> getByProductId(Long productId,int status) {
        String hql = "select A from "+Sku.class.getName()+" A where A.productId=? and A.deleted=0 and A.status=?";
        return super.searchBySql(hql, productId,status);
    }
    public void searchSku(PageSearch page) {
        Object[] params = HibernateWebUtils.getQueryParameter(page.getFilters());
        String sql = "select distinct sku.product_id,sku.status,company.name_zh c_name_zh,sku.sku_no,product.name_zh p_name_zh,"
                + "concat(category1.name_zh,'>',category2.name_zh) category_name,sku.attribute_vals,"
                + "sku.sell_price_zh,sku.sell_price_en,(case product.platform when 1 then (select tmp.user_name from f_user tmp where tmp.object_id=sku.updated_by) when 2 then (select tmp.user_name from t_member tmp where tmp.object_id=sku.updated_by) else '其他端口' end) user_name,"
                + "sku.updated_on,sku.object_id sku_id,product.platform "
                + "from p_sku sku "
                + "left join p_product product on(sku.product_id=product.object_id) "
                + "left join t_company company on(product.supplier_id=company.object_id) "
                + "left join p_category category2 on(product.category_id=category2.object_id) "
                + "left join p_category category1 on(category2.parent_id=category1.object_id) "
                + "where 1=1";
        String whereSql = HibernateWebUtils.buildSql(page.getFilters());
        if (0 == page.getTotalCount()){
            String countSql = "select count(*) from (" + sql +whereSql+") a";
            SQLQuery query = getSession().createSQLQuery(countSql);
            HibernateWebUtils.setQueryParameter(query, params);
            List<Long> count = query.list();
            int total = count == null ? 0 : ((Number)count.get(0)).intValue();
            page.setTotalCount(total);
        }
        String orderSql = " order by sku.updated_on desc,sku.created_on desc";
        SQLQuery query = getSession().createSQLQuery(sql+whereSql+orderSql);
        HibernateWebUtils.setQueryParameter(query, params);
        List<Object[]> items = query.setFirstResult(page.getBegin()).setMaxResults(page.getPageSize()).list();
        page.setList(items);
    }
    @Transactional
    public void executeUpProducts(List<Long> skuIds) {
        Set<Long> productIds = new HashSet<Long>();
        for(Long skuId:skuIds){
            this.updateStatus(skuId, Sku.PRODUCT_STATUS_IN_SALE);
            Sku sku = this.getByObjectId(skuId);
            productIds.add(sku.getProductId());
        }
        for(Long productId:productIds){
            productManager.updateIsInSale(productId);
            productManager.updateMinAndMaxSellPrice(productId);
        }
    }
    @Transactional
    public void executeDownProducts(List<Long> skuIds) {
        Set<Long> productIds = new HashSet<Long>();
        for(Long skuId:skuIds){
            this.updateStatus(skuId, Sku.PRODUCT_STATUS_NOT_SALE);
            Sku sku = this.getByObjectId(skuId);
            productIds.add(sku.getProductId());
        }
        for(Long productId:productIds){
            productManager.updateIsInSale(productId);
            productManager.updateMinAndMaxSellPrice(productId);
        }
    }

    @Override
    public void delete(Serializable id) {
        Sku sku = getByObjectId(id);
        sku.setDeleted(HYConstants.STATUS_YES);
        String hql = "update "+Sku.class.getName()+" A set A.deleted=? where A.objectId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, HYConstants.STATUS_YES);
        query.setParameter(1, id);
        query.executeUpdate();
        productManager.updateIsInSale(sku.getProductId());
        productManager.updateMinAndMaxSellPrice(sku.getProductId());
    }
    @Transactional
    public void executeCheck(Long objectId, Integer status, SkuCheck sc) {
        //改变sku状态
        this.updateStatus(objectId,status);
        //记录审核历史
        skuCheckManager.save(sc);
    }
    private void updateStatus(Long objectId, Integer status) {
        String hql = "update "+Sku.class.getName()+" A set A.status=? where A.objectId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, status);
        query.setParameter(1, objectId);
        query.executeUpdate();
    }
    @Override
    public void save(Sku entity) {
        if (entity instanceof BaseEntity) {
            if (entity instanceof ForeverEntity) {
                ((ForeverEntity) entity).setDeleted(ForeverEntity.DELETED_NO);
            }
        }
        baseHibernateDao.saveOrUpdate(entity);
    }
    public Integer getSkuStatus(Long skuId) {
        String hql = "select A.status from "+Sku.class.getName()+" A where A.objectId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, skuId);
        List<Integer> list = query.list();
        if(list.size()>0){
            return list.get(0);
        }
        return null;
    }
	/**
	 * 根据产品id查询出最低价格用于首页推荐产品价格显示
	 */
	/*public Double getSellPriceZh(Long productId) {
		String hql = "select A from " + Sku.class.getName() + " A where A.productId=? order by A.sellPriceZh ";
		List<Sku> list = super.searchBySql(hql, productId);
		Sku sku = new Sku();
		if (list != null && list.size() > 0) {
			sku = list.get(0);
		}
		return sku.getSellPriceZh();
	}*/

}
