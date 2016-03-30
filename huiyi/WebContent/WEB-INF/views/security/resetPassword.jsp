<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span>重置“${entity.loginName}”的密码
		</div>
	  	<div class="panel-body">	 
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/admin/user/saveReset?ajax=1" class="form-horizontal" id="editForm">
					<input type="hidden" name="objectId">
					 	<div class="row">
							<div class="col-sm-12 alert alert-info" id="messageBox">
								${message}
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6 col-md-6">
								<div class="form-group">
									<label for="newPassword" class="col-sm-3 control-label">
										新密码
									</label>
									<div class="col-sm-8">
										<input type="password" class="form-control"  name="newPassword" id="newPassword" placeholder="新密码">
									</div>
								</div>
							</div>
							<div class="col-sm-6 col-md-6">
								<div class="form-group">
									<label for="confirmPassword" class="col-sm-3 control-label">
										再输一遍
									</label>
									<div class="col-sm-8">
										<input type="password" class="form-control"   name="confirmPassword" id="confirmPassword" placeholder="再输一遍">
									</div>
								 </div>
							</div>
						</div>
				 	  	<div class="row">
							<div class="col-sm-12 col-md-6">
								<div class="pull-right">
							 		 <button type="submit" class="btn btn-primary">
										<span class="glyphicon glyphicon-ok"></span>
										重置
									</button>
								</div>
							</div>
						</div>
					</form>
				</jdf:form>
			</div>
		</div>
	 
	<script type="text/javascript">
		$(document).ready(function(){
			$("#editForm").validate({
				rules:{
					newPassword:{required:true,maxlength:50},
					confirmPassword:{required:true,equalTo:'#newPassword'}
				}
				
			});
			refreshParentPage(false);
		});
	</script>
</body>