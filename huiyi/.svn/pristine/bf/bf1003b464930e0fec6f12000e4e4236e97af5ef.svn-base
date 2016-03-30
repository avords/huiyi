<%@page import="com.mvc.base.model.Country"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>国别管理</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span>
			国别管理
		</div>
		<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/admin/country/save?ajax=1" class="form-horizontal" id="editForm">
					<input type="hidden" name="objectId">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">${message}</div>
					</div>
					
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="nameZh" class="col-sm-3 control-label"> 
									国家名称
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="nameZh" name="nameZh">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="nameEn" class="col-sm-3 control-label"> 
									英文名称
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="nameEn" name="nameEn">
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="areaCode" class="col-sm-3 control-label"> 
									区          号
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control {digits : true}" id="areaCode" name="areaCode">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="status" class="col-sm-3 control-label">状态</label>
								<div class="col-sm-8">
									<select class="form-control" name="status" id="status">
										<option value=""></option>
										<jdf:select dictionaryId="111" />
									</select>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-12 col-md-6">
							<div class="pull-right">
								<button type="submit" class="btn btn-primary">
									<span class="glyphicon glyphicon-ok"></span>
									<jdf:message code="common.button.save" />
								</button>
								<c:if test="${not empty message}">
									<button type="button" class="btn btn-primary" onclick="toUrl('${dynamicDomain}/admin/country/create?ajax=1')">
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
	<jdf:bootstrapDomainValidate domain="Country" />
</body>
<script type="text/javascript">
$(document).ready(function () {
	$("#editForm").validate({
		onfocusout: function(element){ $(element).valid(); },
	
		rules : {
			nameZh : {
				maxlength : 32
			},
			nameEn : {
				maxlength : 32
			},
			areaCode : {
				maxlength : 12
			}
		},
		messages : {
			nameZh : {
				maxlength : '国家名称长度不能超过32'
			},
			nameEn : {
				maxlength : '国家英文名称长度不能超过32'
			},
			areaCode : {
				maxlength : '国家区号长度不能超过32'
			}
		},
		highlight : function(element) {
			$(element).closest('.form-group').addClass('bg-danger');
		},
		unhighlight : function(element) {
			$(element).closest('.form-group').removeClass('bg-danger');
		},
		errorPlacement : function(error, element) {
			error.appendTo(element.parent());
		}
	});
});
</script>