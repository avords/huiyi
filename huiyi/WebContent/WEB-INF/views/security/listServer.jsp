<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="system.menu.server"/></title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span><jdf:message code="system.menu.server"/>
			<div class="pull-right">
				 <a href="${dynamicDomain}/admin/server/create?ajax=1" class="btn btn-primary colorbox-large">
           			<span class="glyphicon glyphicon-plus"></span><jdf:message code="common.button.add"/>
           		 </a>
			</div>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/admin/server/page" method="post" class="form-horizontal">
				 	<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_name" class="col-sm-2 control-label">
									<jdf:message code="system.lable.server.name"/>
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="search_LIKES_name" name="search_LIKES_name">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_context" class="col-sm-2 control-label">
									<jdf:message code="system.lable.server.context"/>
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="search_LIKES_context" name="search_LIKES_context">
								</div>
							 </div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_domain" class="col-sm-2 control-label">
									<jdf:message code="system.lable.server.domain_name"/>
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="search_LIKES_domain" name="search_LIKES_domain">
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
			<div id="tableDiv" class="row">
				<div class="col-sm-12 col-md-12">
					<jdf:table items="items" var="currentRowObject" retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit" action="page">
						<jdf:export view="csv" fileName="server.csv" tooltip="Export CSV" imageName="csv" />
						<jdf:export view="xls" fileName="server.xls" tooltip="Export EXCEL" imageName="xls" />
						<jdf:row>
							<jdf:column property="objectId" title="common.lable.id" style="width: 10%" />
							<jdf:column property="name" title="system.lable.server.name" style="width:20%" />
							<jdf:column property="domain" title="system.lable.server.domain_name" style="width:20%" />
							<jdf:column property="port" title="system.lable.server.port" style="width:10%" />
							<jdf:column property="context" title="system.lable.server.context" style="width:10%" />
							<jdf:column property="status" title="common.lable.status" style="width:5%">
								<jdf:columnValue dictionaryId="107" value="${currentRowObject.status}" />
							</jdf:column>
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" style="width: 25%">
								<a href="${dynamicDomain}/admin/server/edit/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large">
									<span class="glyphicon glyphicon-edit"></span>
									<jdf:message code="common.button.edit"/>
								</a>
								<a href="javascript:toDeleteUrl('${dynamicDomain}/admin/server/delete/${currentRowObject.objectId}')" class="btn btn-danger btn-mini">
									<span class="glyphicon glyphicon-trash"></span>
									<jdf:message code="common.button.delete"/>
								</a>
							</jdf:column>
						</jdf:row>
					</jdf:table>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			
		});
	</script>
</body>
</html>