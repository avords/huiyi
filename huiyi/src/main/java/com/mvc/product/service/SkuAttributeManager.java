package com.mvc.product.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.framework.service.BaseService;
import com.mvc.product.model.AttributeVal;
import com.mvc.product.model.SkuAttribute;

@Service
public class SkuAttributeManager extends BaseService<SkuAttribute, Long>{

    @Autowired
    private AttributeValManager attributeValManager;
    public void save(Long skuId, String[] avi) {
        this.deleteByWhere("skuId="+skuId);
        for(String attributeValId:avi){
            Long attValId = Long.parseLong(attributeValId);
            AttributeVal attributeVal = attributeValManager.getByObjectId(attValId);
            if(attributeVal!=null){
                SkuAttribute sab = new SkuAttribute();
                sab.setAttributeId(attributeVal.getAttributeId());
                sab.setAttributeValId(attValId);
                sab.setSkuId(skuId);
                this.save(sab);
            }
        }
    }

}
