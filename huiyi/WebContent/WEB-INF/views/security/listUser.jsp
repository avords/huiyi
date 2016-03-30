<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="system.menu.user" /></title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span><jdf:message code="system.menu.user"/>
			<div class="pull-right">
				 <a href="${dynamicDomain}/admin/user/create?ajax=1&departmentId=${param.search_EQL_departmentId}" class="btn btn-primary colorbox-large">
           			<span class="glyphicon glyphicon-plus"></span><jdf:message code="common.button.add"/>
           		 </a>
			</div>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/admin/user/page?ajax=${param.ajax}" method="post" class="form-horizontal">
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
								<label for="search_LIKES_loginName" class="col-sm-3 control-label"><jdf:message code="system.lable.user.login_name" /></label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="search_LIKES_loginName" name="search_LIKES_loginName">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_userName" class="col-sm-3 control-label"><jdf:message code="system.lable.user.user_name" /></label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="search_LIKES_userName" name="search_LIKES_userName">
								</div>
							 </div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_email" class="col-sm-3 control-label"><jdf:message code="common.lable.email" /></label>
								<div class="col-sm-8">
									<input type="email" class="form-control" id="search_LIKES_email" name="search_LIKES_email">
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
							<jdf:column property="loginName" title="system.lable.user.login_name" headerStyle="width:15%;" />
							<jdf:column property="userName" title="system.lable.user.user_name" headerStyle="width:15%;"/>
							<jdf:column property="email" title="common.lable.email" headerStyle="width:15%;"/>
							<jdf:column property="type" title="system.lable.user.type" headerStyle="width:20%;">
								<jdf:columnValue dictionaryId="104" value="${currentRowObject.type}" />
							</jdf:column>
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" headerStyle="width:35%;">
								<a href="${dynamicDomain}/admin/user/edit/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large">
									<span class="glyphicon glyphicon-edit"></span>
									<jdf:message code="common.button.edit" />
								</a>
								<a href="${dynamicDomain}/admin/user/editUserRole/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-big"> 
									<span class="glyphicon glyphicon-asterisk"></span>
									<jdf:message code="system.lable.user.config_role" />
								</a>
								<a href="${dynamicDomain}/admin/user/resetPassword/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox">
									<span class="glyphicon glyphicon-lock"></span> 
									<jdf:message code="system.lable.user.reset_password" />
								</a>
								<a href="javascript:toDeleteUrl('${dynamicDomain}/admin/user/delete/${currentRowObject.objectId}')"	class="btn btn-danger btn-mini"> 
									<span class="glyphicon glyphicon-trash"></span>
									<jdf:message code="common.button.delete" />
								</a>
								<a href="javascript:unlock('${currentRowObject.loginName}')" class="btn btn-primary btn-mini unlock"> 
									<span class="glyphicon glyphicon-gbp"></span>
									<jdf:message code="system.lable.login.unlock" />
								</a>
							</jdf:column>
						</jdf:row>
					</jdf:table>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function unlock(loginName) {
			$(".unlock").attr("disabled", true);
			$.ajax({
				url : "${dynamicDomain}/admin/user/unlock/" + loginName + "?timstamp=" + (new Date()).valueOf(),
				type : 'post',
				dataType : 'json',
				success : function(msg) {
					if (msg.result) {
						showMessage("解锁成功", 60000);
					}
					$(".unlock").attr("disabled", false);
				}
			});
		}
	</script>
</body>
</html>