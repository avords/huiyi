package com.mvc.product.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.mvc.framework.service.BaseService;
import com.mvc.product.model.ProductMedia;
@Service
public class ProductMediaManager extends BaseService<ProductMedia, Long>{

    public void save(Long productId, String subPicture) {
        this.deleteByWhere("productId="+productId);
        if(StringUtils.isNotBlank(subPicture)){
            String[] subPictures = subPicture.split(",");
            for(String sp:subPictures){
                ProductMedia pm = new ProductMedia();
                pm.setProductId(productId);
                pm.setType(ProductMedia.MEDIA_TYPE_PICTURE);
                pm.setContentUrl(sp);
                this.save(pm);
            }
        }
    }

    public List<ProductMedia> getByProductIdAndType(Long productId, Integer type) {
        String hql = "select A from "+ProductMedia.class.getName()+" A where A.productId=? and A.type=?";
        return super.searchBySql(hql, productId,type);
    }

}
