<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<html>
<head>
<title>企业列表</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${dynamicDomain}/static/assets/css/list.css">
<jdf:themeFile file="jquery.twbsPagination.js" />
</head>

<body>
<div class="wrapper">
  <div class="container porList">
    <div class="side">
    <c:forEach items="${page.data.leftSideAttributeFacets }" var="item" varStatus="status">
      <div class="attribute">
        <h3><i class="fa fa-gg"></i>${item.name }</h3>
        <ul>
          <c:forEach items="${item.subFacetResults }" var="sub" varStatus="sta">
               <li class="checkbox">
                 <label>
                   <c:choose>
                       <c:when test="${sub.fieldName=='num_employees' }">
                            <a href="${dynamicDomain }/home/search?type=2&${urlParam}&data-value=${sub.fieldName }:${sub.fieldValue }"><jdf:columnValue dictionaryId="1111" value="${sub.fieldValue}" />(${sub.count })</a></label>
                       </c:when>
                       <c:otherwise>
                           <a href="${dynamicDomain }/home/search?type=2&${urlParam}&data-value=${sub.fieldName }:${sub.fieldValue }">${sub.name }(${sub.count })</a></label>
                       </c:otherwise>
                   </c:choose>
               </li>
           </c:forEach>
        </ul>
      </div>
     </c:forEach>
    </div>
    <div class="main">
     <form action="" id="conditionForm">
      <div class="listTitle">
        <div class="tit">
          <h3><em>企业列表</em></h3>
        </div>
        <div class="cont clearfix">
          <c:forEach items="${page.data.companyAttributeFacets }" var="item" varStatus="status">
              <dl>
                <dt>${item.name }：</dt>
                <dd>
                    <c:forEach items="${item.subFacetResults }" var="sub" varStatus="sta">
                        <a href="${dynamicDomain }/home/search?type=2&${urlParam}&data-value=${sub.fieldName }:${sub.fieldValue }">${sub.name }(${sub.count })</a>
                    </c:forEach>
                </dd>
              </dl>
          </c:forEach>
                    <dl>
            <dt>会员类型：</dt>
            <dd class="checkbox">
            <c:forEach items="${memberLevels }" var="item" varStatus="status">
            <a href="javascript:void(0);">
              <label>
                <input type="checkbox" name="member_level" value="${item.value }">
              ${item.name }</label>
              </a> 
              </c:forEach>
              <a href="javascript:void(0);">
              <label>
                <input type="checkbox" name="is_check_factory" value="1">
                已验厂供应商</label>
              </a> <a href="javascript:void(0);">
              <label>
                <input type="checkbox" name="is_allow" value="1">
                已许可供应商</label>
              </a> </dd>
          </dl>
          <dl style="text-align: center;">
              <span><a class="btn btn-success btn-sm" href="javascript:confirmCondition();" style="background-color: #f0ad4e;border-color: #eea236;">确定</a></span>
          </dl>
        </div>
      </div>
      </form>
      <div class="supplierList">
            <c:forEach items="${page.data.companys }" var="item" varStatus="varStatus">
                <div class="list clearfix">
                  <div class="cont">
                    <h4><a href="${dynamicDomain }/home/company/index/${item.id}" target="_blank">${item.name }</a></h4>
                    <div class="icon">
                        <span class="icon-jp1"><jdf:columnValue dictionaryId="1402" value="${item.memberLevel}" /></span>
                        <c:if test="${item.isCheck==1 }">
	                        <span class="icon-yz1">已验供应商</span>
	                    </c:if>
                    </div>
                    <p><i>公司性质：</i><span>工厂</span></p>
                    <p><i>主要产品：</i><span>${item.mainProductStr }</span></p>
                    <p><i>认证编号：</i><span>${item.qualityCertifica }</span></p>
                    <p><i>城市：</i><span>${item.countryName }</span></p>
                  </div>
                  <ul class="pic">
                     <c:forEach items="${item.mainProducts }" var="product" varStatus="vs">
	                    <li><a href="${dynamicDomain }/home/product/detail/${product.productId}" target="_blank"><img width="120px" src="${dynamicDomain }/${product.mainPicture}"></a>
	                      <p><a href="${dynamicDomain }/home/product/detail/${product.productId}" target="_blank">${product.name}</a></p>
	                    </li>
	                 </c:forEach>
                  </ul>
                </div>
                </c:forEach>
              </div>
      <div class="text-center" style="border-top:1px solid #ddd;">
        <div class="pagination" id="pagination">
             <div class="page_numbers"></div>
        </div>
      </div>
    </div>
  </div>
  
</div>
<script type="text/javascript">
    function confirmCondition(){
        searchAction();
        $('#searchForm').submit();
    }
    function searchAction(){
        var param = $('#conditionForm').serialize();
        var action = $('#searchForm').attr('action');
        $('#searchForm').attr('action',action+'?'+param);
    }
    $(function(){
        $("#pagination").twbsPagination({
        	totalPages: ${page.totalPages==0?1:page.totalPages},
            visiblePages: 5,
            startPage:${page.current},
            onPageClick: function (event, page) {
                $('#page-content').text('Page ' + page);
                window.location.href = "${dynamicDomain}/home/search?type=2&${urlParam}&ec_p="+page;
            }
        });
       $('#searchButton').click(function(){
           searchAction();
       });
       //页面选中查询条件memberLevel
       <c:if test="${memberLevel!=null}">
          <c:forEach items="${memberLevel}" var="item" varStatus="status">
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
    });
    </script>
</body>
</html>