<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>热门搜索</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span>热门搜索配置
		</div>
		<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/admin/searchWords/save?ajax=1" class="form-horizontal" id="editForm">
					<div class="col-sm-12 alert alert-info" id="messageBox">
						${message}
					</div>
					<input type="hidden" name="objectId"> 
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="nameZh" class="col-sm-3 control-label">中文热词:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="nameZh" name="nameZh" maxlength="32">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
							<div class="col-sm-6 col-md-6">
								<div class="form-group">
									<label for="nameEn" class="col-sm-3 control-label">英文热词:</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="nameEn" name="nameEn" maxlength="32">
									</div>
								</div>
							</div>
						</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="sortNo" class="col-sm-3 control-label">顺序:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="sortNo" min="0" name="sortNo">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="pull-right">
								<c:if test="${ empty message}">
								<button type="submit" class="btn btn-primary" id="submitBtn">
									<span class="glyphicon glyphicon-ok"></span><jdf:message code="common.button.save"/>
								</button>
								</c:if>
								<c:if test="${not empty message}">
									<button type="button" class="btn btn-primary" onclick="toUrl('${dynamicDomain}/admin/searchWords/create?ajax=1')">
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
	<jdf:bootstrapDomainValidate domain="SearchWords" />
<script type="text/javascript">
$(document).ready(
		function() {
			$("#nameZh").rules("add",{
								remote : {
									url : "${dynamicDomain}/admin/searchWords/isUnique?ajax=1&fieldName=nameZh&objectId=${entity.objectId}",
									type : "post",
									data : {
										value : function() {
											return $('#nameZh').val();
										}
									},
									dataType : "json"
								},
								messages : {
									remote : "该热词已添加"
								}
							});
			refreshParentPage(true);
		});
</script>	
</body>