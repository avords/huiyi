<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title><jdf:message code="label_member_center"/></title>
<meta charset="utf-8">
<link rel="stylesheet" href="${dynamicDomain}/static/assets/css/member.css">
</head>
<body>
<div class="container member">
	<%@ include file="common/member_buyer_left.jsp"%>
    <div class="merberBody">
      <div class="ind-info">
        <dl>
          <dd>
            <div class="cont1"><jdf:message code="label_hello"/><span class="red">${member.userName }</span><jdf:message code="label_welcome_to_member_center"/></div>
          </dd>
        </dl>
      </div>
      <div class="ind-box">
        <div class="title">
          <h3><jdf:message code="label_quotation_not_read"/></h3>
          <span><a href="${dynamicDomain}/member/myEnquiry" target="_blank"><jdf:message code="label_see_more"/> <i class="fa fa-angle-right"></i></a></span></div>
        <div class="cont">
        	<ul>
              <c:forEach items="${quotations}" var="item" varStatus="status">
					<li><span><fmt:formatDate value="${item.sendDate }" pattern="yyyy-MM-dd"/></span><a href="${dynamicDomain}/member/myEnquiry" target="_blank">${item.productName}</a></li>
			  </c:forEach>
            </ul>
        </div>
      </div>
      <div class="ind-box">
        <div class="title">
          <h3><jdf:message code="menu_platform_service_apply"/></h3>
        </div>
        <div class="cont">
        	<ul>
              <c:forEach items="${serviceApplies}" var="item" varStatus="status">
					<li><span><fmt:formatDate value="${item.createdOn }" pattern="yyyy-MM-dd"/></span><a >${item.service.nameZh}</a></li>
			  </c:forEach>
            </ul>
        </div>
      </div>
    </div>
  </div>
</body>
</html>