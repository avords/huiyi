<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>标准管理</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span>标准管理
			<div class="pull-right">
				<a href="${dynamicDomain}/admin/standard/create" class="pull-left btn btn-primary"> 
					<span class="glyphicon glyphicon-plus"></span>
					<jdf:message code="common.button.add" />
				</a>
			</div>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/admin/standard/page?ajax=${param.ajax}" method="post" class="form-horizontal">
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
								<label for="search_LIKES_nameZh" class="col-sm-3 control-label">标准名称</label>
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
							<jdf:column property="nameZh" title="标准名称" headerStyle="width:25%;" />
							<jdf:column property="nameEn" title="英文名称" headerStyle="width:25%;" />
							<jdf:column property="status" title="状态" headerStyle="width:10%;">
								<jdf:columnValue dictionaryId="111" value="${currentRowObject.status}" />
							</jdf:column>
		
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" headerStyle="">
								<a href="${dynamicDomain}/admin/standard/edit/${currentRowObject.objectId}" class="btn btn-mini btn-primary"> 
									<span class="glyphicon glyphicon-edit"></span>  
									<jdf:message code="common.button.edit" />
								</a>
								
								<a href="${dynamicDomain}/admin/standard/configStandardCategory/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large"> 
									<span class="glyphicon glyphicon-random"></span> 
									<jdf:message code="关联产品分类" />
								</a>
								<a href="javascript:toDeleteUrl('${dynamicDomain}/admin/standard/delete/${currentRowObject.objectId}')" class="btn btn-danger btn-mini"> 
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