<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title><jdf:message code="menu_inquiry_list"/></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${dynamicDomain}/static/assets/css/list.css">
<jdf:themeFile file="jquery.SuperSlide.2.1.1.js" />
<jdf:themeFile file="jquery.twbsPagination.js" />

</head>

<body>
	<div class="wrapper">
		<div class="pro-wz">
			<a href="${dynamicDomain}/home"><jdf:message code="menu_home"/></a> &gt; <jdf:message code="menu_inquiry_list" />
		</div>
		<div class="container porList">
			<div class="side">
					<div class="nav-service">
						<h2><jdf:message code="label_product_category"/></h2>
						<c:forEach var="item" items="${productDirectory}" varStatus="num">
						<c:choose>
							<c:when test="${num.index < 8 }">
							<dl>
							<dt>
								<a href="${dynamicDomain}/home/search?type=1&data-value=category_name1_zh:${item.nameZh}">${item.getNameZh()}</a>
								<a class=" help-icon sNav" href="#"></a>
							</dt>
								<c:forEach var="item1" items="${item.children}" varStatus="num1">
								<c:choose>
									<c:when test="${num1.index < 4 }">
										<dd>
											<a href='${dynamicDomain}/home/search?type=1&data-value=category_name1_zh:${item.nameZh}&data-value=category_name2_zh:<huiyi:i18n object="${item1}" name="name"/>'><huiyi:i18n object="${item1}" name="name" /></a>
										</dd>
									</c:when>
									<c:when test="${num1.index == 4 }">
										<dd class="more">
											<a href="${dynamicDomain}/home/products">More <i class="fa fa-angle-right"></i></a>
										</dd>
									</c:when>
									<c:otherwise></c:otherwise>
								</c:choose>
							</c:forEach>
							</dl>
						</c:when>
						<c:otherwise>
						</c:otherwise>
						</c:choose>
						</c:forEach>
						<dl>
							<dt>
								<a href="${dynamicDomain}/home/products"><jdf:message code="label_inquiryList_more"/></a>
							</dt>
						</dl>
				</div>
			</div>
			<div class="main">
				<div class="listTitle">
					<div class="tit">
						<h3>
							<em><jdf:message code="menu_member_mytracks"/><jdf:message code="menu_inquiry_list"/></em>
						</h3>
						<span><a class="btn btn-success btn-sm colorbox-large" href="${dynamicDomain}/home/servicesList/1?ajax=1"><jdf:message code="label_service_for_buyer"/></a></span>
					</div>
	 <form action="${dynamicDomain}/home/inquireList" id="conditionForm">
	 <input type="hidden" name="topquery" value="1">				
					<div class="cont clearfix">
						<dl>
							<dt><jdf:message code="label_country"/>：</dt>
							<dd>
								<c:forEach var="asl" items="${countries}">
									<label> <a href="#"><input type="checkbox" name="country" value="${asl.objectId}">${asl.nameZh}</a></label>
								</c:forEach>
							</dd>
						</dl>
						<dl>
            <dt><jdf:message code="label_inquiryList_Type of membership"/>：</dt>
            <dd class="checkbox">
	            <c:forEach items="${memberLevels }" var="item" varStatus="status">
	              <label>
	                <input type="checkbox" name="member_level" value="${item.value }"> ${item.name }
				  </label>
	            </c:forEach>
	              <label>
	                <input type="checkbox" name="is_check_factory" value="1"><jdf:message code="label_product_factory"/>
	              </label>
	              <label>
	                <input type="checkbox" name="is_allow" value="1"><jdf:message code="label_mytracks_allowed"/>
	              </label>
             </dd>
          </dl>
          <dl>
            <dt><jdf:message code="label_aptitude"/>：</dt>
            <dd class="checkbox">
            <c:forEach items="${qualityCertificas }" var="item" varStatus="status">
              <label>
                <input type="checkbox" name="quality_certifica" value="${item.value }">${item.name }
              </label>
              </c:forEach>
              </dd>
          </dl>
          <dl>
            <dt><jdf:message code="label_mytracks_company_nature"/>：</dt>
            <dd class="checkbox">
            <c:forEach items="${companyTypes }" var="item" varStatus="status">
              <label>
                <input type="checkbox" name="company_type" value="${item.value }">${item.name }
              </label>
            </c:forEach>
            </dd>
          </dl>
          <dl style="text-align: center;">
              <span><a class="btn btn-success btn-sm" href="javascript:confirmCondition();" style="background-color: #f0ad4e;border-color: #eea236;"><jdf:message code="label_product_confirm" /></a></span>
          </dl>
		</div>
	</div>
		</form>	
				
				<div class="listCont">
					<div class="inquire-title">
						<span class="w1"></span> <span class="w2"><jdf:message code="label_inquiryList_datess"/></span> 
						<span class="w3"><jdf:message code="label_inquiryList_Has received the offer"/></span>
					</div>
					<c:if test="${inquirys!=null}">
						<c:forEach var="asl" items="${inquirys}">
							<div class="inquire-node">
								<div class="title">
									<h3>
										<c:choose>
					                    	<c:when test="${asl.productId==0}">
					                    		<a href="${dynamicDomain}/home/products">
					                    	</c:when>
					                    	<c:otherwise>
					                    		<a href="${dynamicDomain }/home/product/detail/${asl.productId}">
					                    	</c:otherwise>
                    					</c:choose>${ asl.productName}</a>
									</h3>
									<span><fmt:formatDate value="${ asl.sendDate}"
											pattern="yyyy-MM-dd" /></span> <span><a href="${dynamicDomain}/member/listQuotation?inquiryId=${asl.objectId}">${ asl.number}</a></span>
								</div>
								<div class="inquire-cont">
									<c:if test="${not empty asl.productImg  }">
										<a href="#"><img src="${asl.productImg }" /></a>
									</c:if>
									<div><jdf:message code="label_inquiry_quantity"/>：${asl.quantity }</div>
									<p
										style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis">${ asl.description}</p>
								</div>
							</div>
						</c:forEach>
					</c:if>
					<!-- 分页 -->
					<div class="pagination" id="pagination" style="margin-left: 300px">
						<div class="page_numbers"></div>
					</div>
					<!--/ 分页 -->
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			var topquery = "${topquery}";
			var urlParams = "${urlParams}";
			$(".colorbox-large").colorbox({ width: "80%", height:"80%", close: "关闭", overlayClose: false});
			<c:if test="${pageSearch.totalPage != 0}">
	        $("#pagination").twbsPagination({
	              totalPages: ${pageSearch.totalPage},
	              visiblePages: 5,
	              startPage:${pageSearch.currentPage},
	              onPageClick: function (event, page) {
	                $('#page-content').text('Page ' + page);
	                window.location.href = "${dynamicDomain}/home/inquireList?topquery="+topquery+"&urlParams="+urlParams+"&ec_p="+page;
	           }
	        });
	       </c:if>
	       
	     	//页面选中查询条件
	       <c:if test="${countrys!=null}">
	          <c:forEach items="${countrys}" var="item" varStatus="status">
	             $('input[name="country"][value="${item}"]').attr("checked","checked");
	          </c:forEach>
	       </c:if>
	       <c:if test="${member_levels!=null}">
	          <c:forEach items="${member_levels}" var="item" varStatus="status">
	             $('input[name="member_level"][value="${item}"]').attr("checked","checked");
	          </c:forEach>
	       </c:if>
	       //isCheckFactory
	       <c:if test="${isCheckFactory==1}">
	          $('input[name="is_check_factory"]').attr("checked","checked");
	       </c:if>
	       //isAllow
	       <c:if test="${isAllow==1}">
	          $('input[name="is_allow"]').attr("checked","checked");
	       </c:if>
	       //qualityCertifica
	       <c:if test="${certificas!=null}">
	          <c:forEach items="${certificas}" var="item" varStatus="status">
	             $('input[name="quality_certifica"][value="${item}"]').attr("checked","checked");
	          </c:forEach>
	       </c:if>
	       //companyType
	       <c:if test="${company_types!=null}">
	       <c:forEach items="${company_types}" var="item" varStatus="status">
	          $('input[name="company_type"][value="${item}"]').attr("checked","checked");
	       </c:forEach>
	    </c:if>
		});
		
		function confirmCondition(){
	    	$('#conditionForm').submit();
	    }
	</script>
</body>
</html>