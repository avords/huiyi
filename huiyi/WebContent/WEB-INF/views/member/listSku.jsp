<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<html>
<head>
<title><jdf:message code="label_product_release" /></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jdf:themeFile file="jquery.twbsPagination.js" />
<link rel="stylesheet" href="${staticDomain}assets/css/member.css">
<jdf:themeFile file="My97DatePicker/WdatePicker.js" />
</head>
<body>
<div class="wrapper"> 
  <div class="container member">
  <%@ include file="common/member_seller_left.jsp"%>
    <!--  内容  -->
    <div class="merberBody">
      <div class="tag-box tag-box-v3 form-page"> 
        <!--Inputs-->
        <div class="headline">
          <h3><jdf:message code="label_product_release" /></h3>
        </div>
        <jdf:form bean="request" scope="request">
        <form action="${dynamicDomain}/member/product/listSku" method="post" class="form-horizontal" id="skuSearchForm">
        <input type="hidden" name="ec_p" id="ec_p" value="1">
        <div class="row margin-bottom-40">
          <div class="col-md-12">
              <div class="form-group">
                <label for="inputEmail1" class="col-md-2 control-label"><jdf:message code="label_product_category" />：</label>
                <div class="col-md-3">
                  <select class="form-control" name="search_EQL_category2.parent_id" id="category1">
                    <option value="">—<jdf:message code="label_product_all" />—</option>
                    <jdf:selectCollection items="firstCategory" optionValue="objectId" optionText="nameZh"/>
                  </select>
                </div>
                <div class="col-md-3">
                  <select class="form-control" name="search_EQL_category2.object_id" id="category2">
                    <option value="">—<jdf:message code="label_product_all" />—</option>
                  </select>
                </div>
              </div>
          </div>
          <div class="col-md-6">
              <div class="form-group">
                <label for="inputEmail1" class="col-md-4 control-label"><jdf:message code="label_product_type" />：</label>
                <div class="col-md-8">
                  <select name="search_EQI_product.type" class="form-control">
                      <option value="">—<jdf:message code="label_product_all" />—</option>
                      <jdf:select dictionaryId="1502" valid="true" />
                  </select>
                </div>
              </div>
          </div>
          <div class="col-md-6">
              <div class="form-group">
                <label for="inputEmail1" class="col-md-4 control-label"><jdf:message code="label_product_releaseType" />：</label>
                <div class="col-md-8">
                  <select name="search_EQI_product.platform" class="form-control">
                      <option value="">—<jdf:message code="label_product_all" />—</option>
                      <jdf:select dictionaryId="1506" valid="true" />
                  </select>
                </div>
              </div>
          </div>
          <div class="col-md-12">
              <div class="form-group">
                <label for="inputEmail1" class="col-md-2 control-label"><jdf:message code="label_product_releaseDate" />：</label>
                <div class="col-md-4">
                  <input type="text" class="form-control" id="effectiveDate" name="search_GED_product.createdOn" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d',maxDate:'#F{$dp.$D(\'expireDate\')}',readOnly:true})">
                </div>
                <div class="col-md-1" style=" width:40px;text-align:center; margin-top:7px;">---</div>
                <div class="col-md-4">
                  <input type="text" class="form-control" id="expireDate" name="search_LED_product.createdOn" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'effectiveDate\')}',readOnly:true})">
                </div>
              </div>
          </div>
          <div class="col-md-6">
              <div class="form-group">
                <label for="inputEmail1" class="col-md-4 control-label"><jdf:message code="label_product_productName" />：</label>
                <div class="col-md-8">
                  <input type="text" name="search_LIKES_product.name_zh" class="form-control" placeholder="(<jdf:message code="label_product_vagueSearch" />）">
                </div>
              </div>
          </div>
          <div class="col-md-6">
              <div class="form-group">
                <label for="inputEmail1" class="col-md-4 control-label"><jdf:message code="label_product_productNo" />：</label>
                <div class="col-md-8">
                  <input type="text" name="search_LIKES_sku.sku_no" class="form-control" placeholder="(<jdf:message code="label_product_vagueSearch" />）">
                </div>
              </div>
          </div>
          <div class="col-md-6">
              <div class="form-group">
                <label for="inputEmail1" class="col-md-4 control-label"><jdf:message code="label_product_auditStatus" />：</label>
                <div class="col-md-8">
                  <select name="search_EQI_sku.status" class="form-control">
                      <option value="">—<jdf:message code="label_product_all" />—</option>
                      <jdf:select dictionaryId="1505" valid="true" />
                  </select>
                </div>
              </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-10 margin-bottom-20"> <a href="${dynamicDomain}/member/product/create">
            <button class="btn-u btn-u-blue btn-u-sm" type="button"><jdf:message code="label_product_add" /></button>
            </a> <a href="javascript:upShelf();">
            <button class="btn btn-success btn-u-sm" type="button" ><jdf:message code="label_product_shelve" /></button>
            </a> <a href="javascript:downShelf();">
            <button class="btn btn-success btn-u-sm" type="button" ><jdf:message code="label_product_unshelve" /></button>
            </a> <a href="javascript:deleteSku();">
            <button class="btn btn-danger btn-u-sm" type="button" ><jdf:message code="label_product_delete" /></button>
            </a> </div>
          <div class="col-md-2" style="text-align: right;">
             <a href="javascript:$('#skuSearchForm').submit();">
                <button class="btn-u btn-u-blue btn-u-sm" type="submit" style="width:80px;"><jdf:message code="label_product_search" /></button>
            </a> 
         </div>
          <div class="col-md-12">
            <table class="table table-condensed">
              <thead>
                <tr>
                  <th><input type="checkbox" id="inlineCheckbox1" name='pchk' onclick='pchkClick()'></th>
                  <th><jdf:message code="label_product_NO" /></th>
                  <th><jdf:message code="label_product_productNo" /></th>
                  <th style="width:140px;"><jdf:message code="label_product_productName" /></th>
                  <th><jdf:message code="label_product_category" /></th>
                  <th><jdf:message code="label_product_skuSpec" /></th>
                  <th><jdf:message code="label_product_RMBPrice" /></th>
                  <th><jdf:message code="label_product_USDPrice" /></th>
                  <th><jdf:message code="label_product_releaseType" /></th>
                  <th><jdf:message code="label_product_modifiedBy" /></th>
                  <th><jdf:message code="label_product_modifiedDate" /></th>
                  <th style="width:50px;"><jdf:message code="label_product_auditStatus" /></th>
                  <th style="width:50px;"><jdf:message code="label_product_operation" /></th>
                </tr>
              </thead>
              <tbody>
              <c:forEach items="${pageSearch.list }" var="currentRowObject" varStatus="status">
                <tr>
                  <td><input type="checkbox" name="schk" onclick="schkClick()" value="${currentRowObject[11]}" ></td>
                  <td>${status.count }</td>
                  <td><a href="${dynamicDomain}/member/product/view/${currentRowObject[0]}">${currentRowObject[3]}</a></td>
                  <td><a href="${dynamicDomain}/member/product/view/${currentRowObject[0]}">${currentRowObject[4]}</a></td>
                  <td>${currentRowObject[5]}</td>
                  <td>${currentRowObject[6]}</td>
                  <td>${currentRowObject[7]}</td>
                  <td>${currentRowObject[8]}</td>
                  <td><jdf:columnValue dictionaryId="1506" value="${currentRowObject[12]}" /></td>
                  <td>${currentRowObject[9]}</td>
                  <td><fmt:formatDate value="${currentRowObject[10]}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                  <td class="color-green"><jdf:columnValue dictionaryId="1505" value="${currentRowObject[1]}" /></td>
                  <td>
                     <c:if test="${currentRowObject[1]!=2&&currentRowObject[1]!=5}">
                         <a href="${dynamicDomain}/member/product/edit/${currentRowObject[0]}" class="color-orange"><jdf:message code='label_product_edit' />
                         </a>
                     </c:if>
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
<script type="text/javascript">
function upShelf(){
    var ids = getCheckedValuesString($("[name='schk']"));
    if(ids==null){
        alert("<jdf:message code='label_product_selectRecord' />");
        return false;
    }
    $.ajax( {
        url : "${dynamicDomain}/member/sku/upShelf",
        type : 'post',
        dataType : 'json',
        data : "ids=" + ids + "&timstamp=" + (new Date()).valueOf(),
        success : function(msg) {
            alert(msg.message);
            window.location.reload();
        }
    });
}
function downShelf(){
    var ids = getCheckedValuesString($("[name='schk']"));
    if(ids==null){
        alert("<jdf:message code='label_product_selectRecord' />");
        return false;
    }
    $.ajax( {
        url : "${dynamicDomain}/member/sku/downShelf",
        type : 'post',
        dataType : 'json',
        data : "ids=" + ids + "&timstamp=" + (new Date()).valueOf(),
        success : function(msg) {
            alert(msg.message);
            window.location.reload();
        }
    });
}
function deleteSku(){
    var ids = getCheckedValuesString($("[name='schk']"));
    if(ids==null){
        alert("<jdf:message code='label_product_selectRecord' />");
        return false;
    }
    $.ajax( {
        url : "${dynamicDomain}/member/sku/delete",
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
        	$('#skuSearchForm').submit();
       }
    });
   </c:if>
   
   $("#category1").bind("change",function(){
       if($(this).val()){
           $.ajax({
               url:"${dynamicDomain}/member/category/getSecondCategory/" + $(this).val(),
               type : 'post',
               dataType : 'json',
               success : function(json) {
                   $("#category2").children().remove();
                   $("#category2").append("<option value=''>—<jdf:message code='label_product_all' />—</option>");
                   for ( var i = 0; i < json.secondCategory.length; i++) {
                       $("#category2").append("<option value='" + json.secondCategory[i].objectId + "'>" + json.secondCategory[i].nameZh + "</option>");
                   }
                   $("#category2").val('${param["search_EQL_category2.object_id"]}').change();
               }
           });
       }
    }).change();
   $('#productList').addClass("active");
});
</script>
</body>
</html>