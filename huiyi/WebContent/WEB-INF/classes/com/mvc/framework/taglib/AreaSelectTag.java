package com.mvc.framework.taglib;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.taglibs.standard.lang.support.ExpressionEvaluatorManager;

import com.mvc.base.model.Area;
import com.mvc.base.service.AreaManager;
import com.mvc.framework.util.LocaleUtils;
import com.mvc.framework.util.MessageUtils;

public class AreaSelectTag extends TagSupport {
    private static AreaManager areaManager;
    private static final Logger LOGGER = Logger.getLogger(AreaSelectTag.class);
    private static final long serialVersionUID = -8322211607700170220L;
    public static AreaManager getAreaManager() {
        return areaManager;
    }
    private String city = "city";//市下拉框名称
    private String code;//地区编码值
    private String district = "district";//区下拉框名称

    private String province = "province";//省份下拉框名称

    @Override
    public int doStartTag() throws JspException {
        code =(String) ExpressionEvaluatorManager.evaluate("code", code, String.class, this, pageContext);
        String first = null;
        String second = null;
        if(StringUtils.isNotBlank(code)){
            if(code.length()==6){
                first = code.substring(0,2);
                second = code.substring(0,4);
            }else if(code.length() == 4){
                first = code.substring(0,2);
                second = code.substring(0,4);
            }else if(code.length() ==2){
                first = code;
            }
        }
        try {
            List<Area> provinces = areaManager.getChildren(-1L);
            String pleaseSelect = "<option value=''>" + MessageUtils.getMessage("common.label.pleaseSelect", LocaleUtils.getLocale(pageContext.getSession())) + "</option>";
            pageContext.getOut().write("<select style='width:130px;display:inline-block;' id='" + province + "' onchange=\"javascript:getAreaChildren('"  + city  + "',this);setAreaCode(this,1);\">");
            pageContext.getOut().write(pleaseSelect + selectOption(provinces, first));
            pageContext.getOut().write("</select>");
            List<Area> cities = null;
            if(first!=null){
                cities = areaManager.getChildrenByCode(first);
            }
            pageContext.getOut().write("<select style='width:100px;display:inline-block;' id='" + city + "' onchange=\"javascript:getAreaChildren('_" + district + "',this);setAreaCode(this,2);\">");
            pageContext.getOut().write(pleaseSelect + selectOption(cities, second));
            pageContext.getOut().write("</select>");
            List<Area> districts = null;
            if(second!=null){
                districts = areaManager.getChildrenByCode(second);
            }
            pageContext.getOut().write("<input type='hidden' value='"+code+"' name='" + district + "' id='" + district + "' >");
            pageContext.getOut().write("<select style='width:100px;display:inline-block;' id='_" + district + "' onchange=\"javascript:setAreaCode(this,3);\">");
            pageContext.getOut().write(pleaseSelect + selectOption(districts, code));
            pageContext.getOut().write("</select>");
            if(first==null){
                pageContext.getOut().write("<script type='text/javascript'>$('#" + province + "').change();</script>");
            }else if(second==null){
                pageContext.getOut().write("<script type='text/javascript'>$('#" + city + "').change();</script>");
            }
            //			pageContext.getOut().write("<script type='text/javascript'>function setAreaCode(trigger,type){var code = $(trigger).val();var district = $('#"
            //					+ district + "');if(type==1){district.val(code);}else if(type==2){if(code==''){district.val($('#"
            //					+ province + "').val());}else{district.val(code);}}else if(type==3){if(code==''){var t=$('#"
            //					+ city + "').val();if(t==''){t=$('#"
            //					+ province + "').val();}district.val(t);}else{district.val(code);}}}</script>");
        } catch (Exception e) {
            LOGGER.error("doStartTag()", e);
        }
        return EVAL_PAGE;
    }

    public String getCity() {
        return city;
    }

    public String getCode() {
        return code;
    }

    public String getDistrict() {
        return district;
    }

    public String getProvince() {
        return province;
    }

    private String selectOption(List<Area> areas,String selected) throws JspException, IOException {
        if(areas==null||areas.size()==0){
            return "";
        }
        StringBuilder result = new StringBuilder(areas.size()*35);
        for (Area area : areas) {
            result.append("<option value='").append(area.getCode()).append("'");
            if(area.getCode().equals(selected)){
                result.append(" selected ");
            }
            result.append(">").append(area.getName()).append("</option>");
        }
        return result.toString();
    }

    public void setAreaManager(AreaManager areaManager) {
        AreaSelectTag.areaManager = areaManager;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public void setProvince(String province) {
        this.province = province;
    }


}
