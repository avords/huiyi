<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>会员管理</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span>
			会员管理
		</div>
		<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/admin/member/save?ajax=1" class="form-horizontal" id="editForm">
					<input type="hidden" name="objectId">
					<div class="col-sm-12 alert alert-info" id="messageBox">
						${message}
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="loginName" class="col-sm-3 control-label">登录邮箱</label>
								<div class="col-sm-8">
									<input type="text" class="form-control {email:true,maxlength : 32}" id="loginName" name="loginName" >
									<span id="notUniqueUser" style="color: red;"></span>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="userName" class="col-sm-3 control-label">昵称</label>
								<div class="col-sm-8">
									<input type="text" class="form-control {maxlength : 32}" id="userName" name="userName">
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
									<input type="password" class="form-control {maxlength : 64}" id="password" name="password">
 								</div>
 							</div>
 						</div>
 						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="confirmPassword" class="col-sm-3 control-label"><jdf:message code="system.lable.user.confirm_password" /></label>
 								<div class="col-sm-8">
									<input type="password" class="form-control {maxlength : 64}" id="confirmPassword" name="confirmPassword">
 								</div>
							</div>
 						</div>
 					</div>
 					</c:if>
 					
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="status" class="col-sm-3 control-label">状态</label>
								<div class="col-sm-8">
									<select class="form-control {required:true}" name="status" id="status">
										<option value=""></option>
										<jdf:select dictionaryId="111" />
									</select>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="mobile" class="col-sm-3 control-label">手机号码</label>
								<div class="col-sm-8">
									<input type="text" class="form-control {phone:true}" id="mobile" name="mobile">
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="companyName" class="col-sm-3 control-label">企业名称</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="companyName" name="companyName" value="${companyName }" readonly="true">
									<input type="hidden" class="form-control" id="companyId" name="companyId">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<div class="col-sm-8">
									<a href="${dynamicDomain}/admin/company/selectCompany?ajax=1" class="btn btn-primary btn-mini colorbox-big"> 
										<span class="glyphicon glyphicon-asterisk"></span>
										选择企业
									</a>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-12 col-md-6">
							<div class="pull-right">
								<button type="submit" class="btn btn-primary" id="submitBtn">
									<span class="glyphicon glyphicon-ok"></span><jdf:message code="common.button.save"/>
								</button>
								<c:if test="${not empty message}">
									<button type="button" class="btn btn-primary" onclick="toUrl('${dynamicDomain}/admin/member/create?ajax=1')">
										<jdf:message code="common.button.goonAdd" />
										<i class="icon-double-angle-right icon-white"></i>
									</button>
								</c:if>
							</div>
						</div>
					</div>
					
				</form>
			</jdf:form>
		</div>
	</div>
	<jdf:bootstrapDomainValidate domain="Member" />
	<script type="text/javascript">
		reloadParent=false;
		$(document).ready(function() {
			$("#confirmPassword").rules("add",{				
				required:true,
				equalTo:'#password'
			});
            $("#loginName").rules("add",{
                remote : {
                    url : "${dynamicDomain}/admin/member/isUnique?ajax=1&fieldName=loginName&objectId=${entity.objectId}",
                    type : "post",
                    data: {
                        value: function () {
                            return $('#loginName').val();
                        }
                    },
                    dataType : "json"
                },
                messages : {
                    remote : "该登录邮箱已存在"
                }
            });
            $("#mobile").rules("add",{
                remote : {
                    url : "${dynamicDomain}/admin/member/isUnique?ajax=1&fieldName=mobile&objectId=${entity.objectId}",
                    type : "post",
                    data: {
                        value: function () {
                            return $('#mobile').val();
                        }
                    },
                    dataType : "json"
                },
                messages : {
                    remote : "该手机号码已存在"
                }
            });
            refreshParentPage(true);
        });
	</script>
</body>