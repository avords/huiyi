<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<html>
<head>
<title><jdf:message code="menu_my_message" /></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jdf:themeFile file="jquery.twbsPagination.js" />
<link rel="stylesheet" href="${staticDomain}assets/css/member.css">
<jdf:themeFile file="My97DatePicker/WdatePicker.js" />
</head>

<body>
<div class="wrapper"> 
  <div class="container member">
  <%@ include file="common/member_buyer_left.jsp"%>
    <!--  内容  -->
    <div class="merberBody">
      <div class="tag-box tag-box-v3 form-page"> 
        <!--Inputs-->
        <div class="headline">
          <h3><jdf:message code="menu_my_message" /></h3>
        </div>
        <jdf:form bean="request" scope="request">
        <form action="${dynamicDomain}/member/myMessage" method="post" class="form-horizontal" id="messageForm">
        <input type="hidden" name="ec_p" id="ec_p" value="1">
        <div class="row margin-bottom-40">
          <div class="col-md-6">
              <div class="form-group">
                <label for="search_LIKES_t1.title" class="col-md-4 control-label"><jdf:message code="label_message_title" />：</label>
                <div class="col-md-7">
                  <input type="text" name="search_LIKES_t1.title" id="search_LIKES_t1.title" class="form-control" placeholder="（<jdf:message code='table_ fuzzy_search' />）">
                </div>
              </div>
          </div>
          <div class="col-md-6">
              <div class="form-group">
                <label for="search_EQI_t1.is_see" class="col-md-3 control-label"><jdf:message code="label_read_or_not" />：</label>
                <div class="col-md-7">
                  <select name="search_EQI_t1.is_see" class="form-control">
                      <option value="">—<jdf:message code="label_option_all" />—</option>
                      <jdf:select dictionaryId="109" valid="true" />
                  </select>
                </div>
              </div>
          </div>
          <div class="col-md-12">
              <div class="form-group">
                <label for="inputEmail1" class="col-md-2 control-label"><jdf:message code="label_send_time" />：</label>
                <div class="col-md-4">
                  <input type="text" class="form-control" id="effectiveDate" name="search_GED_t1.send_date" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'expireDate\')}',readOnly:true})">
                </div>
                <div class="col-md-1" style=" width:40px;text-align:center; margin-top:7px;">---</div>
                <div class="col-md-4">
                  <input type="text" class="form-control" id="expireDate" name="search_LED_t1.send_date" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'effectiveDate\')}',readOnly:true})">
                </div>
              </div>
          </div>
        <div class="row">
          <div class="col-md-10 margin-bottom-20"> <a href="javascript:upShelf();">
            <button class="btn-u btn-u-blue btn-u-sm" type="button"><jdf:message code="btn_set_read" /></button>
            </a> </div>
          <div class="col-md-2" style="text-align: right;">
             <a href="javascript:$('#messageForm').submit();">
                <button class="btn-u btn-u-blue btn-u-sm" type="submit" style="width:80px;"><jdf:message code="btn_to_search" /></button>
            </a> 
         </div>
          <div class="col-md-12">
            <table class="table table-condensed">
              <thead>
                <tr>
                  <th><input type="checkbox" id="inlineCheckbox1" name='pchk' onclick='pchkClick()'></th>
                  <th><jdf:message code="table_top_no" /></th>
				  <th><jdf:message code="label_message_title" /></th>
				  <th><jdf:message code="table_top_sender" /></th>
				  <th><jdf:message code="table_top_receive_company" /></th>
				  <th><jdf:message code="label_send_time" /></th>
				  <th><jdf:message code="label_read_or_not" /></th>
				  <th style="width: 70px;"><jdf:message code="table_top_operation" /></th>
                </tr>
              </thead>
              <tbody>
              <c:forEach items="${pageSearch.list }" var="currentRowObject" varStatus="status">
                <tr>
                  <td><input type="checkbox" name="schk" onclick="schkClick()" value="${currentRowObject[6]}" ></td>
                  <td>${status.count }</td>
                  <td title="${currentRowObject[0]}"><c:if test="${currentRowObject[5]==0}"><a href="#myMessage" onclick="updateMessage(${currentRowObject[6]});"  data-toggle="modal" data-target="#myMessage" class="color-orange"></c:if>
                  	  <c:if test="${currentRowObject[5]!=0}"><a href="#myMessage" onclick="updateMessage(${currentRowObject[6]});"  data-toggle="modal" data-target="#myMessage"></c:if>
                  	  <c:choose>  
			          <c:when test="${fn:length(currentRowObject[0]) > 15}">  
			             <c:out value="${fn:substring(currentRowObject[0], 0, 17)}..." />  
			          </c:when>  
			          <c:otherwise>  
			             <c:out value="${currentRowObject[0]}" />  
			          </c:otherwise>  
			          </c:choose></a>
                  </td>
                  <td>${currentRowObject[1]}</td>
                  <td><c:if test="${la=='zh' }">${currentRowObject[2]}</c:if>
                  	  <c:if test="${la=='en'}">${currentRowObject[7]}</c:if>
                  </td>
                  <td><fmt:formatDate value="${currentRowObject[4]}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                  <td><jdf:columnValue dictionaryId="109" value="${currentRowObject[5]}" /></td>
                  <td>
                    <a href="#myMessage" onclick="updateMessage(${currentRowObject[6]});"  data-toggle="modal" data-target="#myMessage" class="color-green"><jdf:message code="table_top_view" />
                     </a>
                  </td>
                </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
          <div class="col-md-12 text-center">
            <div class="pagination" id="pagination">
	             <div class="page_numbers"></div>
	        </div>
          </div>
        </div>
        </form>
        </jdf:form>
      </div>
    </div>
    <!-- end  内容  --> 
  </div>
</div>

<!-- 阅读消息弹窗 -->
<div class="modal fade" id="myMessage" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <!-- button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
        <h4 class="modal-title" id="myModalLabel" style="text-align: center;"></h4>
      </div>
      <div class="modal-body" id="modal-body">
      			
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" onclick="window.location.reload();" data-dismiss="modal"><jdf:message code="table_top_return" /></button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
function updateMessage(id){
	$.ajax( {
        url : "${dynamicDomain}/member/updateMessage/"+id,
        type : 'post',
        dataType : 'json',
        data : "timstamp=" + (new Date()).valueOf(),
        success : function(msg) {
            if(msg.result){
            	$("#myModalLabel").text(msg.message.title);
            	$("#modal-body").text(msg.message.content);
            }
        }
    });
}

function upShelf(){
    var ids = getCheckedValuesString($("[name='schk']"));
    if(ids==null){
        alert("请至少选择一条记录");
        return false;
    }
    $.ajax( {
        url : "${dynamicDomain}/member/updateMessage",
        type : 'post',
        dataType : 'json',
        data : "ids=" + ids + "&timstamp=" + (new Date()).valueOf(),
        success : function(msg) {
            alert(msg.message);
            window.location.reload();
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
    $("#pagination").twbsPagination({
          totalPages: ${pageSearch.totalPage},
          visiblePages: 5,
          startPage:${pageSearch.currentPage},
          onPageClick: function (event, page) {
        	$('#ec_p').val(page);
        	$('#messageForm').submit();
       }
    });
   </c:if>
   $('#messageBuyerList').addClass("active");
});
</script>
<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->
</body>
</html>