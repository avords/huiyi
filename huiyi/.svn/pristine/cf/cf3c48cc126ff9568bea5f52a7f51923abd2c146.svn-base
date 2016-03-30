package com.mvc.product.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.HYConstants;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.web.PageController;
import com.mvc.product.model.Category;
import com.mvc.product.model.Product;
import com.mvc.product.service.CategoryManager;
import com.mvc.product.service.ProductManager;

@Controller
@RequestMapping("/product")
public class ProductController extends PageController<Product>{
    private static final String BASE_PATH="product/";
    @Autowired
    private ProductManager productManager;
    @Autowired
    private CategoryManager categoryManager;
    @Override
    public PageManager<Product> getEntityManager() {
        return productManager;
    }

    @Override
    public String getFileBasePath() {
        return BASE_PATH;
    }

    @Override
    protected String handleEdit(HttpServletRequest request, HttpServletResponse response, Long objectId)
            throws Exception {
        //所有三级分类
        List<Category> categorys = categoryManager.getAllCategory(2,HYConstants.STATUS_VALID);
        for(Category ca:categorys){
            Category parentCate = categoryManager.getByObjectId(ca.getParentId());
            if(parentCate!=null){
                ca.setNameZh(parentCate.getNameZh()+">>"+ca.getNameZh());
            }
        }
        request.setAttribute("categorys", categorys);
        if (null != objectId) {
            Object entity = getManager().getByObjectId(objectId);
            request.setAttribute("entity", entity);
        }
        return getFileBasePath() + "edit" + getActualArgumentType().getSimpleName();
    }

    @Override
    protected String handleSave(HttpServletRequest request, ModelMap modelMap, Product t) throws Exception {
        return super.handleSave(request, modelMap, t);
    }

}
