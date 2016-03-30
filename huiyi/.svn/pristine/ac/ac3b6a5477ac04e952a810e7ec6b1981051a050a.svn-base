<%@page import="com.mvc.security.SecurityConstants"%>
<%@page import="com.mvc.framework.config.GlobalConfig"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="com.mvc.framework.FrameworkConstants"%>
<%@page import="com.mvc.framework.util.DomainUtils"%>
<%@ include file="taglibs.jsp"%>
<%
	String dynamicDomain = DomainUtils.getDynamicDomain();
    request.setAttribute("dynamicDomain",dynamicDomain);
	String message = request.getParameter(FrameworkConstants.MESSAGE);
	if (message == null) {
		message = String.valueOf(request.getAttribute(FrameworkConstants.MESSAGE));
	}
	if (message == null || "null".equals(message)) {
		message = "";
	}
	request.setAttribute("message", message);
%>
<!DOCTYPE html>
<%@page import="com.mvc.framework.FrameworkConstants"%>
<%@page import="com.mvc.framework.util.DomainUtils"%>
<html>
<head>
<jdf:themeFile file="css/bootstrap.min.css" />
<jdf:themeFile file="css/extremecomponents.css" />
<jdf:themeFile file="css/prettify.css" />
<jdf:themeFile file="css/jquery-ui-1.10.4.custom.min.css" />
<jdf:themeFile file="css/font-awesome.min.css" />
<jdf:themeFile file="css/bootstrap-datepicker.css" />
<jdf:themeFile file="css/bootstrap-datetimepicker.css" />
<jdf:themeFile file="My97DatePicker/WdatePicker.js" />
<jdf:themeFile file="css/prettyCheckable.css" />
<jdf:themeFile file="css/select2.css" />
<jdf:themeFile file="css/ace.min.css" />
<!--[if lte IE 9]>
<jdf:themeFile file="css/ace-part2.min.css" />
<![endif]-->
<jdf:themeFile file="css/ace-skins.min.css" />
<jdf:themeFile file="css/ace-rtl.min.css" />
<!--[if lte IE 9]>
<jdf:themeFile file="css/ace-ie.min.css" />
<![endif]-->
<!-- imgareaselect-css -->
<jdf:themeFile file="css/imgareaselect-animated.css" />

<jdf:themeFile file="css/colorbox.css" />
<jdf:themeFile file="css/admin.css" />
<jdf:themeFile file="css/custom.css"/>
<jdf:themeFile file="ace-extra.min.js"/>
<!--[if lt IE 9]>
<jdf:themeFile file="html5.js"/>
<jdf:themeFile file="respond.min.js"/>
<![endif]-->

<!-- start: JavaScript-->
<!--[if !IE]>-->
<jdf:themeFile file="jquery.min.js"/>
<!--<![endif]-->

<!--[if IE]>
	<jdf:themeFile file="jquery-1.11.1.min.js"/>
<![endif]-->
<script type="text/javascript">
	if('ontouchstart' in document.documentElement) document.write("<script src='${dynamicDomain}/static/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>
<jdf:themeFile file="jquery-migrate-1.2.1.min.js"/>	
<jdf:themeFile file="bootstrap.min.js" />
<jdf:themeFile file="prettify.js" />
<jdf:themeFile file="jquery.colorbox.min.js" />
<jdf:themeFile file="jquery.metadata.js" />
<jdf:themeFile file="jquery.validate.min.js" />
<jdf:themeFile file="additional-methods_zh.js" />
<jdf:themeFile file="jquery.validate_zh.js" />
<jdf:themeFile file="jquery-ui-1.10.4.custom.min.js" />
<jdf:themeFile file="jquery.tooltipster.min.js" />
<jdf:themeFile file="bootstrap-datepicker.js"/>
<jdf:themeFile file="bootstrap-datetimepicker.min.js"/>
<jdf:themeFile file="prettyCheckable.min.js"/>
<jdf:themeFile file="select2.js"/>
<jdf:themeFile file="bootstrap.file-input.js"/>
<jdf:themeFile file="jquery.cookie.js"/>
<jdf:themeFile file="ace-elements.min.js"/>
<jdf:themeFile file="ace.min.js"/>

<jdf:themeFile file="jquery.imgareaselect.pack.js" />

<script type="text/javascript">
	var processMessage = "<jdf:message code="system.lable.process"/>";
	var sureToDelete="<jdf:message code="common.js.sureToDelete"/>";
</script>
<jdf:themeFile file="admin.js" />
<jdf:themeFile file="common.js" />
<script type="text/javascript">
var loginUrl = "<%=GlobalConfig.getLoginUrl()%>";
var appRoot = "${dynamicDomain}";
var cookiePath = "<%=GlobalConfig.getCookiePath()%>";
var cookieDomain = "<%=GlobalConfig.getCookieDomain()%>";
var sessionName = "<%=GlobalConfig.getSessionName()%>";
var tokenName = "<%=SecurityConstants.SECURITY_TOKEN%>";
var timeoutOfLogout = 10;
var currentModuleId = "${currentModuleId}";
</script>