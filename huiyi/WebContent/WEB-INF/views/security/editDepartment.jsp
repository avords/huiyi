<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="system.menu.department"/></title>
</head>
<body>
			<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span>
			<jdf:message code="system.menu.department"/>
		</div>
	  	<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/admin/department/save?ajax=1" class="form-horizontal" id="editForm">
					<input type="hidden" name="objectId">
			 		<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="name" class="col-sm-3 control-label">
									<jdf:message code="system.lable.dept.name"/>
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="name" name="name">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="userName" class="col-sm-3 control-label">
									<jdf:message code="管理员"/>
								</label>
								<div class="col-sm-8">
									<span class="input-group">
										<input type="text" readonly="readonly" class="form-control" name="userName" id="userName"> 
										<input type="hidden" name="leaderId" id="leaderId">
										<span class="input-group-addon"><a href="${dynamicDomain}/admin/selectSingleUser/page?ajax=1&userId=leaderId" class="colorbox-full" id="choose">选择</a></span>
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="name" class="col-sm-3 control-label">
									上级部门
								</label>
								<div class="col-sm-8">
									<select name="parentId" style="width: 200px;" class="form-control">
											<option value="">请选择</option>
											<jdf:selectCollection items="departments" optionValue="objectId" optionText="fullName"/>
										</select>
								</div>
							</div>
						</div>
					</div>
				  	<div class="row">
						<div class="col-sm-12 col-md-6">
							<div class="right">
								<button type="submit" class="btn btn-primary">
									<span class="glyphicon glyphicon-ok"></span><jdf:message code="common.button.save"/>
								</button>
							</div>
						</div>
					</div>
				</form>
			</jdf:form>
		</div>
	</div>
	<jdf:bootstrapDomainValidate domain="Department"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#name").rules("add", { 
				remote:{
					  url: "${dynamicDomain}/admin/department/nameExists?ajax=1&objectId=${entity.objectId}", 
					  type: "post",
					  dataType: "json"
				},
				messages:{
					remote:"该名称已存在"
				}
			});
			refreshParentPage(true);
		});
		$(function(){
			reloadParent = false;
			//alert($('#adminId').val());
		});
	</script>
</body>