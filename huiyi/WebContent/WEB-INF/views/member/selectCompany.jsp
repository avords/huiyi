<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>选择企业</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			选择企业
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/admin/company/selectCompany?ajax=1" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">${message}</div>
					</div>
					<div class="row">
						<div class="col-sm-12 col-md-6">
							<div class="form-group">
								<div class="col-md-8">
									<input type="text" class="" id="search_LIKES_nameZh" name="search_LIKES_nameZh" value="请输入企业名称" style="width: 300px;">
									<button type="submit" class="btn btn-primary">
										<span class="glyphicon glyphicon-search"></span>
										<jdf:message code="common.button.query" />
									</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</jdf:form>

			<div id="tableDiv" class="row">
				<div class="col-sm-12 col-md-12">
					<jdf:table items="items" retrieveRowsCallback="limit" var="currentRowObject" filterRowsCallback="limit" sortRowsCallback="limit" action="page">
						<jdf:export view="csv" fileName="Company.csv" tooltip="Export CSV" imageName="csv" />
						<jdf:export view="xls" fileName="Company.xls" tooltip="Export EXCEL" imageName="xls" />
						<jdf:row>
							<jdf:column property="nameZh" title="企业名称" style="width:20%;" />
							<jdf:column property="nameEn" title="英文名称" style="width:20%;" />

							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html">
								<a href="javascript:void(0);" onclick="selectCom('${currentRowObject.nameZh}','${currentRowObject.objectId}')" class="btn btn-primary btn-mini"> 
									<span class="glyphicon glyphicon-edit"></span> 选择
								</a>
							</jdf:column>
						</jdf:row>
					</jdf:table>
				</div>
			</div>

		</div>
	</div>
</body>

<script type="text/javascript">
	function selectCom(name, objectId) {
		parent.$("#companyName").val(name);
		parent.$("#companyId").val(objectId);
		parent.$.colorbox.close();
	}
</script>
</html>