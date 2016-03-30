package com.mvc.product.service;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.framework.service.BaseService;
import com.mvc.product.model.Attribute;
import com.mvc.product.model.ProductAttribute;
@Service
public class ProductAttributeManager extends BaseService<ProductAttribute, Long>{

    @Autowired
    private AttributeManager attributeManager;
    public void save(Long productId,Map<String, Object> baseAttrs) {
        this.deleteByWhere("productId="+productId);
        for(Entry<String, Object> entry:baseAttrs.entrySet()){
            ProductAttribute pa = new ProductAttribute();
            String key = entry.getKey();
            Object obj = entry.getValue();
            Long attributeId = Long.parseLong(key);

            pa.setAttributeId(attributeId);
            pa.setProductId(productId);
            Attribute att = attributeManager.getByObjectId(attributeId);
            if(att.getInputType().equals(Attribute.INPUT_TYPE_TEXT)){
                pa.setValue(obj==null?"":obj.toString());
            }else if(att.getInputType().equals(Attribute.INPUT_TYPE_SELECT)){
                pa.setAttributeValId((obj==null||StringUtils.isBlank(obj.toString()))?null:Long.parseLong(obj.toString()));
            }
            this.save(pa);
        }
    }
    public List<ProductAttribute> getByProductId(Long productId) {
        String hql = "select A from "+ProductAttribute.class.getName()+" A where A.productId=?";
        return super.searchBySql(hql, productId);
    }

}
