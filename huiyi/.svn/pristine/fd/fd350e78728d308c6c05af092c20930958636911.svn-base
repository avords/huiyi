<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="system.menu.role"/></title>
</head>
<body>
	 <div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-edit"></span><jdf:message code="system.menu.role"/>
		</div>
	  	<div class="panel-body">
	  		<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/admin/role/save?ajax=1" class="form-horizontal" id="editForm">
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
									<jdf:message code="system.lable.role.name"/>
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="name" name="name" maxlength="20">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="type" class="col-sm-3 control-label">
									<jdf:message code="system.lable.role.type"/>
								</label>
								<div class="col-sm-8">
									<select name="type" class="form-control">
										<option></option>
										<jdf:select dictionaryId="102" />
									</select>
								</div>
							</div>
						</div>
					</div>
				  	<div class="row">
						<div class="col-sm-12 col-md-6">
							<div class="pull-right">
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
	<jdf:bootstrapDomainValidate domain="Role"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#name").rules("add", { 
				remote:{
					  url: "${dynamicDomain}/admin/role/roleNameExists?ajax=1&objectId=${entity.objectId}", 
					  type: "post",
					  dataType: "json"
				},
				messages:{
					remote:"该角色名已存在"
				}
			});
			refreshParentPage(true);
		});
	</script>
</body>