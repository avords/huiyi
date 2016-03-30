<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<%@page import="com.mvc.framework.util.LocaleUtils"%>
<!DOCTYPE html>
<html>
<head>
<title><jdf:message code="system_name" />-<jdf:message code="menu_home" /></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${staticDomain}assets/css/index.css">
</head>
<body>
	<div class="container content index">
		<div class="firstScreen clearfix">
			<div class="nav-service">
				<h2>
					<jdf:message code="menu_service_directory" />
				</h2>
				<c:forEach var="item" items="${serviceDirectory}" varStatus="num">
					<dl>
						<dt>
							<a href="${dynamicDomain}/home/search?type=1&data-value=category_name1_<%=LocaleUtils.getLocale(request).getLanguage() %>:${item.nameZh}">${item.getNameZh()}</a>
							<a class="colorbox-large pull-right help-icon sNav" href="${dynamicDomain}/home/servicesList/3?ajax=1"></a>
						</dt>
						<c:forEach var="item1" items="${item.children}" varStatus="num1">
							<c:choose>
								<c:when test="${num1.index < 4 }">
									<dd>
										<a href='${dynamicDomain}/home/search?type=1&data-value=category_name1_<%=LocaleUtils.getLocale(request).getLanguage() %>:${item.nameZh}&data-value=category_name2_<%=LocaleUtils.getLocale(request).getLanguage() %>:<huiyi:i18n object="${item1}" name="name"/>'><huiyi:i18n object="${item1}" name="name" /></a>
									</dd>
								</c:when>
								<c:when test="${num1.index == 4 }">
									<dd class="more">
										<a href="${dynamicDomain}/home/productServices">More <i class="fa fa-angle-right"></i></a>
									</dd>
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
						</c:forEach>
					</dl>
				</c:forEach>
				<div class="hy-help">
					<a href="${dynamicDomain}/home/services?businessType=3"><img src="${pageContext.request.contextPath}/static/assets/img/ind_hy_help.jpg"></a>
				</div>
			</div>
			<div class="rCont">
				<div class="slide">
					<div id="slideBox" class="slideBox">
						<div class="hd">
							<ul>
								<c:forEach items="${bannerAdvert}" var="item">
									<c:if test="${item.pictureAddress != null}">
										<li></li>
									</c:if>
								</c:forEach>
							</ul>
						</div>
						<div class="bd">
							<ul>
								<c:forEach items="${bannerAdvert}" var="item">
									<c:if test="${item.pictureAddress != null}">
										<li><a href="${item.url}" target="_blank"><img src="${dynamicDomain}${item.pictureAddress}" width="885px" /></a></li>
									</c:if>
								</c:forEach>
							</ul>
						</div>
						<a class="prev" href="javascript:void(0)"></a> <a class="next" href="javascript:void(0)"></a>
					</div>
				</div>

				<!--=== 产品目录 ===-->
				<div class="nav-product clearfix">
					<div class="title">
						<h3>
							<i class="fa fa-list-ul color-purple"></i>
							<jdf:message code="menu_product_directory" />
						</h3>
						<span><a href="${dynamicDomain}/home/products">More<i class="fa fa-angle-right"></i></a></span>
					</div>
					<div class="list">
						<c:forEach var="item" items="${productDirectory}" varStatus="num">
							<c:choose>
								<c:when test="${num.index < 14 }">
									<dl>
										<dt>
											<a href="${dynamicDomain}/home/search?type=1&data-value=category_name1_<%=LocaleUtils.getLocale(request).getLanguage() %>:${item.nameZh}">${item.getNameZh()}</a>
										</dt>
										<dd>
											<c:forEach var="item1" items="${item.children}" varStatus="num1">
												<a href='${dynamicDomain}/home/search?type=1&data-value=category_name1_<%=LocaleUtils.getLocale(request).getLanguage() %>:${item.nameZh}&data-value=category_name2_<%=LocaleUtils.getLocale(request).getLanguage() %>:<huiyi:i18n object="${item1}" name="name"/>'><huiyi:i18n object="${item1}" name="name" /></a>
											</c:forEach>
										</dd>
									</dl>
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
				</div>
				<!--=== End 产品目录 ===-->
			</div>
		</div>

		<!--=== 产品推荐 ===-->
		<div class="ourProduct clearfix">
			<div class="title">
				<h3>
					<i class="fa fa-heartbeat style="color:#dfbd03;"></i><jdf:message code="label_index_product_recommend"/>
				</h3>
			</div>
			<ul>
				<c:forEach var="item" items="${recommendProducts}" varStatus="num">
					<c:choose>
						<c:when test="${num.index < 12 }">
							<li>
								<a target="_blank" href="${dynamicDomain}/home/product/detail/${item.objectId}">
										<div class="pic">
											<img src="${pageContext.request.contextPath}${item.getMainPicture()}">
										</div>
										<p title="${item.getNameZh()}" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis">${item.getNameZh()}</p>
								</a>
							</li>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
			
		</div>
		<!--=== End 产品推荐 ===-->

		<div class="index3 clearfix">

			<!--=== End 资讯 ===-->
			<div class="news">
				<div class="slideTxtBox">
					<div class="hd">
						<ul>
							<c:forEach var="item" items="${channels}">
								<c:if test="${item.firstContent!=null}">
								<li>${item.nameZh }</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
					<div class="bd">
						<c:forEach var="item" items="${channels}" varStatus="num">
							<c:if test="${item.firstContent!=null}">
							<div class="news-pic"> 
							<img src="${dynamicDomain}${item.firstContent.picPath}" width="100" height="88">
				              <dl>
				                <dt><a target="_blank" href="${dynamicDomain}/home/article/NEWS/${item.firstContent.objectId}"><huiyi:i18n object="${item.firstContent}" name="name"/></a></dt>
				                <dd><huiyi:i18n object="${item.firstContent}" name="summary"/></dd>
				              </dl>
				              <div class="clearfix"></div>
				              <ul>
				                <c:forEach var="item2" items="${item.contents}">
									<li><span class="date"><fmt:formatDate value="${item2.beginDate}" pattern="yyyy-MM-dd"/></span><a href="${dynamicDomain}/home/article/NEWS/${item2.objectId}" target="_blank"><huiyi:i18n object="${item2}" name="name"/> </a></li>
									</c:forEach>
				              </ul>
				            </div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
			<!--=== End 资讯 ===-->

			<!--=== 品牌推荐 ===-->
			<div class="brand">
				<div class="title">
					<h3>
						<i class="fa fa-diamond" style="color: #d96e4a;"></i><jdf:message code="label_index_supplier_recommend"/>
					</h3>
				</div>
				<ul>
					<c:forEach var="item" items="${recommendCompanys}" varStatus="num">
						<c:if test="${num.index < 6 }">
							<li><a href="${dynamicDomain}/home/company/index/${item.objectId}" target="_blank"><img src="${pageContext.request.contextPath}${item.getMainPicture()}" width="160" height="90"></a></li>
						</c:if>
					</c:forEach>

				</ul>
			</div>
			<!--=== End 品牌推荐 ===-->
		</div>
	</div>
</body>
</html>