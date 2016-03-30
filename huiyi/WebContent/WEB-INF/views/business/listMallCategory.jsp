<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>前台产品分类</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-th"></span>前台产品分类
			<div class="pull-right">
				<a href="${dynamicDomain}/admin/mallCategory/create?ajax=1" class="pull-left btn btn-primary colorbox-large"> 
					<span class="glyphicon glyphicon-plus"></span>
					<jdf:message code="common.button.add" />
				</a>
			</div>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/admin/mallCategory/page?ajax=${param.ajax}" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">${message}</div>
					</div>
					<c:if test="${!empty adminName }">
						<div class="row">
							<div class="col-sm-6 col-md-6">
								<div class="form-group">
									<label for="adminName" class="col-sm-3 control-label"> <jdf:message code="管理员" /></label>
									<div class="col-sm-8">
										<span class="form-control" id="adminName">${adminName }</span>
									</div>
								</div>
							</div>
						</div>
					</c:if>
					
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_nameZh" class="col-sm-3 control-label">目录名称</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="search_LIKES_nameZh" name="search_LIKES_nameZh">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_nameEn" class="col-sm-3 control-label">英文名称</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="search_LIKES_nameEn" name="search_LIKES_nameEn">
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-12  col-md-12">
							<button type="button" class="btn btn-primary pull-left" onclick="saveSortNo()">保存排序</button>
							<div class="pull-right">
								<button type="button" class="btn" onclick="clearForm(this)">
									<span class="glyphicon glyphicon-remove"></span>
									<jdf:message code="common.button.clear" />
								</button>
								<button type="submit" class="btn  btn-primary">
									<span class="glyphicon glyphicon-search"></span>
									<jdf:message code="common.button.query" />
								</button>
							</div>
						</div>
					</div>
				</form>
			</jdf:form>
			
			<div id="tableDiv" class="row">
				<div class="col-sm-12 col-md-12">
					<jdf:table items="items" retrieveRowsCallback="limit" var="currentRowObject" filterRowsCallback="limit" sortRowsCallback="limit" action="page?ajax=${param.ajax}">
						<jdf:export view="csv" fileName="User.csv" tooltip="Export CSV" imageName="csv" />
						<jdf:export view="xls" fileName="User.xls" tooltip="Export EXCEL" imageName="xls" />
						<jdf:row>
							<jdf:column property="objectId" title="<input type='checkbox' class='noBorder' name='pchk' onclick='pchkClick()'/>" style="width: 4%;text-align: center;" headerStyle="width: 4%;text-align: center;" viewsAllowed="html" sortable="false">
			                    <input type="checkbox" class="noBorder" name="schk" onclick="schkClick()" value="${currentRowObject.objectId}" />
			                </jdf:column>
							<jdf:column property="nameZh" title="目录名称" headerStyle="width:20%;" />
							<jdf:column property="nameEn" title="英文名称" headerStyle="width:25%;" />
							<jdf:column property="image" title="图片" headerStyle="width:15%;">
								<c:if test="${not empty currentRowObject.image}">
									<img alt="" src="${dynamicDomain}${currentRowObject.image}" width="110" height="110">
								</c:if>
							</jdf:column>
							<jdf:column property="sortNo" title="顺序" headerStyle="width:5%;">
								<input type="text" value="${currentRowObject.sortNo }" size="6" name="sortNos" id="sortNos${currentRowObject.objectId}" class="order-form-control">
							</jdf:column>
		
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" headerStyle="width:35%;">
								<a href="${dynamicDomain}/admin/mallCategory/edit/${currentRowObject.objectId}?ajax=1" class="btn btn-mini btn-primary colorbox-large"> 
									<span class="glyphicon glyphicon-edit"></span>  
									<jdf:message code="common.button.edit" />
								</a>
								
								<a href="${dynamicDomain}/admin/mallCategory/configMapping/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large"> 
									<span class="glyphicon glyphicon-random"></span> 
									<jdf:message code="关联后台分类" />
								</a>
								<a href="javascript:toDeleteUrl('${dynamicDomain}/admin/mallCategory/delete/${currentRowObject.objectId}')" class="btn btn-danger btn-mini"> 
									<span class="glyphicon glyphicon-trash"></span> 
									<jdf:message code="common.button.delete" />
								</a>
							</jdf:column>
						</jdf:row>
					</jdf:table>
				</div>
			</div>
			
		</div>
	</div>
	<script type="text/javascript">
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
				url : "${dynamicDomain}/admin/mallCategory/saveSortNos",
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