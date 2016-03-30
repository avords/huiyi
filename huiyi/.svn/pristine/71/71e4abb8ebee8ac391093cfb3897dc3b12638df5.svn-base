package com.mvc.product.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mvc.framework.service.BaseService;
import com.mvc.product.model.ProductAttached;
@Service
public class ProductAttachedManager extends BaseService<ProductAttached, Long>{

    public void save(Long productId, List<ProductAttached> pas) {
        this.deleteByWhere("productId="+productId);
        if(pas!=null){
            for(ProductAttached pa:pas){
                pa.setProductId(productId);
                this.save(pa);
            }
        }
    }

    public List<ProductAttached> getByProductIdAndType(Long productId, Integer type) {
        String hql = "select A from "+ProductAttached.class.getName()+" A where A.productId=? and A.type=?";
        return super.searchBySql(hql, productId,type);
    }

}
