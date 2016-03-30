package com.mvc.member.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.product.model.Sku;
import com.mvc.product.service.SkuManager;
import com.mvc.product.service.SkuUpAndDownManager;
import com.mvc.search.service.ProductSolrClientManager;
import com.mvc.search.util.I18NUtils;
@Controller
@RequestMapping("/member/sku")
public class MemberSkuController {
    @Autowired
    private SkuManager skuManager;
    @Autowired
    private SkuUpAndDownManager skuUpAndDownManager;
    @Autowired
    private ProductSolrClientManager productSolrClientManager;
    @RequestMapping("/upShelf")
    public String upShelf(HttpServletRequest request,HttpServletResponse response,String ids,ModelMap map){
        Locale locale = request.getLocale();
        String message = I18NUtils.transformName("上架成功", "Shelf success", locale);
                ;
        List<Long> skuIds = new ArrayList<Long>();
        if(StringUtils.isNotBlank(ids)){
            String[] idStrs = ids.split(",");
            for(String idStr:idStrs){
                Long skuId = Long.parseLong(idStr);
                Sku sku = skuManager.getByObjectId(skuId);
                if(sku.getStatus()==Sku.PRODUCT_STATUS_WAIT_SALE||sku.getStatus()==Sku.PRODUCT_STATUS_NOT_SALE){
                    skuIds.add(skuId);
                }else{
                    message = I18NUtils.transformName("上架失败，只有状态为待上架和已下架的产品才能上架", "Shelves fail, only the state is to be on the shelves and shelves of products can be", locale);
                    break;
                }

            }
            if(skuIds.size()>0){
                skuUpAndDownManager.upProducts(skuIds);
                for(Long skuId:skuIds){//清空缓存
                    skuManager.update(skuId);
                }
            }
        }else{
            message = I18NUtils.transformName("上架失败，你未选择任何产品", "Shelves failed, you did not select any products", locale);
        }
        map.addAttribute("message",message);
        return "jsonView";
    }

    @RequestMapping("/downShelf")
    public String downShelf(HttpServletRequest request,HttpServletResponse response,String ids,ModelMap map){
        Locale locale = request.getLocale();
        String message = I18NUtils.transformName("下架成功", "Goods under the shelf success", locale);
        List<Long> skuIds = new ArrayList<Long>();
        if(StringUtils.isNotBlank(ids)){
            String[] idStrs = ids.split(",");
            for(String idStr:idStrs){
                Long skuId = Long.parseLong(idStr);
                Sku sku = skuManager.getByObjectId(skuId);
                if(sku.getStatus()==Sku.PRODUCT_STATUS_IN_SALE){
                    skuIds.add(skuId);
                }else{
                    message = I18NUtils.transformName("下架失败，只有状态为已上架的产品才能下架", "Commodity under the shelf failure, only the state has been on the shelves of products can be under the shelf", locale);
                    break;
                }

            }
            if(skuIds.size()>0){
                skuUpAndDownManager.downProducts(skuIds);
                for(Long skuId:skuIds){//清空缓存
                    skuManager.update(skuId);
                }
            }
        }else{
            message = I18NUtils.transformName("下架失败，你未选择任何产品", "The next shelf fails, you do not choose any product", locale);
        }
        map.addAttribute("message",message);
        return "jsonView";
    }
    @RequestMapping("/delete")
    public String delete(HttpServletRequest request,HttpServletResponse response,String ids,ModelMap map){
        Locale locale = request.getLocale();
        String message = I18NUtils.transformName("删除成功", "Delete success", locale);
        if(StringUtils.isNotBlank(ids)){
            String[] idStrs = ids.split(",");
            for(String idStr:idStrs){
                Long skuId = Long.parseLong(idStr);
                skuManager.delete(skuId);
            }
            productSolrClientManager.buildIndex(true);
        }else{
            message = I18NUtils.transformName("删除失败，你未选择任何产品", "Delete failed, you did not select any product", locale);
        }
        map.addAttribute("message",message);
        return "jsonView";
    }
}
