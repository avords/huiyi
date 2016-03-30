package com.mvc.product.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.framework.service.BaseService;
import com.mvc.product.model.AttributeVal;
import com.mvc.product.model.SkuAttributeAttached;

@Service
public class SkuAttributeAttachedManager extends BaseService<SkuAttributeAttached, Long>{

    @Autowired
    private AttributeValManager attributeValManager;
    public void save(Long productId, String[] attributeValIds, String[] attributeValNameZh, String[] attributeValNameEn) {
        //先清空
        this.deleteByWhere("productId="+productId);
        if(attributeValIds!=null){
            for(int i=0;i<attributeValIds.length;i++){
                Long attributeValId = Long.parseLong(attributeValIds[i]);
                AttributeVal avl = attributeValManager.getByObjectId(attributeValId);
                SkuAttributeAttached sa = new SkuAttributeAttached();
                sa.setProductId(productId);
                sa.setAttributeId(avl.getAttributeId());
                sa.setAttributeValId(attributeValId);
                sa.setNameZh(StringUtils.isBlank(attributeValNameZh[i])?avl.getNameZh():attributeValNameZh[i]);
                sa.setNameEn(StringUtils.isBlank(attributeValNameEn[i])?avl.getNameEn():attributeValNameEn[i]);
                this.save(sa);
            }
        }
    }
    public SkuAttributeAttached getByProductIdAndAttributeValId(Long productId, Long attributeValueId) {
        String hql = "select A from "+SkuAttributeAttached.class.getName()+" A where A.productId=? and A.attributeValId=?";
        List<SkuAttributeAttached> list = super.searchBySql(hql, productId,attributeValueId);
        if(list.size()>0){
            return list.get(0);
        }
        return null;
    }


}
