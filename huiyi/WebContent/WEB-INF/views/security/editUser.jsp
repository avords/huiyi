<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="system.menu.user" /></title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span>
			<jdf:message code="system.menu.user" />
		</div>
		<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/admin/user/save?ajax=1" class="form-horizontal" id="editForm">
					<input type="hidden" name="objectId">
					<div class="col-sm-12 alert alert-info" id="messageBox">
						${message}
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="loginName" class="col-sm-3 control-label"><jdf:message code="system.lable.user.login_name" /></label>
								<div class="col-sm-8">
									<input type="text" class="form-control {maxlength:50}" id="loginName" name="loginName" >
									<span id="notUniqueUser" style="color: red;"></span>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="userName" class="col-sm-3 control-label"><jdf:message code="system.lable.user.user_name" /></label>
								<div class="col-sm-8">
									<input type="text" class="form-control {maxlength:50}" id="userName" name="userName">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="email" class="col-sm-3 control-label"><jdf:message code="common.lable.email" /></label>
								<div class="col-sm-8">
									<input type="text" class="form-control email" id="email" name="email">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="type" class="col-sm-3 control-label"><jdf:message code="system.lable.user.type" /></label>
								<div class="col-sm-8">
									<select class="form-control" name="type" id="type">
										<option value=""></option>
										<jdf:select dictionaryId="104" />
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<c:choose>
							<c:when test="${not empty param.departmentId }">
								<input type="hidden" name="departmentId" id="departmentId" value=${param.departmentId}>
							</c:when>
							<c:otherwise>
								<div class="col-sm-6 col-md-6">
									<div class="form-group">
										<label for="departmentId" class="col-sm-3 control-label">所属部门</label>
										<div class="col-sm-8">
											<select name="departmentId" class="form-control">
												<option value="">请选择</option>
												<jdf:selectCollection items="departments" optionValue="objectId" optionText="fullName"/>
											</select>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="status" class="col-sm-3 control-label"><jdf:message code="common.lable.status" /></label>
								<div class="col-sm-8">
									<select class="form-control" name="status">
										<option value=""></option>
										<jdf:select dictionaryId="111" />
									</select>
								</div>
							</div>
						</div>
					</div>
					<c:if test="${empty entity.objectId }">
 					<div class="row">
 						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="password" class="col-sm-3 control-label"> <jdf:message code="system.lable.user.password" /></label>
								<div class="col-sm-8">
									<input type="password" class="form-control" id="password" name="password">
 								</div>
 							</div>
 						</div>
 						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="confirmPassword" class="col-sm-3 control-label"><jdf:message code="system.lable.user.confirm_password" /></label>
 								<div class="col-sm-8">
									<input type="password" class="form-control " id="confirmPassword" name="confirmPassword">
 								</div>
							</div>
 						</div>
 					</div>
 					</c:if>
					<div class="row">
						<div class="col-sm-12 col-md-6">
							<div class="pull-right">
								<button type="submit" class="btn btn-primary" id="submitBtn">
									<span class="glyphicon glyphicon-ok"></span><jdf:message code="common.button.save"/>
								</button>
							</div>
						</div>
					</div>
				</form>
			</jdf:form>
		</div>
	</div>
	<jdf:bootstrapDomainValidate domain="User" />
	<script type="text/javascript">
		$(document).ready(function() {
			<c:if test="${not empty entity}">
				$("#type").attr("disabled", "disabled");
				$("#editForm").append("<input type='hidden' name='type' value='${entity.type}'/>");
				$(".pass").hide();
			</c:if>
			
		});
		$(document).ready(function() {
			$("#confirmPassword").rules("add",{				
				required:true,
				equalTo:'#password'
			});
            $("#loginName").rules("add",{
                remote : {
                    url : "${dynamicDomain}/admin/user/isUnique?ajax=1&fieldName=loginName&objectId=${entity.objectId}",
                    type : "post",
                    data: {
                        value: function () {
                            return $('#loginName').val();
                        }
                    },
                    dataType : "json"
                },
                messages : {
                    remote : "该登录名已存在"
                }
            });
            refreshParentPage(true);
        });
	</script>
</body>