<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>展会列表</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span>
			展会列表
			<div class="pull-right">
				<a href="${dynamicDomain}/admin/exhibition/create" class="btn btn-primary"> 
					<span class="glyphicon glyphicon-plus"></span>
					<jdf:message code="common.button.add" />
				</a>
			</div>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/admin/exhibition/page" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">${message}</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_nameZh" class="col-sm-3 control-label">
									展会名称
								</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" id="search_LIKES_nameZh" name="search_LIKES_nameZh">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="attendDate" class="col-sm-3 control-label">
									参展时间
								</label>
								<div class="col-sm-7">
									<input value="<fmt:formatDate value="${attendDate}" pattern="yyyy-MM-dd"/>" type="text"  id="attendDate" name="attendDate" size="14" class="form-control Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})">
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
						<jdf:export view="csv" fileName="exhibition.csv" tooltip="Export CSV" imageName="csv" />
						<jdf:export view="xls" fileName="exhibition.xls" tooltip="Export EXCEL" imageName="xls" />
						<jdf:row>
							<jdf:column property="nameZh" title="展会名称" style="width:15%" />
							<jdf:column property="nameEn" title="英文名称" style="width:15%" />
							<jdf:column property="companyName" title="公司名称" style="width:15%" sortable="false"/>
							<jdf:column property="boothNo" title="展位号" headerStyle="width:8%;"/>
							<jdf:column property="startDate" title="开始时间" headerStyle="width:15%;" format="yyyy-MM-dd HH:mm:ss" cell="date"/>
							<jdf:column property="endDate" title="结束时间" headerStyle="width:15%;" format="yyyy-MM-dd HH:mm:ss" cell="date"/>
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" style="17%">
								<a href="${dynamicDomain}/admin/exhibition/edit/${currentRowObject.objectId}" class="btn btn-primary btn-mini"> 
									<span class="glyphicon glyphicon-edit"></span> 
									<jdf:message code="common.button.edit" />
								</a>
								<a href="javascript:toDeleteUrl('${dynamicDomain}/admin/exhibition/delete/${currentRowObject.objectId}')" class="btn btn-danger btn-mini"> 
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