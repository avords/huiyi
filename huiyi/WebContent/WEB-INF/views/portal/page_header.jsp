<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<%@page import="com.mvc.framework.util.LocaleUtils"%>
<%@page import="com.mvc.config.ApplicationConfig"%>
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
    String language = LocaleUtils.getLocale(request).getLanguage();
    request.setAttribute("language", language);
%>
<!DOCTYPE html>
<!--[if lt IE 7]>
<html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>
<html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>
<html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="zh-cn"> <!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!--[if IE]>
<meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'>
<![endif]-->
<meta http-equiv="Content-Language" content="zh-cn" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="${baseInfo.description }" />
<meta name="keywords" content="${baseInfo.keywords }" />
<title>${baseInfo.description}</title>
<!--[if lt IE 9]>
<jdf:themeFile file="ie-fixes.js" />
<jdf:themeFile file="css/ie-fixes.css" />
<jdf:themeFile file="_respond.min.js" />
<![endif]-->
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
<jdf:themeFile file="css/bootstrap.min.css" />
<jdf:themeFile file="css/font-awesome-ie7.css" />
<jdf:themeFile file="css/font-awesome-ie7.min.css" />
<jdf:themeFile file="css/font-awesome.min.css" />
<jdf:themeFile file="css/revolution_settings.css" />
<jdf:themeFile file="css/prettyPhoto.css" />
<jdf:themeFile file="css/cfam.css" />
<jdf:themeFile file="css/slides.css" />
<!--[if lte IE 8]>
<script type="text/javascript"> 
    var $buoop = {vs:{i:8,f:6,o:10.6,s:4,n:9}} 
    $buoop.ol = window.onload; 
    window.onload=function(){ 
        try {if ($buoop.ol) $buoop.ol();}catch (e) {} 
        var e = document.createElement("script");
        e.setAttribute("type", "text/javascript"); 
        e.setAttribute("src", "http://browser-update.org/update.js"); 
        document.body.appendChild(e); 
    } 
</script> 
<![endif]-->
<!--[if lt IE 9]>
<jdf:themeFile file="html5.js"/>
<jdf:themeFile file="respond.min.js"/>
<![endif]-->
<jdf:themeFile file="My97DatePicker/WdatePicker.js" />
<jdf:themeFile file="jquery.min.js" />
<jdf:themeFile file="jquery-migrate-1.2.1.min.js" />
<jdf:themeFile file="bootstrap.min.js" />
<jdf:themeFile file="activeaxon_menu.js" />
<jdf:themeFile file="jquery.cookie.js" />
<jdf:themeFile file="common.js" />
<jdf:themeFile file="cfam.js" />
<jdf:themeFile file="jquery.prettyPhoto.js" />
<jdf:themeFile file="jquery.themepunch.revolution.js" />
<jdf:themeFile file="jquery.themepunch.tools.min.js" />
<jdf:themeFile file="jquery.themepunch.plugins.min.js" />
<jdf:themeFile file="jquery.slides.min.js" />
<jdf:themeFile file="jquery.validate.js" />
<jdf:themeFile file="formvalidator4.1.3/formValidatorRegex.js" />
<jdf:themeFile file="formvalidator4.1.3/formValidator-4.1.3.js" />
