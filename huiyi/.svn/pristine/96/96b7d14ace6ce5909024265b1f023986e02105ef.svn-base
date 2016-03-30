package com.mvc.home.web;

import java.util.Date;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.HYConstants;
import com.mvc.framework.FrameworkConstants;
import com.mvc.framework.config.GlobalConfig;
import com.mvc.framework.util.CookieUtils;
import com.mvc.framework.util.IpUtils;
import com.mvc.framework.util.LocaleUtils;
import com.mvc.framework.util.MessageUtils;
import com.mvc.member.model.Member;
import com.mvc.member.model.ValidateCode;
import com.mvc.member.service.MemberManager;
import com.mvc.member.service.ValidateCodeManager;
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
import com.mvc.security.service.LoginLogManager;
import com.mvc.security.util.SecurityUtils;

@Controller
@RequestMapping("/home/login")
public class HomeLoginController {

	private static final String BASE_DIR = "home/";

	@Autowired
	private MemberManager memberManager;
	
	@Autowired
	private LoginManager loginManager;
	
	@Autowired
	private LoginErrorManager loginErrorManager;
	
	@Autowired
	private ThemeManager themeManager;
	
	@Autowired
    private OnlineUserManager onlineUserManager;
	
	@Autowired
	private LoginLogManager loginLogManager;
	
	@Autowired
	private ValidateCodeManager validateCodeManager;

	/**
	 * 登录
	 */
	@RequestMapping("")
	public String login(HttpServletRequest request, HttpServletResponse response, Member member) {
		String message = "";
		String skin = CookieUtils.getCookieByName(request.getCookies(), FrameworkConstants.SKIN);
		if (StringUtils.isBlank(skin)) {
			skin = FrameworkConstants.DEFAULT_SKIN;
		}
		request.getSession().setAttribute(FrameworkConstants.SKIN, skin);

		if (null != member) {
			if (null != member.getLoginName()) {
				LoginLog loginLog = loginManager.beginLog(member);
				loginLog.setIp(IpUtils.getRealIp(request));
				boolean bool = checkMemberLoginError(request, member);
				Member realUser = memberManager.getMemberByLoginName(member.getLoginName());
				if (realUser == null || realUser.getStatus() == null
						|| realUser.getStatus() == Member.STATUS_ABNORMAL) {
					request.setAttribute("message", "用户失效，请联系管理员");
					loginLog.setResult(LoginLog.LOGIN_RESULT_FAIL);
					saveLoginError(request, member);
					return "home/login";
				}
				if (bool) {
					boolean pass = memberManager.authentication(member);
					if (pass) {
						loginSuccess(request, response, member, loginLog);
						saveOnlineUser(request, member, loginLog);
						return "redirect:../home";
					} else {
						message = MessageUtils.getMessage("login.wrongLoginNameOrPassword", request);
						loginLog.setResult(LoginLog.LOGIN_RESULT_FAIL);
						saveLoginError(request, member);
					}
				} else {
					loginLog.setResult(LoginLog.LOGIN_RESULT_FAIL);
					message = LoginResult.LOGIN_LOCKED.message;
					saveLoginError(request, member);
				}
				loginManager.createLog(loginLog);
			} else {
				member.setLoginName(CookieUtils.getEncodedCookieByName(request.getCookies(), HYConstants.M_LOGIN_NAME));
				member.setPassword(CookieUtils.getEncodedCookieByName(request.getCookies(), HYConstants.M_PASSWORD));
			}
		} else {
			message = request.getParameter("message");
		}

		request.setAttribute("message", message);
		return "home/login";
	}

	/**
	 * 验证登录邮箱是否存在
	 */
	@RequestMapping("/checkMemberName")
	@ResponseBody
	public boolean checkMemberName(HttpServletRequest request, HttpServletResponse response) {
		boolean result = true;
		String loginName = request.getParameter("loginName");
		result = memberManager.checkMemberName(loginName);
		return !result;
	}

	private void saveOnlineUser(HttpServletRequest request, Member member, LoginLog loginLog) {
		if (loginLog.getResult() == LoginLog.LOGIN_RESULT_SUCCESS) {
			OnlineUser onlineUser = onlineUserManager.getOnlineByUserId(member.getObjectId(), null, OnlineUser.TYPE_MEMBER);
			if (onlineUser != null) {
				onlineUserManager.save(onlineUser);
			}
			OnlineUser currentOnlineUser = new OnlineUser();
			currentOnlineUser.setBeginDate(loginLog.getBeginDate());
			currentOnlineUser.setUserId(member.getObjectId());
			currentOnlineUser.setUserName(member.getLoginName());
			currentOnlineUser.setSessionId(request.getSession().getId());
			currentOnlineUser.setStatus(OnlineUser.STATUS_ONLINE);
			currentOnlineUser.setUserType(OnlineUser.TYPE_MEMBER);
			Date visiteDate = loginLogManager.getMaxVisiteByUserId(member.getObjectId());
			currentOnlineUser.setVisiteDate(visiteDate);
			onlineUserManager.save(currentOnlineUser);
		}
	}

	private void setMemberToSession(HttpServletRequest request, HttpServletResponse response, String cookieToken,
			String skin) {
		String loginName = SecurityUtils.getLoginNameFromSecurityToke(cookieToken);
		Member member = memberManager.getMemberByLoginName(loginName);
		if (member != null) {
			HttpSession session = request.getSession();
			session.setAttribute(SecurityConstants.SECURITY_TOKEN, cookieToken);
			session.setAttribute(HYConstants.M_LOGIN_NAME, loginName);
			session.setAttribute(SecurityConstants.FULL_NAME, member.getLoginName());
			session.setAttribute(HYConstants.MEMBER_ID, member.getObjectId());
			session.setAttribute(HYConstants.SESSION_MEMBER, member);

			CookieUtils.setEncodedCookie(response, HYConstants.MEMBER_ID, String.valueOf(member.getObjectId()));
			if (null == skin) {
				skin = CookieUtils.getCookieByName(request.getCookies(), FrameworkConstants.SKIN);
			}
			if (StringUtils.isBlank(skin)) {
				skin = FrameworkConstants.DEFAULT_SKIN;
			}
			session.setAttribute(FrameworkConstants.SKIN, skin);
		}
	}

	private void loginSuccess(HttpServletRequest request, HttpServletResponse response, Member member,
			final LoginLog loginLog) {
		loginLog.setResult(LoginLog.LOGIN_RESULT_SUCCESS);
		HttpSession session = request.getSession();
		String token = SecurityUtils.generateSecurityToken(member.getLoginName());
		Member realUser = memberManager.getMemberByLoginName(member.getLoginName());
		member.setObjectId(realUser.getObjectId());
		session.setAttribute(HYConstants.MEMBER_ID, realUser.getObjectId());

		loginLog.setUserId(realUser.getObjectId());
		loginErrorManager.deleteByWhere(" local_Ip = '" + loginLog.getIp() + "' AND login_Name = '" + realUser.getLoginName() + "'");

		Theme theme = themeManager.getThemeByUserId(realUser.getObjectId());
		String skin = FrameworkConstants.DEFAULT_SKIN;
		if (null != theme) {
			skin = theme.getSkin();
		}
		CookieUtils.setCookie(response, FrameworkConstants.SKIN, skin);
		CookieUtils.setUserTokenCookie(response, token);
		String remember = request.getParameter("remember");
		if (remember != null && "on".equals(remember)) {
			CookieUtils.setEncodedCookie(response, HYConstants.M_LOGIN_NAME, realUser.getLoginName(), 15 * 24 * 3600);
			CookieUtils.setEncodedCookie(response, HYConstants.M_PASSWORD, member.getPassword(), 15 * 24 * 3600);
		}
		session.setAttribute(SecurityConstants.SECURITY_TOKEN, token);
		setMemberToSession(request, response, token, skin);
		realUser = (Member) session.getAttribute(HYConstants.SESSION_MEMBER);
		session.setAttribute(HYConstants.SESSION_MEMBER, realUser);
		loginManager.createLog(loginLog);
	}

	private void saveLoginError(HttpServletRequest request, Member member) {
		LoginError loginError = new LoginError();
		loginError.setLocalIp(IpUtils.getRealIp(request));
		loginError.setLoginName(member.getLoginName());
		loginError.setLoginDate(new Date());
		loginErrorManager.save(loginError);
	}

	private boolean checkMemberLoginError(HttpServletRequest request, Member member) {
		Boolean bool = false;
		int count = loginErrorManager.getSuccessionLoginErrorCount(member.getLoginName(), IpUtils.getRealIp(request));
		if (count >= 5) {
			bool = loginErrorManager.isOutOfRestrictTime(member.getLoginName(), IpUtils.getRealIp(request));
			if (bool) {
				loginErrorManager.deleteByWhere(" local_Ip = '" + IpUtils.getRealIp(request) + "' AND login_Name = '" + member.getLoginName() + "'");
			}
		} else {
			bool = true;
		}
		return bool;
	}

	/**
	 * 忘记密码
	 */
	@RequestMapping("/findPassword")
	public String findPassword(HttpServletRequest request) {
		return "home/findPassword";
	}
	
	/**
	 * 重置密码
	 */
	@RequestMapping("/reset")
	public String reset(HttpServletRequest request) {
		String loginName = request.getParameter("loginName");
		request.setAttribute("loginName", loginName);
		return "home/resetPassword";
	}
	
	@RequestMapping("/update")
	public String update(HttpServletRequest request) {
		String loginName = request.getParameter("loginName");
		validateCodeManager.clearValidateRecords(loginName, ValidateCode.VALIDATE_TYPE_FIND);

		String passwrod = request.getParameter("password");
		Member member = memberManager.getMemberByLoginName(loginName);
		member.setPassword(SecurityUtils.generatePassword(passwrod));
		memberManager.save(member);

		return "/home/login";
	}
	
	/**
	 * 退出
	 */
	@RequestMapping(value = "out")
	public String loginOut(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Integer logoutFrom = null;
		if (request.getParameter("logoutFrom") != null) {
			try {
				logoutFrom = Integer.parseInt(request.getParameter("logoutFrom"));
			} catch (Exception e) {
			}
		}
		if (logoutFrom == null) {
			logoutFrom = LoginLog.LOGOUT_BY_MANUAL;
		}
		Long memberId = null;
		try {
			memberId = Long.parseLong(request.getSession().getAttribute(HYConstants.M_LOGIN_NAME).toString());
		} catch (Exception e) {
		}

		onlineUserManager.deleteOnlineUser(memberId, logoutFrom, OnlineUser.TYPE_MEMBER);
		for (Cookie cookie : request.getCookies()) {
			Cookie deleted = new Cookie(cookie.getName(), null);
			deleted.setMaxAge(0);
			deleted.setDomain(GlobalConfig.getCookieDomain());
			deleted.setPath(GlobalConfig.getCookiePath());
			response.addCookie(deleted);
		}
		request.getSession().invalidate();
		return "redirect:/home/login";
	}
}
