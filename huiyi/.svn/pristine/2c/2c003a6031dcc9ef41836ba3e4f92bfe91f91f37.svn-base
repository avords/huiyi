package com.mvc.framework.taglib;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.taglibs.standard.lang.support.ExpressionEvaluatorManager;

import com.mvc.util.I18NUtils;

public class I18NTag extends TagSupport {
    private static final long serialVersionUID = -3240560367949297049L;
    private static final Logger LOGGER = Logger.getLogger(I18NTag.class);
    private String object;//对象
    private String name;//字段名称
    @Override
    public int doStartTag() throws JspException {
        HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
        HttpSession session = pageContext.getSession();
        name =(String) ExpressionEvaluatorManager.evaluate("name", name, String.class, this, pageContext);
        String objectStr = (String) ExpressionEvaluatorManager.evaluate("object",object, Object.class, this, pageContext);
        Object obj = request.getAttribute(objectStr);
        if (obj == null) {
            obj = session.getAttribute(objectStr);
        }
        if (obj == null) {
            obj = pageContext.getAttribute(objectStr);
        }
        String content = "";
        if(obj!=null&&StringUtils.isNotBlank(name)){
            content = I18NUtils.transform(obj,name, request);
        }
        try {
            pageContext.getOut().write(content);
        } catch (IOException e) {
            LOGGER.error("doStartTag()", e);
        }
        return EVAL_PAGE;
    }
    public Object getObject() {
        return object;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setObject(String object) {
        this.object = object;
    }

}
