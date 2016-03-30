<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<html>
<head>
<title><jdf:message code="menu_service_directory" /></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jdf:themeFile file="jquery.twbsPagination.js" />
<link rel="stylesheet" href="${staticDomain}assets/css/list.css">
<jdf:themeFile file="My97DatePicker/WdatePicker.js" />
</head>

<body>
<div class="wrapper"> 
  <div class="container porList">
    <!--  内容  -->
    <div class="listCont">
      <div class="tag-box tag-box-v3 form-page"> 
        <!--Inputs-->
        <div class="headline">
        <h3>
          <c:choose>
             <c:when test="${businessType==1 }">
             	<jdf:message code="label_service_for_buyer" />
             </c:when>
             <c:when test="${businessType==2 }">
             	<jdf:message code="label_service_for_supplier" />
             </c:when>
             <c:otherwise>
             	<jdf:message code="label_service_for_assistant" />
             </c:otherwise>
             </c:choose>
		</h3>
        </div>
        <jdf:form bean="request" scope="request">
        <form action="${dynamicDomain}/home/servicesList/${businessType}" method="post" class="form-horizontal" id="serviceForm">
        <input type="hidden" name="ec_p" id="ec_p" value="1">
        <div class="row" style="width:90%;">
            <div class="listCont">
        		<c:forEach items="${services }" var="currentRowObject" varStatus="status">
			        <div class="list-node">
			          <div class="pro-img-new">
				          <input type="checkbox" name="schk" onclick="schkClick()" style="width:20px;height:20px;" value="${currentRowObject.objectId}" >
				          <img src="${dynamicDomain}/${currentRowObject.mainPicture}" />
			          </div>
			          <div class="pro-text-new">
			            <h4><font color="blue"><huiyi:i18n name="name" object="${currentRowObject}"/></font></h4>
			            <div class="info"><p><huiyi:i18n name="summary" object="${currentRowObject}"/></p></div>
			          </div>
			        </div>
		        </c:forEach>
		    </div>
            <div class="col-md-12 text-center">
	            <a href="javascript:upShelf();">
	            <button class="btn-u btn-u-blue btn-u-sm-new" type="button"><jdf:message code="btn_apply_service" /></button>
	            </a> 
            </div>
        </div>
        </form>
        </jdf:form>
      </div>
    </div>
    <!-- end  内容  --> 
  </div>
</div>

<script type="text/javascript">
function upShelf(){
    var ids = getCheckedValuesString($("[name='schk']"));
    if(ids==null){
        alert("<jdf:message code='label_one_record' />！");
        return false;
    }
    $.ajax( {
        url : "${dynamicDomain}/home/applyServices",
        type : 'post',
        dataType : 'json',
        data : "ids=" + ids + "&timstamp=" + (new Date()).valueOf(),
        success : function(msg) {
            if(msg.result){
            	alert(msg.message);
            	$.colorbox.close();
            }else{
            	alert(msg.message);
            }	 
        }
    });
}
function getUpdateColumnString(elementName, split) {
    var checkItem = document.getElementsByName("schk");
    if (split == null) {
        split = ",";
    }
    str = "";
    for (var i = 0; i < checkItem.length; i++) {
        if (checkItem[i].checked == true) {
            str = appendSplit(str, $("#" +elementName + $(checkItem[i]).val()).val(), split);
        }

    }
    if (str == ""){
        return null;
    }
    return str;
}

$(function(){
	<c:if test="${pageSearch.totalCount != 0}">
   </c:if>
});
</script>
<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->
</body>
</html>