<%@page import="com.mvc.config.ApplicationConfig"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<%@page import="com.mvc.framework.util.DomainUtils"%>
<%@page import="com.mvc.framework.FrameworkConstants"%>
<%@page import="com.mvc.security.model.LoginLog"%>
<%@page import="com.mvc.security.SecurityConstants"%>
<%@page import="com.mvc.framework.config.GlobalConfig"%>
<%@page import="java.util.List"%>
<%@page import="com.mvc.framework.model.Dictionary"%>

<%
	String dynamicDomain = DomainUtils.getDynamicDomain();
	request.setAttribute("dynamicDomain", dynamicDomain);
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Language" content="zh-cn" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><decorator:title default="Welcome!" /></title>
<decorator:head />
<script type="text/javascript">
var loginUrl = "<%=GlobalConfig.getLoginUrl()%>";
var appRoot = "${dynamicDomain}";
var cookiePath = "<%=GlobalConfig.getCookiePath()%>";
var cookieDomain = "<%=GlobalConfig.getCookieDomain()%>";
var sessionName = "<%=GlobalConfig.getSessionName()%>";
var tokenName = "<%=SecurityConstants.SECURITY_TOKEN%>";
var timeoutOfLogout = 10;
</script>
<jdf:themeFile file="css/bootstrap.dropdown.hack.css" />
<jdf:themeFile file="css/home.css" />
<jdf:themeFile file="bootstrap-dropdown.js" />
</head>
<body>
	<div id="header">
		<div class="navbar navbar-fixed-top" data-dropdown="dropdown">
			<div class="navbar-inner">
				<div class="container-fluid">
					<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
						<span class="icon-bar"></span> 
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</a>
					<a class="brand" href="${dynamicDomain}/index"><i class="icon-home"></i><jdf:message code="system.menu.home"/></a>
					<ul class="nav secondary-nav">${menuTree}</ul>
					<ul class="nav pull-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-user"></i>${s_loginName}</a>
							<ul class="dropdown-menu">
								<li><a class="colorbox-mini" href="${dynamicDomain}/user/changePassword?ajax=1"><i class="icon-key"></i><jdf:message code="system.lable.user.change_password"/></a></li>
								<li class="divider"></li>
								<li><a href="javascript:logOut(<%=LoginLog.LOGOUT_BY_MANUAL%>)"><i class=" icon-off"></i><jdf:message code="common.login.out"/></a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<div id="content">
		<div class="container">
			<div class="row">
				<div class="span12">
					<div id="error"></div>
					<div id="success"></div>
					<div id="notice"></div>
					<div id="loading"></div>
					<decorator:body />
				</div>
			</div>
		</div>
	</div>
		
	<div id="footer">
		<div class="container">
			<div class="row">
				<div class="span12">
					<div class="divider"></div>
					<div class="pull-right">
						<p>Neefull</p>
					</div>
					<div class="pull-left">
						<p>&copy; 2013-2018 Neefull. All Rights Reserved.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jdf:themeFile file="main-page.js"/>
</body>
</html>