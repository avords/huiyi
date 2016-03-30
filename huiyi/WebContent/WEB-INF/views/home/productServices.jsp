<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<%@page import="com.mvc.framework.util.LocaleUtils"%>
<!DOCTYPE html>
<html>
<head>
<title><jdf:message code="system_name" />-<jdf:message code="menu_service_directory" /></title>
<meta charset="utf-8">
<link rel="stylesheet" href="${dynamicDomain}/static/assets/css/directory.css">
</head>
<body>
	<div class="container directory">
		<div class="directory-wz">
			<a href="${dynamicDomain}/home"><jdf:message code="menu_home"/></a> &gt; <jdf:message code="menu_service_directory" />
		</div>
		<div class="directory-tab">
			<div class="directory-slide">
				<div class="hd">
					<ul>
						<li><jdf:message code="label_product_service_default"/></li>
						<li>A-Z</li>
					</ul>
				</div>
				<div class="bd">
					<div class="cat-box">
						<ul class="azSort">
							<c:forEach items="${categories}" var="parent">
								<c:if test="${parent.layer==1}">
								<li>
									<h3>
										<a href="${dynamicDomain}/home/search?type=1&data-value=category_name1_<%=LocaleUtils.getLocale(request).getLanguage() %>:${parent.nameZh}">${parent.nameZh}</a>
									</h3>
									<div>
										<c:forEach items="${categories}" var="category">
											<c:if test="${category.layer==2 && category.parentId == parent.objectId}">
												<a href="${dynamicDomain}/home/search?type=1&data-value=category_name1_<%=LocaleUtils.getLocale(request).getLanguage() %>:${parent.nameZh}&data-value=category_name2_<%=LocaleUtils.getLocale(request).getLanguage() %>:${category.nameZh}">${category.nameZh }</a>
											</c:if>
										</c:forEach>
									</div>
								</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
					<div class="cat-box">
						<ul class="azSort">
							<c:forEach items="${azcategories}" var="parent">
								<c:if test="${parent.layer==1}">
								<li>
									<h3>
										<a href="${dynamicDomain}/home/search?type=1&data-value=category_name1_<%=LocaleUtils.getLocale(request).getLanguage() %>:${parent.nameZh}">${parent.nameZh }</a>
									</h3>
									<p>
										<c:forEach items="${azcategories}" var="category">
											<c:if test="${category.layer==2 && category.parentId == parent.objectId}">
												<a href="${dynamicDomain}/home/search?type=1&data-value=category_name1_<%=LocaleUtils.getLocale(request).getLanguage() %>:${parent.nameZh}&data-value=category_name2_<%=LocaleUtils.getLocale(request).getLanguage() %>:${category.nameZh}">${category.nameZh }</a>
											</c:if>
										</c:forEach>
									</p>
								</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>