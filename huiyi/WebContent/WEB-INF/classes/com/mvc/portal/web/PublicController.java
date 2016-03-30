package com.mvc.portal.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/public")
public class PublicController {

    @RequestMapping(value = "checkConfirmCode")
    @ResponseBody
    public boolean checkConfirmCode(HttpServletRequest request, HttpServletResponse response,ModelMap modelMap) throws Exception {
        boolean result = true;
        String validateCode = request.getParameter("s_randomCode").toLowerCase();
        if (null == validateCode ||!validateCode.equals(request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY))) {
            result=false;
        }
        return result;
    }
}
