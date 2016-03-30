package com.mvc.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.search.service.ProductSolrClientManager;

@Service
public class SkuUpAndDownManager {

    @Autowired
    private SkuManager skuManager;
    @Autowired
    private ProductSolrClientManager productSolrClientManager;
    public void upProducts(List<Long> skuIds) {
        skuManager.executeUpProducts(skuIds);
        productSolrClientManager.buildIndex(true);
    }
    public void downProducts(List<Long> skuIds) {
        skuManager.executeDownProducts(skuIds);
        productSolrClientManager.buildIndex(true);
    }
}
