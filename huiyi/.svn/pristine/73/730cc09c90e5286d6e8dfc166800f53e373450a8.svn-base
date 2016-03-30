package com.mvc.framework.web;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.HYConstants;
import com.mvc.framework.util.DomainUtils;
import com.mvc.member.model.Member;

/**
 * 处理访问不需要登录的链接时，尝试获取用户信息,获取不到不做任何处理
 * 
 * @author Bob.Pu
 *
 */
public class MemberFilter implements Filter {

	public void destroy() {
	}

	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		if ((servletRequest instanceof HttpServletRequest) && (servletResponse instanceof HttpServletResponse)) {
			HttpServletRequest request = (HttpServletRequest) servletRequest;
			HttpServletResponse response = (HttpServletResponse) servletResponse;
			Member member = (Member) request.getSession().getAttribute(HYConstants.SESSION_MEMBER);
			// 未登录
			if (member == null) {
				response.sendRedirect(DomainUtils.getDynamicDomain() + "/home/login");
			} else {
				filterChain.doFilter(servletRequest, servletResponse);
			}
		}
	}

	public void init(FilterConfig filterConfig) throws ServletException {

	}

}
