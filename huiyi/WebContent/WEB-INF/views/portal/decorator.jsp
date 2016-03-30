<%@page import="com.mvc.config.ApplicationConfig"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<%@page import="com.mvc.framework.util.DomainUtils"%>
<%@page import="com.mvc.framework.FrameworkConstants"%>
<%@page import="com.mvc.security.model.LoginLog"%>
<%@page import="com.mvc.security.SecurityConstants"%>
<%@page import="com.mvc.framework.config.GlobalConfig"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Language" content="zh-cn" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<title><decorator:title default="Welcome!" /></title>
<decorator:head />
<jdf:themeFile file="css/admin.css" />
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
</head>
<body class="no-skin">
	<div id="navbar" class="navbar navbar-default navbar-fixed-top">
		<script type="text/javascript">
			try {
				ace.settings.check('navbar', 'fixed')
			} catch (e) {
			}
		</script>
		<div class="navbar-container" id="navbar-container">
			<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler">
				<span class="sr-only">切换</span> <span class="icon-bar"></span>
				<span class="icon-bar"></span><span class="icon-bar"></span>
			</button>

			<div class="navbar-header pull-left">
				<a href="${dynamicDomain}/home" class="navbar-brand" target="_blank"> 
					<img alt="" src="${staticDomain}assets/img/logo.png" height="25">
				</a>
			</div>
			<ul class="nav navbar-nav">
				<c:forEach varStatus="num" var="item" items="${tops}">
					<li class="menu"><a class="menu" moduleId="${item.objectId}" href="${dynamicDomain}/admin/wait/${item.objectId}">
						<jdf:message code="${item.name}" /></a>
					</li>
				</c:forEach>
			</ul>
			<div class="navbar-buttons navbar-header pull-right" role="navigation">
				<ul class="nav ace-nav">
					<li class="light-blue">
						<a data-toggle="dropdown" href="#" class="dropdown-toggle">
							<span class="glyphicon glyphicon-user"></span> ${s_user.userName } 
							<i class="ace-icon fa fa-caret-down"></i>
						</a>
						<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
							<li>
								<a class="colorbox" href="${dynamicDomain}/admin/user/changePassword?ajax=1"><span class="glyphicon glyphicon-wrench"></span> <jdf:message code="system.lable.user.change_password" /></a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="javascript:logOut(<%=LoginLog.LOGOUT_BY_MANUAL%>)"><span class="glyphicon glyphicon-off"></span> 退出 </a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<!-- /.navbar-container -->
	</div>
	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>

		<div id="sidebar" class="sidebar  responsive sidebar-fixed">
			<script type="text/javascript">
				try {
					ace.settings.check('sidebar', 'fixed')
				} catch (e) {
				}
			</script>
			<div class="sidebar-shortcuts" id="sidebar-shortcuts">
				<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
					<button class="btn btn-info">
                        <i class="ace-icon glyphicon glyphicon-bullhorn"></i>
                    </button>
					<button class="btn btn-success">
                        <i class="ace-icon glyphicon glyphicon-th-list"></i>
                    </button>
                    <button class="btn btn-warning">
                        <i class="ace-icon glyphicon glyphicon-hand-left"></i>
                    </button>

                    <button class="btn btn-danger">
                        <i class="ace-icon glyphicon glyphicon-user "></i>
                    </button>
				</div>
				<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
					<span class="btn btn-success"></span> <span class="btn btn-info"></span>

					<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
				</div>
			</div>
			<!-- /.sidebar-shortcuts -->
			<ul class="nav nav-list">
				${treeHtml}
			</ul>
			<!-- /.nav-list -->
			<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
				<i class="ace-icon fa fa-angle-double-left"
					data-icon1="ace-icon fa fa-angle-double-left"
					data-icon2="ace-icon fa fa-angle-double-right"></i>
			</div>
			<script type="text/javascript">
// 				var url = window.location.pathname;
// 				$(".nav li a").each(function (e){
// 					if(this.href.endsWith(url)){
// 						$(this).parent().addClass("active");
// 						$(this).parent().parent().parent("li").addClass("active open");
// 					}
// 				});
                //var url = window.location.pathname;
                
				try {
					//ace.settings.check('sidebar', 'collapsed')
				} catch (e) {
				}
				$(function(){
					var menuUrl = $.cookie('menuUrl');
	                $(".nav li a").each(function (e){
	                    if(menuUrl!=null&&menuUrl.endsWith($(this).attr('href'))){
	                        $(this).parent().addClass("active");
	                        $(this).parent().parent().parent("li").addClass("active open");
	                    }
	                });
					$(".nav li a").click(function(){
	                    var menuUrl = $(this).attr('href');
	                    $.cookie('menuUrl', menuUrl,{path:'/'});
	                });
				});
			</script>
		</div>
		<div class="main-content">
			<div class="page-content">
				<decorator:body/>
			</div>
		</div>
		<!-- /.main-content -->
		<div class="footer">
			<div class="footer-inner">
				<div class="footer-content">
					<span class=""> 
						<a href="http://www.wanjiaqiao.com" target="_blank">汇医网</a> Copyright 2014-2020
					</span>
				</div>
			</div>
		</div>
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-container -->
	<jdf:themeFile file="main-page.js" />
</body>
</html>