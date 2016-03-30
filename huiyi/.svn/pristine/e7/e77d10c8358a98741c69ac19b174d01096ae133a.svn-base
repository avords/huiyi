package com.mvc.product.web;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.HYConstants;
import com.mvc.framework.dao.PropertyFilter;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.util.FrameworkContextUtils;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.util.PageUtils;
import com.mvc.framework.web.PageController;
import com.mvc.product.model.Attribute;
import com.mvc.product.model.Category;
import com.mvc.product.model.Product;
import com.mvc.product.model.Sku;
import com.mvc.product.model.SkuAttributeAttached;
import com.mvc.product.model.SkuCheck;
import com.mvc.product.service.AttributeManager;
import com.mvc.product.service.CategoryManager;
import com.mvc.product.service.ProductManager;
import com.mvc.product.service.SkuAttributeAttachedManager;
import com.mvc.product.service.SkuManager;
import com.mvc.product.service.SkuUpAndDownManager;
import com.mvc.search.service.ProductSolrClientManager;

@Controller
@RequestMapping("/admin/sku")
public class SkuController extends PageController<Sku>{
    private static final String BASE_PATH="product/";
    @Autowired
    private SkuManager skuManager;
    @Autowired
    private ProductManager productManager;
    @Autowired
    private CategoryManager categoryManager;
    @Autowired
    private AttributeManager attributeManager;
    @Autowired
    private SkuAttributeAttachedManager skuAttributeAttachedManager;
    @Autowired
    private SkuUpAndDownManager skuUpAndDownManager;
    @Autowired
    private ProductSolrClientManager productSolrClientManager;
    @Override
    public PageManager<Sku> getEntityManager() {
        return skuManager;
    }

    @Override
    public String getFileBasePath() {
        return BASE_PATH;
    }

    @Override
    protected String handlePage(HttpServletRequest request, PageSearch page) {
        page.getFilters().add(new PropertyFilter(Sku.class.getName(),"EQI_sku.deleted","0"));
        skuManager.searchSku(page);
        List<Object[]> list = page.getList();
        for(Object[] obj:list){
            Long productId = ((BigInteger)obj[0]).longValue();
            Product product = productManager.getByObjectId(productId);
            //产品类别
            product.setCategoryName(categoryManager.getCategoryNameByCategoryId(product.getCategoryId(), HYConstants.STATUS_VALID));
            //产品属性
            //判断product下面有几个sku,如果只有一个则不需要算属性
            Long count = skuManager.getCountByProductId(productId);
            if(count>1){
                String avs = (String) obj[6];
                StringBuilder attributeValues = new StringBuilder();
                String[] attributeVals = avs.split(",");
                for(String attributeValueIdStr:attributeVals){
                    Long attributeValueId = Long.parseLong(attributeValueIdStr);
                    SkuAttributeAttached skuAttributeAttached = skuAttributeAttachedManager.getByProductIdAndAttributeValId(productId,attributeValueId);
                    if(skuAttributeAttached!=null){
                        Attribute att = attributeManager.getByObjectId(skuAttributeAttached.getAttributeId());
                        attributeValues.append(att.getNameZh()).append(":").append(skuAttributeAttached.getNameZh()).append(",");
                    }
                }
                if(attributeValues.length()>0){
                    obj[6]=attributeValues.substring(0, attributeValues.length()-1);
                }else{
                    obj[6]="";
                }
            }else{
                obj[6]="";
            }

        }
        request.getSession().setAttribute("action", "/admin/sku/page");
        PageUtils.afterPage(request, page, PageUtils.IS_NOT_BACK);
        List<Category> firstCategory = categoryManager.getAllCategory(1,HYConstants.STATUS_VALID);
        request.setAttribute("firstCategory", firstCategory);
        return getFileBasePath() + "list" + getActualArgumentType().getSimpleName();
    }

    @RequestMapping("/upShelf")
    public String upShelf(HttpServletRequest request,HttpServletResponse response,String ids,ModelMap map){
        String message = "上架成功";
        List<Long> skuIds = new ArrayList<Long>();
        if(StringUtils.isNotBlank(ids)){
            String[] idStrs = ids.split(",");
            for(String idStr:idStrs){
                Long skuId = Long.parseLong(idStr);
                Sku sku = skuManager.getByObjectId(skuId);
                if(sku.getStatus()==Sku.PRODUCT_STATUS_WAIT_SALE||sku.getStatus()==Sku.PRODUCT_STATUS_NOT_SALE){
                    skuIds.add(skuId);
                }else{
                    message = "上架失败，只有状态为待上架和已下架的产品才能上架";
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
            message = "上架失败，你未选择任何产品";
        }
        map.addAttribute("message",message);
        return "jsonView";
    }

    @RequestMapping("/downShelf")
    public String downShelf(HttpServletRequest request,HttpServletResponse response,String ids,ModelMap map){
        String message = "下架成功";
        List<Long> skuIds = new ArrayList<Long>();
        if(StringUtils.isNotBlank(ids)){
            String[] idStrs = ids.split(",");
            for(String idStr:idStrs){
                Long skuId = Long.parseLong(idStr);
                Sku sku = skuManager.getByObjectId(skuId);
                if(sku.getStatus()==Sku.PRODUCT_STATUS_IN_SALE){
                    skuIds.add(skuId);
                }else{
                    message = "下架失败，只有状态为已上架的产品才能下架";
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
            message = "下架失败，你未选择任何产品";
        }
        map.addAttribute("message",message);
        return "jsonView";
    }
    @RequestMapping("/delete")
    public String delete(HttpServletRequest request,HttpServletResponse response,String ids,ModelMap map){
        String message = "删除成功";
        if(StringUtils.isNotBlank(ids)){
            String[] idStrs = ids.split(",");
            for(String idStr:idStrs){
                Long skuId = Long.parseLong(idStr);
                skuManager.delete(skuId);
            }
            productSolrClientManager.buildIndex(true);
        }else{
            message = "删除失败，你未选择任何产品";
        }
        map.addAttribute("message",message);
        return "jsonView";
    }

    @RequestMapping("/checkPage")
    public String checkPage(HttpServletRequest request, Product t, Integer backPage){
        PageSearch page  = preparePage(request);
        if("objectId".equals(page.getSortProperty())){
            page.setSortProperties(new String[]{"updatedOn","objectId"});
            page.setSortOrders(new String[]{"desc nulls last","desc"});
        }
        page.getFilters().add(new PropertyFilter(Sku.class.getName(),"EQI_sku.status",Sku.PRODUCT_STATUS_WAIT_CHECK+""));
        String result = handlePage(request, page);
        result = getFileBasePath() + "list" + getActualArgumentType().getSimpleName()+"Check";
        afterPage(request, page,backPage);
        request.getSession().setAttribute("action", "/admin/sku/checkPage");
        return result;
    }

    @RequestMapping(value = "/checkPass/{skuId}")
    public String checkPass(HttpServletRequest request, HttpServletResponse response, @PathVariable Long skuId,ModelMap map) throws Exception {
        boolean result = true;
        String message = "操作成功!";
        //更改sku状态
        Sku sku = skuManager.getByObjectId(skuId);
        if(!sku.getStatus().equals(Sku.PRODUCT_STATUS_WAIT_CHECK)){
            message = "操作失败，不在待审核状态!";
            result = false;
        }else{
            //记录sku审核历史
            SkuCheck sc = new SkuCheck();
            sc.setProductId(sku.getProductId());
            sc.setSkuId(skuId);
            sc.setExamineDate(new Date());
            sc.setExamineUserId(FrameworkContextUtils.getCurrentUserId());
            sc.setType(SkuCheck.TYPE_PASS);
            skuManager.executeCheck(skuId, Sku.PRODUCT_STATUS_WAIT_SALE, sc);
            skuManager.update(skuId);
        }
        map.put("result", result);
        map.put("message", message);
        return "jsonView";
    }
    @RequestMapping(value = "/checkNotPass/{skuId}")
    public String checkNotPass(HttpServletRequest request, HttpServletResponse response,@PathVariable Long skuId) throws Exception {
        request.setAttribute("skuId", skuId);
        return getFileBasePath()+"checkSku";
    }

    @RequestMapping(value = "/saveCheckReason")
    public String saveCheckReason(HttpServletRequest request, HttpServletResponse response) throws Exception {
        boolean result = false;
        Long skuId = Long.parseLong(request.getParameter("skuId"));
        String remark = request.getParameter("remark");
        String message = "操作成功!";
        //更改sku表的状态
        Sku sku = skuManager.getByObjectId(skuId);
        if(!sku.getStatus().equals(Sku.PRODUCT_STATUS_WAIT_CHECK)){
            message = "操作失败，不在待审核状态!";
        }else{
            //记录sku审核历史
            SkuCheck sc = new SkuCheck();
            sc.setProductId(sku.getProductId());
            sc.setSkuId(skuId);
            sc.setExamineDate(new Date());
            sc.setExamineUserId(FrameworkContextUtils.getCurrentUserId());
            sc.setCheckReason(remark);
            sc.setType(SkuCheck.TYPE_NOT_PASS);
            skuManager.executeCheck(skuId, Sku.PRODUCT_STATUS_CHECK_NOT, sc);
            skuManager.update(skuId);
            result = true;
        }
        request.setAttribute("result", result);
        return "redirect:/admin/sku/checkNotPass/"+skuId+getMessage(message, request)
                + "&" + appendAjaxParameter(request)+"&result="+result;
    }

    @RequestMapping("/search")
    public String search(HttpServletRequest request, HttpServletResponse response,Integer backPage){
        PageSearch page  = preparePage(request);
        page.getFilters().add(new PropertyFilter(Sku.class.getName(),"EQI_sku.status",Sku.PRODUCT_STATUS_IN_SALE+""));
        String result = handlePage(request, page);
        result = getFileBasePath() + "list" + getActualArgumentType().getSimpleName()+"Search";
        afterPage(request, page,backPage);
        request.getSession().setAttribute("action", "/admin/sku/search");
        return result;
    }
}
