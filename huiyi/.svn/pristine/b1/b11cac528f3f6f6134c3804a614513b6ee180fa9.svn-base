package com.mvc.member.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.product.model.Attribute;
import com.mvc.product.service.AttributeManager;
import com.mvc.product.service.AttributeValManager;
import com.mvc.util.I18NUtils;

@Controller
@RequestMapping("/member/attribute")
public class MemberAttributeController {
    @Autowired
    private AttributeManager attributeManager;
    @Autowired
    private AttributeValManager attributeValManager;
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
        I18NUtils.transform(skuAttrs, request);
        I18NUtils.transform(otherAttrs, request);
        map.addAttribute("skuAttrs", skuAttrs);
        map.addAttribute("otherAttrs", otherAttrs);
        return "jsonView";
    }
}
