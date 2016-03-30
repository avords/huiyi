package com.mvc.product.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.framework.dao.PropertyFilter;
import com.mvc.framework.model.AbstractEntity;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.web.PageController;
import com.mvc.product.model.Attribute;
import com.mvc.product.model.AttributeVal;
import com.mvc.product.model.Category;
import com.mvc.product.service.AttributeManager;
import com.mvc.product.service.AttributeValManager;
import com.mvc.product.service.CategoryManager;

@Controller
@RequestMapping("/attribute")
public class AttributeController extends PageController<Attribute>{
    private static final String BASE_PATH="product/";
    @Autowired
    private AttributeManager attributeManager;
    @Autowired
    private AttributeValManager attributeValManager;
    @Autowired
    private CategoryManager categoryManager;
    @Override
    public PageManager<Attribute> getEntityManager() {
        return attributeManager;
    }

    @Override
    public String getFileBasePath() {
        return BASE_PATH;
    }

    @Override
    protected String handlePage(HttpServletRequest request, PageSearch page) {
        String categoryIdStr = request.getParameter("categoryId");
        page.getFilters().add(new PropertyFilter(Attribute.class.getName(),"EQL_categoryId",categoryIdStr));
        getEntityManager().find(page);
        List<Attribute> list = page.getList();
        for(Attribute a:list){
            //得到属性
            List<AttributeVal> attrs = attributeValManager.getByAttributeId(a.getObjectId());
            StringBuilder attrStr = new StringBuilder();
            String s = "";
            for(AttributeVal attr:attrs){
                attrStr.append(attr.getNameZh()+",");
            }
            if(attrStr.length()>0){
                s = attrStr.substring(0, attrStr.length()-1);
            }
            a.setValueNames(s);
        }
        request.setAttribute("action", "page");
        return getFileBasePath() + "list" + getActualArgumentType().getSimpleName();
    }

    @Override
    protected String handleEdit(HttpServletRequest request, HttpServletResponse response, Long objectId)
            throws Exception {
        Long categoryId = Long.parseLong(request.getParameter("categoryId"));
        Category category = categoryManager.getByObjectId(categoryId);
        category.setParentName(categoryManager.getByObjectId(category.getParentId()).getNameZh());
        if (null != objectId) {
            Object entity = getManager().getByObjectId(objectId);
            request.setAttribute("entity", entity);
            List<AttributeVal> attributeValues = attributeValManager.getByAttributeId(objectId);
            request.setAttribute("attributeValues", attributeValues);
        }
        request.setAttribute("category", category);
        return getFileBasePath() + "edit" + getActualArgumentType().getSimpleName();
    }

    @Override
    protected String handleSave(HttpServletRequest request, ModelMap modelMap, Attribute t) throws Exception {
        //得到属性值得属性
        String[] attributeValIds = request.getParameterValues("objectId1");
        String[] attributeValueNameZh = request.getParameterValues("attributeValueNameZh");
        String[] attributeValueNameEn = request.getParameterValues("attributeValueNameEn");
        String[] sortNo1 = request.getParameterValues("sortNo1");
        if(attributeValueNameZh==null||attributeValueNameZh.length==0){
            t.setInputType(Attribute.INPUT_TYPE_TEXT);
        }else{
            t.setInputType(Attribute.INPUT_TYPE_SELECT);
        }
        getManager().save(t);
        Long attributeId = t.getObjectId();
        //保存属性值
        if(attributeValueNameZh!=null){
            for(int i=0;i<attributeValueNameZh.length;i++){
                AttributeVal attrV = new AttributeVal();
                attrV.setObjectId(StringUtils.isBlank(attributeValIds[i])?null:Long.parseLong(attributeValIds[i]));
                attrV.setAttributeId(attributeId);
                attrV.setNameZh(attributeValueNameZh[i]);
                attrV.setNameEn(attributeValueNameEn[i]);
                attrV.setSortNo(Double.parseDouble(sortNo1[i]));
                attributeValManager.save(attrV);
            }
        }
        return "redirect:edit/" + ((AbstractEntity) t).getObjectId() + getMessage("common.base.success", request)
                + "&" + appendAjaxParameter(request) + "&action=" + request.getParameter("action")+"&categoryId="+t.getCategoryId();
    }
    @RequestMapping("/deleteValue/{attributeValId}")
    public String deleteValue(HttpServletRequest request,HttpServletResponse response,@PathVariable Long attributeValId,ModelMap map){
        boolean result = false;
        attributeValManager.delete(attributeValId);
        result =true;
        map.addAttribute("result", result);
        map.addAttribute("message", "操作成功");
        return "jsonView";
    }
    @RequestMapping(value = "/saveSortNos")
    @ResponseBody
    public String saveSortNos(HttpServletRequest request, String ids,String sortNos) throws Exception {
        boolean result = false;
        if(StringUtils.isNotBlank(ids) && StringUtils.isNotBlank(sortNos)){
            attributeManager.updateSortNoByObjectId(ids, sortNos);
            result = true;
        }
        return String.valueOf(result);
    }
    @RequestMapping(value = "/getAttribute/{categoryId}")
    public String getAttribute(HttpServletRequest request, HttpServletResponse response,@PathVariable Long categoryId,ModelMap map) throws Exception {
        boolean result = false;
        List<Attribute> skuAttrs = attributeManager.getSkuAttributeByCategoryId(categoryId);
        for(Attribute att:skuAttrs){
            att.setAttributeVals(attributeValManager.getByAttributeId(att.getObjectId()));
        }
        List<Attribute> otherAttrs = attributeManager.getOtherAttributeByCategoryId(categoryId);
        for(Attribute att:otherAttrs){
            att.setAttributeVals(attributeValManager.getByAttributeId(att.getObjectId()));
        }
        result = true;
        map.addAttribute("result", result);
        map.addAttribute("skuAttrs", skuAttrs);
        map.addAttribute("otherAttrs", otherAttrs);
        return "jsonView";
    }
}
