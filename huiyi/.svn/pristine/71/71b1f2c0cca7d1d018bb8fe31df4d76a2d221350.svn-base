<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>会员管理</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span>会员管理
			<div class="pull-right">
				 <a href="${dynamicDomain}/admin/member/create?ajax=1&departmentId=${param.search_EQL_departmentId}" class="btn btn-primary colorbox-large">
           			<span class="glyphicon glyphicon-plus"></span><jdf:message code="common.button.add"/>
           		 </a>
			</div>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/admin/member/page?ajax=${param.ajax}" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<c:if test="${!empty adminName }">
						<div class="row">
							<div class="col-sm-6 col-md-6">
								<div class="form-group">
									<label for="adminName" class="col-sm-3 control-label"><jdf:message code="管理员" /></label>
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
								<label for="search_LIKES_loginName" class="col-sm-3 control-label">登录邮箱</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="search_LIKES_loginName" name="search_LIKES_loginName">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_userName" class="col-sm-3 control-label">昵称</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="search_LIKES_userName" name="search_LIKES_userName">
								</div>
							 </div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12  col-md-12">
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
					<jdf:table items="items" retrieveRowsCallback="limit" var="currentRowObject" filterRowsCallback="limit" sortRowsCallback="limit" action="page?ajax=${param.ajax}">
						<jdf:export view="csv" fileName="User.csv" tooltip="Export CSV" imageName="csv" />
						<jdf:export view="xls" fileName="User.xls" tooltip="Export EXCEL" imageName="xls" />
						<jdf:row>
							<jdf:column property="loginName" title="登录邮箱" headerStyle="width:15%;" />
							<jdf:column property="userName" title="昵称" headerStyle="width:15%;"/>
							<jdf:column property="mobile" title="手机号码" headerStyle="width:10%;"/>
							<jdf:column property="status" title="状态" headerStyle="width:10%;">
								<jdf:columnValue dictionaryId="111" value="${currentRowObject.status}" />
							</jdf:column>
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" headerStyle="">
								<a href="${dynamicDomain}/admin/member/edit/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large">
									<span class="glyphicon glyphicon-edit"></span>
									<jdf:message code="common.button.edit" />
								</a>
								<a href="${dynamicDomain}/admin/member/resetPassword/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox">
									<span class="glyphicon glyphicon-lock"></span> 
									<jdf:message code="system.lable.user.reset_password" />
								</a>
								<a href="javascript:toDeleteUrl('${dynamicDomain}/admin/member/delete/${currentRowObject.objectId}')"	class="btn btn-danger btn-mini"> 
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