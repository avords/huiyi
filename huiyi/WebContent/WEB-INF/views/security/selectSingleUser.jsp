<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="system.menu.user" /></title>
</head>
<body>
	<div class="box border">
		<div class="box-title">
			<h2><span class="glyphicon glyphicon-user"></span><jdf:message code="选择用户"/></h2>
		</div>
		<div class="box-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/admin/selectSingleUser/page?ajax=${param.ajax}" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
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
						<div class="col-sm-6 col-md-6" style="display: none;">
							<div class="form-group">
								<label for="search_GED_createDate" class="col-sm-3 control-label"><jdf:message code="system.lable.user.create_date" /></label>
								<div class="col-sm-8">
									<div class="input-append date" id="search_GED_createDate">
										<input class="form-control Wdate" type="text" name="search_GED_createDate"  id="search_GED_createDate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})">
									</div>
								 </div>
							</div>
						</div>
					</div>
					<div class="row" style="display: none;">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQL_departmentId" class="col-sm-2 control-label">所属部门</label>
								<div class="col-sm-8">
									<select name="search_EQL_departmentId" class="form-control">
										<option value=""></option>
										<jdf:selectCollection items="departments" optionValue="objectId" optionText="fullName"/>
									</select>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_role.name" class="col-sm-2 control-label"><jdf:message code="system.lable.role.name" /></label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="search_LIKES_role.name" name="search_LIKES_role.name">
								</div>
							</div>
						</div>
					</div>
					<div class="row" style="display: none;">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_menu.name" class="col-sm-2 control-label"><jdf:message code="system.lable.menu.name" /></label>
								<div class="col-sm-8">
									<input type="hidden" name="relation_menu.objectId_roleMenu.menuId;roleId_userRole.roleId;userId_user.objectId">
									<input type="text" class="form-control" id="search_LIKES_menu.name" name="search_LIKES_menu.name">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12  col-md-12">
							<div class="right">
								<button type="button" class="btn" onclick="clearSelect()">
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
							<jdf:column property="userName" title="system.lable.user.user_name" headerStyle="width:15%;" />
							<jdf:column property="email" title="common.lable.email" headerStyle="width:15%;" />
							<jdf:column property="type" title="system.lable.user.type" headerStyle="width:20%;">
								<jdf:columnValue dictionaryId="104" value="${currentRowObject.type}" />
							</jdf:column>
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" headerStyle="width:35%;">
								<button type="button"  class="btn btn-primary btn-mini colorbox"  onclick="select('${currentRowObject.objectId }','${currentRowObject.userName }')">选择</button>
							</jdf:column>
						</jdf:row>
					</jdf:table>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var id = "${param.userId}";
		var name = "${param.userName}";
		if(id==""){
			id="userId";
		}
		if(name==""){
			name = "userName";
		}
		function select(userId,userName) {
			parent.$("#" + id).val(userId);
			parent.$("#" + name).val(userName);
			parent.$.colorbox.close();
		}
		
		function clearSelect(){
			parent.$("#" + id).val("");
			parent.$("#" + name).val("");
			parent.$.colorbox.close();
		}
		
	</script>	
</body>
</html>