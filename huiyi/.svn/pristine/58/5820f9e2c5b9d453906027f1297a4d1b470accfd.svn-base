package com.mvc.framework.taglib;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.taglibs.standard.lang.support.ExpressionEvaluatorManager;

import com.mvc.util.I18NUtils;

public class I18NTag extends TagSupport {
    private static final long serialVersionUID = -3240560367949297049L;
    private static final Logger LOGGER = Logger.getLogger(I18NTag.class);
    private Object object;//对象
    private String name;//字段名称
    @Override
    public int doStartTag() throws JspException {
        HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
        name =(String) ExpressionEvaluatorManager.evaluate("name", name, String.class, this, pageContext);
        if(object==null){
            object = ExpressionEvaluatorManager.evaluate("object",object.toString(), Object.class, this, pageContext);
        }

        String content = "";
        if(object!=null&&StringUtils.isNotBlank(name)){
            content = I18NUtils.transform(object,name, request);
        }
        try {
            pageContext.getOut().write(content);
        } catch (IOException e) {
            LOGGER.error("doStartTag()", e);
        }
        return EVAL_PAGE;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public Object getObject() {
        return object;
    }
    public void setObject(Object object) {
        this.object = object;
    }
}
