<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title><jdf:message code="label_inquiryList_My inquiry offer"/></title>
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
          <h3><jdf:message code="label_inquiryList_baojia"/></h3>
        </div>
	        <div class="row fbTable">
          <table class="table">
            <thead>
              <tr>
                <th><jdf:message code="label_inquiryList_baojia"/></th>
                <th><jdf:message code="label_inquiryList_datess"/></th>
                <th><jdf:message code="label_inquiryList_Minimum purchase quantity"/></th>
                <th><jdf:message code="label_inquiryList_Total price"/></th>
              </tr>
            </thead>
            <tbody>
             <c:forEach var="item" items="${quotations}">
              <tr>
                <td>
                    <h4 class="clearfix"><a href="${dynamicDomain}/home/company/index/${item.fromCompanyId }">${item.fromCompanyName }</a></h4>
                </td>
                <td><fmt:formatDate value="${item.sendDate}" pattern="yyyy-MM-dd "/></td>
                <td>${item.quantity} <jdf:columnValue dictionaryId="1503" value="${item.unit}"/></td>
                <td>${item.price} <jdf:columnValue dictionaryId="1508" value="${item.priceUnit}"/></td>
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
		if('${pageSearch.totalPage != 0}'){
	        $("#pagination").twbsPagination({
	              totalPages: ${pageSearch.totalPage},
	              visiblePages:5,
	              startPage: ${pageSearch.currentPage},
	              onPageClick: function (event, page) {
	                $('#page-content').text('Page ' + page);
	                window.location.href = "${dynamicDomain}/member/listQuotation?ec_p="+page;
	           }
	        });
		}
	});
 </script>
</body>
</html>