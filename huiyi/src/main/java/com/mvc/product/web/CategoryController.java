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

import com.mvc.HYConstants;
import com.mvc.framework.dao.PropertyFilter;
import com.mvc.framework.model.AbstractEntity;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.web.PageController;
import com.mvc.product.model.Attribute;
import com.mvc.product.model.Category;
import com.mvc.product.service.AttributeManager;
import com.mvc.product.service.CategoryManager;

@Controller
@RequestMapping("/admin/category")
public class CategoryController extends PageController<Category>{

    @Autowired
    private CategoryManager categoryManager;
    @Autowired
    private AttributeManager attributeManager;
    private static final String BASE_PATH="product/";
    @Override
    public PageManager<Category> getEntityManager() {
        return categoryManager;
    }

    @Override
    public String getFileBasePath() {
        return BASE_PATH;
    }

    @Override
    protected String handleSave(HttpServletRequest request, ModelMap modelMap, Category t)
            throws Exception {
        if(t.getObjectId()!=null&&t.getStatus()==HYConstants.STATUS_INVALID){
            boolean isHave = categoryManager.isHaveValidChildren(t.getObjectId());
            if(isHave){
                return "redirect:edit/" + ((AbstractEntity) t).getObjectId() + getMessage("此分类下面有有效的分类存在，不能设置为无效", request) + "&" + appendAjaxParameter(request)
                + "&action=" + request.getParameter("action");
            }
        }
        getManager().save(t);
        return "redirect:edit/" + ((AbstractEntity) t).getObjectId() + getMessage("common.base.success", request) + "&" + appendAjaxParameter(request)
                + "&action=" + request.getParameter("action");
    }

    @Override
    protected String handlePage(HttpServletRequest request, PageSearch page) {
        //查询一级分类
        page.getFilters().add(new PropertyFilter(Category.class.getName(),"EQI_layer","1"));
        page.setSortProperties(new String[]{"sortNo"});
        page.setSortOrders(new String[]{"asc"});
        getEntityManager().find(page);
        List<Category> list = page.getList();
        for(Category c:list){
            c.setChildrenCount(categoryManager.getChildrenCountByParentId(c.getObjectId()));
        }
        request.setAttribute("action", "page");
        return getFileBasePath() + "list" + getActualArgumentType().getSimpleName();
    }

    @RequestMapping(value = "/secondPage")
    public String secondPage(HttpServletRequest request, Category t, Integer backPage) throws Exception {
        PageSearch page  = preparePage(request);
        String parentIdStr = request.getParameter("parentId");
        page.getFilters().add(new PropertyFilter(Category.class.getName(),"EQI_layer","2"));
        page.getFilters().add(new PropertyFilter(Category.class.getName(),"EQL_parentId",parentIdStr));
        page.setSortProperties(new String[]{"sortNo"});
        page.setSortOrders(new String[]{"asc"});
        getEntityManager().find(page);
        request.setAttribute("action", "page");
        String result =  getFileBasePath() + "listSecond" + getActualArgumentType().getSimpleName();
        afterPage(request, page,backPage);
        return result;
    }
    @RequestMapping(value = "/secondCreate")
    public String secondCreate(HttpServletRequest request, HttpServletResponse response, Category t) throws Exception {
        Long parentId = Long.parseLong(request.getParameter("parentId"));
        Category parentCategory = categoryManager.getByObjectId(parentId);
        request.setAttribute("parentCategory", parentCategory);
        super.handleEdit(request, response, null);
        return getFileBasePath() + "editSecond" + getActualArgumentType().getSimpleName();
    }
    @RequestMapping(value = "/editSecond/{objectId}")
    public String editSecond(HttpServletRequest request, HttpServletResponse response, @PathVariable Long objectId)
            throws Exception {
        Category parentCategory = categoryManager.getByObjectId(Long.parseLong(request.getParameter("parentId")));
        request.setAttribute("parentCategory", parentCategory);
        handleEdit(request, response, objectId);
        return getFileBasePath() + "editSecond" + getActualArgumentType().getSimpleName();
    }

    @RequestMapping(value = "/invalid")
    @ResponseBody
    public String invalid(HttpServletRequest request, String ids,Integer status) throws Exception {
        int result = 0;
        if(StringUtils.isNotBlank(ids)){
            for(String id : ids.split(",")){
                Long objectId = null;
                try{
                    objectId = Long.parseLong(id);
                }catch(Exception e){
                }
                if(objectId!=null){
                    boolean isHave = categoryManager.isHaveValidChildren(objectId);
                    if(!isHave){
                        categoryManager.updateStatus(objectId, HYConstants.STATUS_INVALID);
                    }
                    result ++;
                }
            }
        }
        return String.valueOf(result);
    }

    @RequestMapping(value = "/saveSortNos")
    @ResponseBody
    public String saveSortNos(HttpServletRequest request, String ids,String sortNos) throws Exception {
        boolean result = false;
        if(StringUtils.isNotBlank(ids) && StringUtils.isNotBlank(sortNos)){
            categoryManager.updateSortNoByObjectId(ids, sortNos);
            String[] id = ids.split(",");
            for(int i =0; i<id.length;i++){
                categoryManager.update(id[i]);
            }
            result = true;
        }
        return String.valueOf(result);
    }

    @RequestMapping(value = "/allSecondPage")
    public String allSecondPage(HttpServletRequest request, Category t, Integer backPage) throws Exception {
        PageSearch page  = preparePage(request);
        page.getFilters().add(new PropertyFilter(Category.class.getName(),"EQI_layer","2"));
        page.setSortProperties(new String[]{"parentId","sortNo"});
        page.setSortOrders(new String[]{"desc","asc"});
        getEntityManager().find(page);
        List<Category> list = page.getList();
        for(Category c:list){
        	if(c.getParentId()!=-1){
        		Category parent = categoryManager.getByObjectId(c.getParentId());
        		if(parent!=null){
        			c.setParentName(parent.getNameZh());
        		}
        	}
            //得到属性
            List<Attribute> attrs = attributeManager.getByCategoryId(c.getObjectId(),HYConstants.STATUS_VALID);
            StringBuilder attrStr = new StringBuilder();
            String s = "";
            for(Attribute attr:attrs){
                attrStr.append(attr.getNameZh()+",");
            }
            if(attrStr.length()>0){
                s = attrStr.substring(0, attrStr.length()-1);
            }
            c.setAttributeName(s);
        }
        List<Category> firstCategory = categoryManager.getAllCategory(1);
        request.setAttribute("firstCategory", firstCategory);
        request.setAttribute("action", "page");
        String result =  getFileBasePath() + "listAllSecond" + getActualArgumentType().getSimpleName();
        afterPage(request, page,backPage);
        return result;
    }

    @RequestMapping("getSecondCategory/{parentId}")
    public String getSecondCategory(HttpServletRequest request,HttpServletResponse response,@PathVariable Long parentId,ModelMap map) throws Exception {
        List<Category> list = categoryManager.getSecondCategoryByParentId(parentId);
        map.addAttribute("secondCategory", list);
        return "jsonView";
    }

    /**
     * 首页显示的服务列表
     */
}
