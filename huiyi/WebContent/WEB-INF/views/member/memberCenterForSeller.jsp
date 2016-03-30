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
	<%@ include file="common/member_seller_left.jsp"%>
    <div class="merberBody">
      <div class="ind-info">
        <dl>
          <dd>
            <div class="cont1"><jdf:message code="label_hello"/><span class="red">${member.userName }</span><jdf:message code="label_welcome_to_member_center"/></div>
            <%-- <c:if test="${company!=null}">
            <div class="cont2"> <!-- <span><img src="assets/img/icon_jp_1.png">金牌</span> --> 
            <c:if test="${company.isCheck==1}"><span><img src="${dynamicDomain}/static/assets/img/icon_yz_1.png">已验供应商</span></c:if>
            <span>注册时间：<fmt:formatDate value="${company.registerDate }" pattern="yyyy-MM-dd" /></span>　</div></c:if> --%>
          </dd>
        </dl>
      </div>
      <div class="row">
        <div class="col-md-6">
          <div class="ind-box">
            <div class="title">
              <h3><jdf:message code="label_untreated_inquiry"/></h3>
              <span><a href="${dynamicDomain}/member/searchInquiry" target="_blank"><jdf:message code="label_see_more"/> <i class="fa fa-angle-right"></i></a></span></div>
            <div class="cont">
            	<ul>
	              <c:forEach items="${inquiries}" var="item" varStatus="status">
						<li><span><fmt:formatDate value="${item.sendDate }" pattern="yyyy-MM-dd"/></span><a href="${dynamicDomain}/member/searchInquiry" target="_blank">${item.productName}</a></li>
				  </c:forEach>
	            </ul>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="ind-box">
            <div class="title">
              <h3><jdf:message code="label_message_not_read"/></h3>
              <span><a href="${dynamicDomain }/member/yourMessage" target="_blank"><jdf:message code="label_see_more"/> <i class="fa fa-angle-right"></i></a></span></div>
            <div class="cont">
            	<ul>
	              <c:forEach items="${messages}" var="item" varStatus="status">
						<li><span><fmt:formatDate value="${item.sendDate }" pattern="yyyy-MM-dd"/></span><a href="${dynamicDomain }/member/yourMessage" target="_blank">${item.title}</a></li>
				  </c:forEach>
	            </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="ind-box">
        <div class="title">
          <h3><jdf:message code="menu_platform_service_apply"/></h3>
        </div>
        <div class="cont">
        	<ul>
              <c:forEach items="${serviceApplies}" var="item" varStatus="status">
					<li><span><fmt:formatDate value="${item.createdOn }" pattern="yyyy-MM-dd"/></span><a>${item.service.nameZh}</a></li>
			  </c:forEach>
            </ul>
        </div>
      </div>
    </div>
  </div>
</body>
</html>