package com.mvc.framework.web;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.mvc.HYConstants;
import com.mvc.framework.util.DomainUtils;
import com.mvc.member.model.Company;
import com.mvc.member.model.Member;
import com.mvc.member.service.CompanyManager;
import com.mvc.search.util.I18NUtils;

public class ProductPublishFilter implements Filter{
    private CompanyManager companyManager;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        ServletContext context = filterConfig.getServletContext();
        ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(context);
        companyManager = (CompanyManager) ctx.getBean("companyManager");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {
        if ((servletRequest instanceof HttpServletRequest) && (servletResponse instanceof HttpServletResponse)) {
            HttpServletRequest request = (HttpServletRequest) servletRequest;
            HttpServletResponse response = (HttpServletResponse) servletResponse;
            Member member = (Member) request.getSession().getAttribute(HYConstants.SESSION_MEMBER);
            //没有维护企业信息或者企业信息没通过审核
            String message = "";
            Long companyId = member.getCompanyId();
            companyManager.update(companyId);
            Company company = companyManager.getByObjectId(companyId);
            if(member.getCompanyId()==null||company==null){
                message = I18NUtils.transformName("请先维护企业信息", "Please first maintain enterprise information", request.getLocale());
                response.sendRedirect(DomainUtils.getDynamicDomain() + "/member/modifyCompany?message="+message);
            }else if(company.getStatus()!=Company.COMPANY_STATUS_PASSED){
                message = I18NUtils.transformName("企业不在审核通过状态", "Enterprises are not audited by the state", request.getLocale());
                response.sendRedirect(DomainUtils.getDynamicDomain() + "/member/modifyCompany?message="+message);
            }
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {
    }

}
