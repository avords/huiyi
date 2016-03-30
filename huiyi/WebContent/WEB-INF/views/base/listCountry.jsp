<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>国别管理</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span>
			国别管理
			<div class="pull-right">
				<a href="${dynamicDomain}/admin/country/create?ajax=1" class="btn btn-primary colorbox-large"> 
					<span class="glyphicon glyphicon-plus"></span>
					<jdf:message code="common.button.add" />
				</a>
			</div>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/admin/country/page" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">${message}</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_nameZh" class="col-sm-2 control-label">
									国家名称
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="search_LIKES_nameZh" name="search_LIKES_nameZh">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQI_status" class="col-sm-2 control-label">
									状态
								</label>
								<div class="col-sm-8">
									<select name="search_EQI_status" class="form-control">
										<option value=""></option>
										<jdf:select dictionaryId="111" valid="true" />
									</select>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-12  col-md-12">
							<div class="pull-right">
								<button type="button" class="btn" onclick="clearForm(this)">
									<span class="glyphicon glyphicon-remove"></span>
									<jdf:message code="common.button.clear" />
								</button>
								<button type="submit" class="btn btn-primary">
									<span class="glyphicon glyphicon-search"></span>
									<jdf:message code="common.button.query" />
								</button>
							</div>
						</div>
					</div>
				</form>
			</jdf:form>
			
			<!-- 这里是数据表格 -->
			<div id="tableDiv" class="row">
				<div class="col-sm-12 col-md-12">
					<jdf:table items="items" var="currentRowObject" retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit" action="page">
						<jdf:export view="csv" fileName="country.csv" tooltip="Export CSV" imageName="csv" />
						<jdf:export view="xls" fileName="country.xls" tooltip="Export EXCEL" imageName="xls" />
						<jdf:row>
							<jdf:column property="nameZh" title="国家名称" style="width:20%" />
							<jdf:column property="nameEn" title="英文名称" style="width:20%" />
							<jdf:column property="areaCode" title="区          号" style="width:10%" />
							<jdf:column property="status" title="状态" headerStyle="width:10%;">
								<jdf:columnValue dictionaryId="111" value="${currentRowObject.status}" />
							</jdf:column>
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" style="">
								<a href="${dynamicDomain}/admin/country/edit/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large"> 
									<span class="glyphicon glyphicon-edit"></span> 
									<jdf:message code="common.button.edit" />
								</a>
								<a href="javascript:toDeleteUrl('${dynamicDomain}/admin/country/delete/${currentRowObject.objectId}')" class="btn btn-danger btn-mini"> 
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
</body>
</html>