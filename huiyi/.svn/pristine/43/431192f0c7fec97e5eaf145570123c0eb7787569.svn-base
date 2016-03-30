package com.mvc.member.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.product.model.Category;
import com.mvc.product.service.CategoryManager;
import com.mvc.util.I18NUtils;

@Controller
@RequestMapping("/member/category")
public class MemberCategoryController {
    @Autowired
    private CategoryManager categoryManager;

    @RequestMapping("getSecondCategory/{parentId}")
    public String getSecondCategory(HttpServletRequest request,HttpServletResponse response,@PathVariable Long parentId,ModelMap map) throws Exception {
        List<Category> list = categoryManager.getSecondCategoryByParentId(parentId);
        I18NUtils.transform(list, request);
        map.addAttribute("secondCategory", list);
        return "jsonView";
    }
}
