<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="system.menu.role"/></title>
</head>
<body>
	 <div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span><jdf:message code="system.menu.role"/>
			<div class="pull-right">
				 <a href="${dynamicDomain}/admin/role/create?ajax=1"  class="btn btn-primary colorbox-large">
           			<span class="glyphicon glyphicon-plus"></span><jdf:message code="common.button.add"/>
           		 </a>
			</div>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/admin/role/page" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_name" class="col-sm-2 control-label">
									<jdf:message code="system.lable.role.name"/>
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="search_LIKES_name" name="search_LIKES_name">
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
					<jdf:table items="items" retrieveRowsCallback="limit" var="currentRowObject" filterRowsCallback="limit" sortRowsCallback="limit" action="page">
						<jdf:export view="csv" fileName="Role.csv" tooltip="Export CSV" imageName="csv" />
						<jdf:export view="xls" fileName="Role.xls" tooltip="Export EXCEL" imageName="xls" />
						<jdf:row>
							<jdf:column property="name" title="system.lable.role.name" style="width:30%;" />
							<jdf:column property="type" title="system.lable.role.type" style="width:30%;">
								<jdf:columnValue dictionaryId="102" value="${currentRowObject.type}" />
							</jdf:column>
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" style="width: 40%;">
								<a href="${dynamicDomain}/admin/role/edit/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large">
									<span class="glyphicon glyphicon-edit"></span>
									<jdf:message code="common.button.edit"/>
								</a>
								<a href="${dynamicDomain}/admin/role/editRoleMenu/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large">
									<span class="glyphicon glyphicon-asterisk"></span>
									<jdf:message code="system.lable.role.config_menu"/>
								</a>
								<a href="${dynamicDomain}/admin/role/editRoleUser/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large">
									<span class="glyphicon glyphicon-asterisk"></span>
									<jdf:message code="system.lable.role.config_user"/>
								</a>
								<a href="javascript:toDeleteUrl('${dynamicDomain}/admin/role/delete/${currentRowObject.objectId}')" class="btn btn-danger btn-mini">
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