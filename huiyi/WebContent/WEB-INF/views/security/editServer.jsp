<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="system.menu.server"/></title>
</head>
<body>
	 <div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span><jdf:message code="system.menu.server"/>
		 </div>
	  	<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/admin/server/save?ajax=1" class="form-horizontal" id="editForm">
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
									<jdf:message code="system.lable.server.name"/>
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="name" name="name">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="protocol" class="col-sm-3 control-label">
									<jdf:message code="system.lable.server.protocol"/>
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="protocol" name="protocol">
								</div>
							 </div>
						</div>
					 </div>
				 	 
					 <div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="context" class="col-sm-3 control-label">
									<jdf:message code="system.lable.server.context"/>
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="context" name="context">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="domain" class="col-sm-3 control-label">
									<jdf:message code="system.lable.server.domain_name"/>
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="domain" name="domain">
								</div>
							 </div>
						</div>
					 </div>
					 
					  <div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="port" class="col-sm-3 control-label">
									<jdf:message code="system.lable.server.port"/>
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="port" name="port">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="ip" class="col-sm-3 control-label">
									IP
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="ip" name="ip">
								</div>
							 </div>
						</div>
					 </div>
					 
					 <div class="row">
				 		<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="status" class="col-sm-3 control-label">
									<jdf:message code="common.lable.status"/>
								</label>
								<div class="col-sm-8">
									<select name="status" class="form-control">
										<option value="">
											<jdf:message code="common.lable.pleaseSelect"/>
										</option>
										<jdf:select dictionaryId="107"/>
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
	<jdf:bootstrapDomainValidate domain="Server"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#name").rules("add", { 
				remote:{
					  url: "${dynamicDomain}/admin/server/serverNameExists?ajax=1&objectId=${entity.objectId}", 
					  type: "post",
					  dataType: "json"
				},
				messages:{
					remote:"该名称已存在"
				}
			});
			refreshParentPage(true);
		});
	</script>
</body>
</html>