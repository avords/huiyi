<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!doctype html>
<html>
<head>
<title><jdf:message code="menu_platform_service" /></title>
<link rel="stylesheet"
	href="${dynamicDomain}/static/assets/css/list.css">
<style type="text/css">
</style>
</head>
<body>
	<div class="container hy-service">
		<c:if test="${not empty services_2}">
		<div class="headline">
			<h2><jdf:message code="btn_main_supplier_center" /></h2>
		</div>
		<div class="row">
			<c:forEach items="${services_2}" var="asl">
				<div class="col-md-4">
					<div class="view view-tenth">
						<img src="${dynamicDomain}${asl.mainPicture}"
							class="img-responsive">
						<div class="mask">
							<h3>
								<a href="${dynamicDomain}/home/serviceDetail/${asl.objectId}"><huiyi:i18n name="name" object="${asl}"/></a>
							</h3>
							<div class="btn-more">
								<a class="btn btn-success btn-sm" target="_blank"
									href="${dynamicDomain}/home/serviceDetail/${asl.objectId}"><jdf:message code="btn_apply_sourcing" /></a>
								<a class="btn btn-warning btn-sm" target="_blank"
									href="${dynamicDomain}/home/serviceDetail/${asl.objectId}"><jdf:message code="btn_view_detail" /></a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<br> <br>
		</c:if>
		<c:if test="${not empty services_1}">
		<div class="headline">
			<h2><jdf:message code="btn_main_buyer_center" /></h2>
		</div>
		<div class="row">
			<c:forEach items="${services_1}" var="asl">
				<div class="col-md-4">
					<div class="view view-tenth">
						<img src="${dynamicDomain}${asl.mainPicture}"
							class="img-responsive">
						<div class="mask">
							<h3>
								<a href="${dynamicDomain}/home/serviceDetail/${asl.objectId}"><huiyi:i18n name="name" object="${asl}"/></a>
							</h3>
							<div class="btn-more">
								<a class="btn btn-success btn-sm" target="_blank"
									href="${dynamicDomain}/home/serviceDetail/${asl.objectId}"><jdf:message code="btn_apply_sourcing" /></a>
								<a class="btn btn-warning btn-sm" target="_blank"
									href="${dynamicDomain}/home/serviceDetail/${asl.objectId}"><jdf:message code="btn_view_detail" /></a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		</c:if>
	</div>
</body>
</html>
