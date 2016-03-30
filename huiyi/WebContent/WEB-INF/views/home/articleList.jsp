<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title><jdf:message code="menu_technique_article"/></title>
<link rel="stylesheet" href="${dynamicDomain}/static/assets/css/list.css">
<jdf:themeFile file="jquery.SuperSlide.2.1.1.js" />
<jdf:themeFile file="jquery.twbsPagination.js" />
</head>
<body>
<div class="wrapper"> 
  <div class="container">
    <div class="list-focus clearfix">
      <div class="pic"><img src="${dynamicDomain}/static/assets/img/newsList-bnr.jpg" /></div>
      <div class="news"> 
        <dl>
			<dt>
				<a target="_blank" href="${dynamicDomain }/home/article/${positionCode}/${topArticles[0].objectId}">${topArticles[0].nameZh }</a>
			</dt>
			<dd>
				<div style="padding: 5px 0; font-size: 14px; color: #999;height:50px;overflow: hidden;width:100%;word-wrap: break-word;">${topArticles[0].txtZh }</div>
				<span><a class="red" target="_blank" href="${dynamicDomain }/home/article/${positionCode}/${topArticles[0].objectId}">[<jdf:message code="btn_view_detail"/>]</a></span>
			</dd>
		</dl>
        <ul>
          <c:forEach items="${topArticles }" begin="1" var="item" varStatus="status">
				<li><span><fmt:formatDate value="${item.createdOn }" pattern="yyyy-MM-dd"/></span><a target="_blank" href="${dynamicDomain }/home/article/${positionCode}/${item.objectId}">${item.nameZh }</a></li>
		  </c:forEach>
        </ul>
      </div>
    </div>
    <div class="list-inner clearfix">
      <div class="newslistCont">
        <div class="sort"><span><jdf:message code="menu_article_news"/></span></div>
        
        	<c:forEach items="${pageSearch.list}" var="asl" >
	          <div class="text">
		          <dl>
		            <dt><a href="${dynamicDomain}/home/articlePage/${asl.objectId}" style="text-decoration: none;" target="_blank"><span><fmt:formatDate value="${asl.createdOn}" pattern="yyyy-MM-dd HH:mm"/></span>${asl.nameZh}</a></dt>
		            <dd style="padding: 5px 0; font-size: 13px; color: #999; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;width: 99%;" >${asl.txtZh}</dd>
		            <dd><a class="btn-u btn-u-orange btn-u-sm" href="${dynamicDomain }/home/article/${positionCode}/${asl.objectId}" target="_blank"><jdf:message code="btn_view_detail"/></a></dd>
		          </dl>
		       </div>
            </c:forEach>
         <!-- 分页 -->
	         <div class="Pagination" id="pagination" style="padding-top: 10px; text-align: center;">
				<div class="page_numbers"></div>
			</div>
         <!--/ 分页 -->  
      </div>
      <div class="listSide"> 
        
        <!-- 展会 -->
        <div class="rank">
          <div class="title">
            <h3><jdf:message code="company_exhibition"/></h3>
          </div>
          <div class="cont">
            <ul>
            	<c:forEach items="${exhibitions}" var="item" varStatus="status">
					<li><a href="${dynamicDomain }/home/company/exhibition/${item.companyId}" target="_blank">${item.nameZh}</a></li>
				</c:forEach>
            </ul>
          </div>
        </div>
        <!--/展会--> 
        
        <!-- 产品推荐 -->
        <div class="package">
          <div class="title">
            <h3><jdf:message code="label_index_product_recommend"/></h3>
          </div>
          <ul class="tc-bd">
            <c:forEach items="${recommendProducts}" var="item" varStatus="status">
				<li><a href="${dynamicDomain }/home/product/detail/${item.objectId}" target="_blank"><img src="${dynamicDomain}${item.mainPicture}"/></a>
					<dl>
						<dt>
							<a href="${dynamicDomain }/home/product/detail/${item.objectId}" target="_blank">${item.nameZh}</a>
						</dt>
						<dd>${item.sellPrice}</dd>
					</dl>
				</li>
			</c:forEach>
          </ul>
        </div>
        <!--/产品推荐--> 
        
        <!-- 法律法规 -->
        <%-- <div class="rank">
          <div class="title"><span><a href="#"><i class="fa fa-angle-right"></i></a></span>
            <h3><a href="#"><jdf:message code="laws_and_regulations"/></a></h3>
          </div>
          <div class="cont">
            <ul>
              <c:forEach items="${lawArticles}" var="item" varStatus="status">
					<li><a href="${dynamicDomain }/home/article/${lawPositionCode}/${item.objectId}" target="_blank">${item.nameZh}</a></li>
			  </c:forEach>
            </ul>
          </div>
        </div> --%>
        <!--/法律法规--> 
        
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
$(function(){
	<c:if test="${pageSearch.totalPage != 0}">
        $("#pagination").twbsPagination({
              totalPages: '${pageSearch.totalPage}',
              visiblePages:5,
              startPage: '${pageSearch.currentPage}',
              onPageClick: function (event, page) {
                $('#page-content').text('Page ' + page);
                window.location.href = "${dynamicDomain}/home/articleList?ec_p="+page;
           }
        });
	</c:if>
});
</script> 
</body>
</html>