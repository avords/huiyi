<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="com.mvc.security.SecurityConstants"%>
<%@ include file="../common/header.jsp"%>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			
				<span class="glyphicon glyphicon-user"></span>
				修改密码
			
		</div>
		<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form id="changePasswordForm" method="post" action="${dynamicDomain}/admin/user/savePassword?ajax=1" class="form-horizontal">
					<input type="hidden" name="loginName" value="<%=session.getAttribute(SecurityConstants.LOGIN_NAME)%>" />
					 <div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					 <div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="oldPassword" class="col-sm-3 control-label">原密码</label>
								<div class="col-sm-8">
									<input type="password" class="form-control" id="oldPassword" name="oldPassword"  placeholder="原密码">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="newPassword" class="col-sm-3 control-label">新密码</label>
								<div class="col-sm-8">
									<input type="password" class="form-control" id="newPassword" name="newPassword"  placeholder="新密码">
								</div>
							</div>
						</div>
					</div>
				 	<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="oldPassword" class="col-sm-3 control-label">再输一遍</label>
								<div class="col-sm-8">
									<input type="password" class="form-control" id="confirmPassword" name="confirmPassword"  placeholder="再输一遍">
								</div>
							</div>
						</div>
					</div>	 
		  			<div class="row">
						<div class="col-sm-12 col-md-6">
							<div class="pull-right">
							<button type="submit" class="btn btn-primary">
								<span class="glyphicon glyphicon-ok"></span>提交
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
			$("#changePasswordForm").validate({
				rules:{
					oldPassword:{required:true},
					newPassword:{required:true,maxlength:30},
					confirmPassword:{required:true,equalTo:'#newPassword'}
				}
			});
			refreshParentPage(false);
		});
	</script>
</body>
