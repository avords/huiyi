package com.mvc.product.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.framework.service.PageManager;
import com.mvc.framework.web.PageController;
import com.mvc.product.model.Sku;
import com.mvc.product.service.SkuManager;

@Controller
@RequestMapping("/sku")
public class SkuController extends PageController<Sku>{
    private static final String BASE_PATH="product/";
    @Autowired
    private SkuManager skuManager;
    @Override
    public PageManager<Sku> getEntityManager() {
        return skuManager;
    }

    @Override
    public String getFileBasePath() {
        return BASE_PATH;
    }
}
