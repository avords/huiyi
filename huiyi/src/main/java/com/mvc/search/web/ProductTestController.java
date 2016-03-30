package com.mvc.search.web;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.framework.util.LocaleUtils;
import com.mvc.search.model.Page;
import com.mvc.search.service.ProductSolrClientManager;

@Controller
@RequestMapping("/productTest")
public class ProductTestController {

    @Autowired
    private ProductSolrClientManager productSolrClientManager;
    @RequestMapping("/testPage")
    @ResponseBody
    public Page testPage(HttpServletRequest request,HttpServletResponse response,String queryWord){
        Locale locale = LocaleUtils.getLocale(request);
        Page page = new Page();
        if(StringUtils.isNotBlank(queryWord)){
            page.setQueryWord(queryWord);
        }
        productSolrClientManager.getByPage(page, locale);
        return page;
    }
    @RequestMapping("/testBuildIndex")
    @ResponseBody
    public boolean testBuildIndex(HttpServletRequest request,HttpServletResponse response){
        productSolrClientManager.buildIndex(true);
        return true;
    }
}
