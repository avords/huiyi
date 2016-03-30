<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title><jdf:message code="menu_my_quotation"/></title>
<meta charset="utf-8">
<link rel="stylesheet" href="${dynamicDomain}/static/assets/css/member.css">
<jdf:themeFile file="jquery.SuperSlide.2.1.1.js" />
<jdf:themeFile file="jquery.twbsPagination.js" />
<jdf:themeFile file="My97DatePicker/WdatePicker.js" />
<jdf:themeFile file="css/colorbox.css" />
<jdf:themeFile file="jquery.colorbox.min.js" />
<jdf:themeFile file="ckeditor/ckeditor.js" />
<jdf:themeFile file="ckeditor/config.js" />
<jdf:themeFile file="ajaxfileupload.js" />
<jdf:themeFile file="kindeditor/kindeditor.js" />
<jdf:themeFile file="kindeditor/lang/zh_CN.js" />
</head>
<body>
<div class="container member">
    <%@ include file="common/member_seller_left.jsp"%>
	<div class="merberBody">
      <div class="tag-box tag-box-v3 form-page"> 
        <!--Inputs-->
        <div class="headline">
          <h3><jdf:message code="menu_my_quotation"/></h3>
          <div class="pull-right" id="cd">
	          <a href="${dynamicDomain}/member/createExhibition">
	            <button class="btn-u btn-u-blue btn-u-sm" type="button"><jdf:message code="common.button.add"/></button>
	          </a>
           </div> 
        </div>
        <div class="row margin-bottom-40">
          <div class="col-md-12">
            <form class="form-horizontal" action="${dynamicDomain}/member/modifyExhibition" method="post" role="form">
              <div class="row">
				<div class="col-sm-6 col-md-6">
	              <div class="form-group">
	                <label for="inputEmail1" class="col-md-3 control-label"><jdf:message code="label_exhibition_name"/>：</label>
	                <div class="col-md-8">
	                  <input type="text" class="form-control" id="searchText" name="searchText" value="${searchText }" >
	                </div>
	              </div>
	            </div> 
	            <div class="col-sm-6 col-md-6">
	              <div class="form-group">
	                <label for="inputEmail1" class="col-md-3 control-label"><jdf:message code="label_time" />：</label>
	                <div class="col-md-8">
	                  <input value="<fmt:formatDate value="${attendDate }" pattern="yyyy-MM-dd"/>" type="text"  id="attendDate" name="attendDate" size="14" class="form-control Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})">
	                </div>
	              </div>
	          	</div>
	          </div>     
              <div class="row">
		          <div class="col-md-12 margin-bottom-10" style="text-align:right;">
		            <button type="button" class="btn-u btn-u-blue btn-u-sm" style="width:80px;" onclick="clearForm1()"><jdf:message code="common.button.clear" /></button>
		            <button class="btn-u btn-u-blue btn-u-sm" type="submit" style="width:80px;"><jdf:message code="common.button.query" /></button>
		           </div>
            </form>
          </div>
        </div>
          <div class="col-md-12">
            <table class="table">
              <thead>
                <tr>
                  <th><jdf:message code="table_top_no"/></th>
                  <th><jdf:message code="label_exhibition_name"/></th>
                  <th><jdf:message code="label_booth_no"/></th>
                  <th><jdf:message code="label_start_date"/></th>
                  <th><jdf:message code="label_end_date"/></th>
                  <th style="width:100px;"><jdf:message code="table_top_operation"/></th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach items="${pageSearch.list}" var="asl" varStatus="vs">
				  <tr>
	                  <td>${vs.count }</td>
	                  <td>${asl.nameZh }</td>
	                  <td>${asl.boothNo }</td>
	                  <td><fmt:formatDate value="${asl.startDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	                  <td><fmt:formatDate value="${asl.endDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	                  <td><span class="editor"><a href="${dynamicDomain}/member/editExhibition/${asl.objectId}" class="color-blue"><jdf:message code="common.button.edit"/> </a><a href="${dynamicDomain}/member/deleteExhibition/${asl.objectId}" class="color-red"><jdf:message code="common.button.delete"/></a></span></td>
                  </tr>
			     </c:forEach>
              </tbody>
            </table>
          </div>
          <div class="col-md-12 text-center">
            <!-- 分页 -->
	          <div class="Pagination" id="pagination" >
				  <div class="page_numbers"></div>
			  </div>
			<!--/ 分页 -->
          </div>
        </div>
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
                window.location.href = "${dynamicDomain}/member/modifyExhibition?ec_p="+page;
           }
        });
	}
	$('#modifyExhibition').addClass("active");
});
function clearForm1(){
	$('#searchText').val("");
	$('#attendDate').val("");
}
</script> 
</body>
</html>