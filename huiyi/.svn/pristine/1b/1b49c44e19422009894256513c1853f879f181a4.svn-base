package com.mvc.portal.web;

import java.util.Date;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.framework.FrameworkConstants;
import com.mvc.framework.config.GlobalConfig;
import com.mvc.framework.util.CookieUtils;
import com.mvc.framework.util.FrameworkContextUtils;
import com.mvc.framework.util.IpUtils;
import com.mvc.framework.util.LocaleUtils;
import com.mvc.framework.util.MessageUtils;
import com.mvc.framework.web.FrameworkFilter;
import com.mvc.portal.model.LoginError;
import com.mvc.portal.model.OnlineUser;
import com.mvc.portal.model.Theme;
import com.mvc.portal.service.LoginErrorManager;
import com.mvc.portal.service.LoginManager;
import com.mvc.portal.service.OnlineUserManager;
import com.mvc.portal.service.ThemeManager;
import com.mvc.security.SecurityConstants;
import com.mvc.security.model.LoginLog;
import com.mvc.security.model.LoginResult;
import com.mvc.security.model.User;
import com.mvc.security.service.LoginLogManager;
import com.mvc.security.service.UserManager;
import com.mvc.security.util.SecurityUtils;

@Controller
@RequestMapping("/login")
public class LoginController {

    private static final Logger LOGGER = Logger.getLogger(LoginController.class);
    @Autowired
    private UserManager userManager;

    @Autowired
    private LoginManager loginManager;
    @Autowired
    private ThemeManager themeManager;
    @Autowired
    private OnlineUserManager onlineUserManager;
    @Autowired
    private LoginErrorManager loginErrorManager;
    @Autowired
    private LoginLogManager loginLogManager;

    @RequestMapping(value = "in")
    public String index(HttpServletRequest request, HttpServletResponse response, User user) {
        LocaleUtils.setSpringLocale(request.getSession(), new Locale("zh", "CN"));
        String message = "";
        if (null != request.getSession().getAttribute(SecurityConstants.SECURITY_TOKEN)) {
            return "redirect:/admin/main/2";
        }
        if (null != user) {
            if (null != user.getLoginName()) {
                LoginLog loginLog = loginManager.beginLog(user);
                loginLog.setIp(IpUtils.getRealIp(request));
                boolean bool = checkUserLoginError(request, user);
                if (bool) {
                    boolean pass = userManager.authentication(user);
                    if (pass) {
                        loginSuccess(request, response, user, loginLog);
                        saveOnlineUser(request, user, loginLog);
                        return "redirect:/admin/main/2";
                    } else {
                        message = MessageUtils.getMessage("login.wrongLoginNameOrPassword",request);
                        loginLog.setResult(LoginLog.LOGIN_RESULT_FAIL);
                        saveLoginError(request, user);
                    }
                } else {
                    loginLog.setResult(LoginLog.LOGIN_RESULT_FAIL);
                    request.setAttribute(FrameworkConstants.MESSAGE, message = MessageUtils.getMessage(LoginResult.LOGIN_LOCKED.message,request));
                    saveLoginError(request, user);
                }
                loginManager.createLog(loginLog);
            }
        } else {
            message = request.getParameter("message");
        }
        String skin = CookieUtils.getCookieByName(request.getCookies(), FrameworkConstants.SKIN);
        if (StringUtils.isBlank(skin)) {
            skin = FrameworkConstants.DEFAULT_SKIN;
        }
        request.getSession().setAttribute(FrameworkConstants.SKIN, skin);
        request.setAttribute("message", message);
        return "portal/login";
    }

    private void loginSuccess(HttpServletRequest request, HttpServletResponse response, User user,
            final LoginLog loginLog) {
        loginLog.setResult(LoginLog.LOGIN_RESULT_SUCCESS);
        HttpSession session = request.getSession();
        String token = SecurityUtils.generateSecurityToken(user.getLoginName());
        User realUser = userManager.getUserByLoginName(user.getLoginName());
        user.setObjectId(realUser.getObjectId());
        session.setAttribute("userDepartmentName", "ALL");

        loginLog.setUserId(realUser.getObjectId());
        // delete login error log if logined.
        loginErrorManager.deleteByWhere(" local_Ip = '" + loginLog.getIp() + "' AND login_Name = '"
                + realUser.getLoginName() + "'");

        Theme theme = themeManager.getThemeByUserId(realUser.getObjectId());
        String skin = FrameworkConstants.DEFAULT_SKIN;
        if (null != theme) {
            skin = theme.getSkin();
        }
        CookieUtils.setCookie(response, FrameworkConstants.SKIN, skin);
        CookieUtils.setUserTokenCookie(response, token);
        CookieUtils.setEncodedCookie(response, SecurityConstants.LOGIN_NAME, realUser.getLoginName());
        session.setAttribute(SecurityConstants.SECURITY_TOKEN, token);
        FrameworkFilter.setUserToSession(request, response, token, skin);
        realUser = (User) session.getAttribute(SecurityConstants.SESSION_USER);

        session.setAttribute(SecurityConstants.SESSION_USER, realUser);
        loginManager.createLog(loginLog);
    }

    private void saveLoginError(HttpServletRequest request, User user) {
        LoginError loginError = new LoginError();
        loginError.setLocalIp(IpUtils.getRealIp(request));
        loginError.setLoginName(user.getLoginName());
        loginError.setLoginDate(new Date());
        loginErrorManager.save(loginError);
    }

    private void saveOnlineUser(HttpServletRequest request, User user, LoginLog loginLog) {
        if(loginLog.getResult() ==LoginLog.LOGIN_RESULT_SUCCESS){
            OnlineUser onlineUser = onlineUserManager.getOnlineByUserId(user.getObjectId(), null);
            if(onlineUser != null){
                onlineUserManager.save(onlineUser);
            }
            OnlineUser currentOnlineUser = new OnlineUser();
            currentOnlineUser.setBeginDate(loginLog.getBeginDate());
            currentOnlineUser.setUserId(user.getObjectId());
            currentOnlineUser.setUserName(user.getUserName());
            currentOnlineUser.setSessionId(request.getSession().getId());
            currentOnlineUser.setStatus(OnlineUser.STATUS_ONLINE);
            Date visiteDate = loginLogManager.getMaxVisiteByUserId(user.getObjectId());
            currentOnlineUser.setVisiteDate(visiteDate);
            onlineUserManager.save(currentOnlineUser);
        }
    }

    private boolean checkUserLoginError(HttpServletRequest request, User user) {
        Boolean bool = false;
        int count = loginErrorManager.getSuccessionLoginErrorCount(user.getLoginName(), IpUtils.getRealIp(request));
        if (count >= 5) {
            /**
             * return true if exceeds 30 minutes. can do: given IP can't loging,
             * given IP can't login again.
             */
            bool = loginErrorManager.isOutOfRestrictTime(user.getLoginName(), IpUtils.getRealIp(request));
            if (bool) {
                loginErrorManager.deleteByWhere(" local_Ip = '" + IpUtils.getRealIp(request) + "' AND login_Name = '"
                        + user.getLoginName() + "'");
            }
        } else {
            bool = true;
        }
        return bool;
    }

    @RequestMapping(value = "out")
    public String loginOut(HttpServletRequest request,HttpServletResponse response) throws Exception {
        Integer logoutFrom = null;
        if(request.getParameter("logoutFrom")!=null){
            try{
                logoutFrom = Integer.parseInt(request.getParameter("logoutFrom"));
            }catch ( Exception e){
            }
        }
        if(logoutFrom==null){
//          logoutFrom = LoginLog.LOGOUT_BY_MANUAL;
        }
        onlineUserManager.deleteOnlineUser(FrameworkContextUtils.getCurrentUserId(), logoutFrom);
        for (Cookie cookie : request.getCookies()) {
            Cookie deleted = new Cookie(cookie.getName(), null);
            deleted.setMaxAge(0);
            deleted.setDomain(GlobalConfig.getCookieDomain());
            deleted.setPath(GlobalConfig.getCookiePath());
            response.addCookie(deleted);
        }
        request.getSession().invalidate();
        return "redirect:/login/in";
    }

}
