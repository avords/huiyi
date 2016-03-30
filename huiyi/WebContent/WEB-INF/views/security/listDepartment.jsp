<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="system.menu.department"/></title>
</head>
<body>
	<div class="panel panel-default" style="overflow: visible;">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span><jdf:message code="system.menu.department"/>
			<div class="pull-right">
				<a href="${dynamicDomain}/admin/department/create?ajax=1" class="btn btn-success colorbox-large">
					<span class="glyphicon glyphicon-plus"></span><jdf:message code="common.button.add"/>
				</a>
			</div>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/admin/department/page" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_name" class="col-sm-2 control-label">
									<jdf:message code="system.lable.dept.department_id"/>
								</label>
								<div class="col-sm-8">
									<input type="text"  id="search_EQL_objectId" name="search_EQL_objectId">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_name" class="col-sm-2 control-label">
									<jdf:message code="system.lable.dept.name"/>
								</label>
								<div class="col-sm-8">
									<input type="text"  id="search_LIKES_name" name="search_LIKES_name">
								</div>
							</div>
						</div>
				 	</div>
					<div class="row">
						<div class="col-sm-12  col-md-12">
							<div class="right">
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
			<div id="tableDiv" class="row" style="text-align: center">
				<div class="col-sm-12 col-md-12">
					<jdf:table items="items" var="currentRowObject" retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit" action="page">
						<jdf:export view="csv" fileName="department.csv" tooltip="导出CSV" imageName="csv" />
						<jdf:export view="xls" fileName="department.xls" tooltip="导出EXCEL" imageName="xls" />
						<jdf:row>
						    <jdf:column property="objectId" title="system.lable.dept.department_id" style="width: 10%" />
						    <jdf:column property="name" title="system.lable.dept.name" style="width: 15%" />
						   	<jdf:column property="fullName" title="部门层级" style="width: 15%" />
							<jdf:column property="layer" title="部门编码" style="width: 20%" />
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" style="width: 30%">
								<a href="${dynamicDomain}/admin/department/edit/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large">
                                    <span class="glyphicon glyphicon-edit"></span>
                                    <jdf:message code="common.button.edit" />
                                </a>
                                <a href="javascript:toDeleteUrl('${dynamicDomain}/admin/department/delete/${currentRowObject.objectId}')"   class="btn btn-danger btn-mini"> 
                                    <span class="glyphicon glyphicon-trash"></span>
                                    <jdf:message code="common.button.delete" />
                                </a>
							</jdf:column>
						</jdf:row>
					</jdf:table>
				</div>
			</div>
		</div>
		<div style="clear: both;height: 0px;"></div>
	</div>
</body>

