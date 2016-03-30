<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title><jdf:message code="menu_member_my_inquiry"/></title>
<jdf:themeFile file="jquery.twbsPagination.js" />
<meta charset="utf-8">
<link rel="stylesheet" href="${dynamicDomain}/static/assets/css/member.css">
</head>
<body>
<div class="container member">
    <%@ include file="common/member_buyer_left.jsp"%>
    <div class="merberBody">
      <div class="tag-box tag-box-v3 form-page">
        <div class="headline">
          <h3><jdf:message code="menu_member_my_inquiry"/></h3>
        </div>
	        <div class="row fbTable">
          <table class="table">
            <thead>
              <tr>
                <th><jdf:message code="table_top_no"/></th>
                <th><jdf:message code="label_inquiryList_message"/></th>
                <th><jdf:message code="label_inquiryList_datess"/></th>
                <!--  
                <th>截止日期</th>
                -->
                <th><jdf:message code="label_inquiryList_baojiashu"/></th>
                <th><jdf:message code="label_inquiryList_Number of non reading Quotes"/></th>
              </tr>
            </thead>
            <tbody>
             <c:forEach var="asl" items="${inquiries}" varStatus="vs">
              <tr>
                <td>${vs.count }</td>
                <td><div class="inquire-text">
                    <h4 class="clearfix">
                    <c:choose>
                    	<c:when test="${asl.productId==0}">
                    		<a href="${dynamicDomain}/home/products">
                    	</c:when>
                    	<c:otherwise>
                    		<a href="${dynamicDomain }/home/product/detail/${asl.productId}">
                    	</c:otherwise>
                    </c:choose>
                    ${asl.productName }</a></h4>
                   	<c:if test="${not empty asl.productImg  }">
								<a href="#"><img src="${asl.productImg }" /></a>
					</c:if>
                    <div><jdf:message code="label_inquiry_quantity"/>：${asl.quantity} <jdf:columnValue dictionaryId="1503" value="${asl.unit}"/></div>
                    <p style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis">${asl.description }</p>
                  </div></td>
                <td><fmt:formatDate value="${asl.sendDate}" pattern="yyyy-MM-dd "/></td>
                <!--
                <td><fmt:formatDate value="${asl.expiredDate}" pattern="yyyy-MM-dd"/></td>
                -->
                <td><a href="${dynamicDomain}/member/listQuotation?inquiryId=${asl.objectId}">${asl.number}</a></td>
                <td><a href="${dynamicDomain}/member/listQuotation?inquiryId=${asl.objectId}&status=0">${asl.notReadNumber}</a></td>
              </tr>
             </c:forEach>
            </tbody>
          </table>
        </div>
              <!-- 分页 -->
	         <div class="Pagination" id="pagination" style="padding-top: 10px; text-align: center;">
				<div class="page_numbers"></div>
			</div>
         	<!--/ 分页 --> 
	    </div>
	   </div>
	 </div>
 <script type="text/javascript">
 $(function(){
		$('#releaseInquiry').addClass("active");
	});
 
 $(function(){
		if('${pageSearch.totalPage != 0}'){
	        $("#pagination").twbsPagination({
	              totalPages: ${pageSearch.totalPage},
	              visiblePages:5,
	              startPage: ${pageSearch.currentPage},
	              onPageClick: function (event, page) {
	                $('#page-content').text('Page ' + page);
	                window.location.href = "${dynamicDomain}/member/myEnquiry?ec_p="+page;
	           }
	        });
		}
	});
 </script>
</body>
</html>