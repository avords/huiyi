<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>产品运营分类管理</title>
<style>
</style>
</head>
<body>
        <div class="panel panel-default">
        <div class="panel-heading">
            <span class=""></span>产品运营一级分类
            <div class="pull-right">
                 <a href="${dynamicDomain}/admin/category/create?ajax=1" class="colorbox pull-left btn btn-primary">
                        <span class="glyphicon glyphicon-plus"></span>
                 </a>
            </div>
        </div>
        <div class="panel-body">
            <jdf:form bean="request" scope="request">
            <form action="${dynamicDomain}/admin/category/page" method="post" class="form-horizontal">
                    <div class="row">
                        <div class="col-sm-12 alert alert-info" id="messageBox">
                            ${message}
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="search_LIKES_name" class="col-sm-3 control-label">一级分类名称：</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="search_LIKES_name" name="search_LIKES_nameZh">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="search_EQI_status" class="col-sm-3 control-label">状态：</label>
                                <div class="col-sm-6">
                                    <select name="search_EQI_status" class="form-control">
                                        <option value="">—全部—</option>
                                        <jdf:select dictionaryId="111" valid="true" />
                                    </select>
                                </div>
                             </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="search_EQI_type" class="col-sm-3 control-label">类型：</label>
                                <div class="col-sm-6">
                                    <select name="search_EQI_type" class="form-control">
                                        <option value="">—全部—</option>
                                        <jdf:select dictionaryId="1502" valid="true" />
                                    </select>
                                </div>
                             </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12  col-md-12">
                            <button type="button" class="btn btn-primary pull-left" onclick="invalid()">置为无效</button>
                            <button type="button" class="btn btn-primary pull-left" onclick="saveSortNo()">保存排序</button>
                            <div class="pull-right">
                                <button type="button" class="btn" onclick="clearForm(this)">
                                    <span class="glyphicon glyphicon-remove"></span><jdf:message code="common.button.clear" />
                                </button>
                                <button type="submit" class="btn  btn-primary">
                                    <span class="glyphicon glyphicon-search"></span><jdf:message code="common.button.query" />
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </jdf:form>
            <div id="tableDiv" class="row">
                <div class="col-sm-12 col-md-12">
			        <jdf:table items="items" var="currentRowObject" retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit" action="page">
			            <jdf:export view="csv" fileName="产品运营一级分类.csv" tooltip="导出CSV" imageName="csv" />
			            <jdf:export view="xls" fileName="产品运营一级分类.xls" tooltip="导出EXCEL" imageName="xls" />
			            <jdf:row>
			                <jdf:column property="objectId" title="<input type='checkbox' class='noBorder' name='pchk' onclick='pchkClick()'/>" style="width: 4%;text-align: center;" headerStyle="width: 4%;text-align: center;" viewsAllowed="html" sortable="false">
			                    <input type="checkbox" class="noBorder" name="schk" onclick="schkClick()" value="${currentRowObject.objectId}" />
			                </jdf:column>
			                <jdf:column alias="操作" title="common.lable.operate" sortable="false" viewsAllowed="html" style="width: 4%">
			                    <a href="${dynamicDomain}/admin/category/edit/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox"> 
			                        <i class="glyphicon glyphicon-pencil"></i>
			                    </a>
			                </jdf:column>
			                <jdf:column property="rowcount" sortable="false" cell="rowCount" title="序号" style="width:4%;text-align:center"/>
			                <jdf:column property="nameZh" title="一级分类名称" headerStyle="width:20%;" />
			                <jdf:column property="sortNo" title="排序" headerStyle="width:10%;" >
			                    <input type="text" value="${currentRowObject.sortNo }" name="sortNos" id="sortNos${currentRowObject.objectId}" class="order-form-control">
			                </jdf:column>
			                <jdf:column property="1" title="二级分类数量" headerStyle="width:10%;" viewsDenied="html">  
			                    ${currentRowObject.childrenCount }
			                </jdf:column>  
			                <jdf:column property="childrenCount" title="二级分类数量" headerStyle="width:10%;" viewsAllowed="html" sortable="false">  
			                    <a href="${dynamicDomain}/admin/category/secondPage?parentId=${currentRowObject.objectId}" class="active" style="color:#428bca;">${currentRowObject.childrenCount }</a>
			                </jdf:column>          
			                <jdf:column property="status" title="状态" headerStyle="width:10%;">
			                    <jdf:columnValue dictionaryId="111" value="${currentRowObject.status}" />
			                </jdf:column> 
			                <jdf:column property="type" title="类型" headerStyle="width:10%;">
                                <jdf:columnValue dictionaryId="1502" value="${currentRowObject.type}" />
                            </jdf:column> 
			            </jdf:row>
			        </jdf:table>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    	function invalid(){
    		var ids = getCheckedValuesString($("[name='schk']"));
    		if(ids==null){
    			winAlert("请至少选择一条记录");
    			return false;
    		}
    		$.ajax( {
   				url : "${dynamicDomain}/admin/category/invalid",
   				type : 'post',
   				dataType : 'json',
   				data : "ids=" + ids + "&timstamp=" + (new Date()).valueOf(),
   				success : function(msg) {
   					if (msg>0) {
   						alert("成功保存" + msg + "条记录");
   						$("[name='sortNos']").remove();
   						ecFormSubmit();
   					} else {
   						alert("保存失败");
   					}
   				}
   			});
    	}
    	
    	function saveSortNo(){
   			var sortNos = getUpdateColumnString("sortNos");
   			var array = new Array();
   			array = sortNos.split(",");
   			for(var i=0;i<array.length;i++){
   				if(!/^[1-9]{1}\d{0,5}(\.\d)?$/.test(array[i])){
   				    alert('排序最多一位小数，6位整数位');
   					return false;
   				}
   			}
   			var ids = getCheckedValuesString($("[name='schk']"));
   			if(ids==null){
   				alert("请至少选择一条记录");
   				return false;
   			}
   			$.ajax( {
   				url : "${dynamicDomain}/admin/category/saveSortNos",
   				type : 'post',
   				dataType : 'json',
   				data : "ids=" + ids + "&sortNos=" + sortNos + "&timstamp=" + (new Date()).valueOf(),
   				success : function(msg) {
   					if (msg) {
   						alert("保存成功");
   						$("[name='sortNos']").remove();
   						ecFormSubmit();
   					} else {
   						alert("保存失败");
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
    </script>
</body>
</html>