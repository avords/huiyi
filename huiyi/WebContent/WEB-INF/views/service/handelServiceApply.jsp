<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="处理申请"/></title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="menu-icon glyphicon glyphicon-align-left icon-white"></span>
			<jdf:message code="处理申请"/>
		</div>
		<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/admin/serviceApply/saveHandel/${entity.objectId}?ajax=1" class="form-horizontal" id="editForm">
					<div class="col-sm-12 alert alert-info" id="messageBox">
						${message=="success"?"操作成功":""}
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="status" class="col-sm-3 control-label">处理方式</label>
								<div class="col-sm-8">
									<select class="form-control" name="status">
										<option value="">请选择</option>
										<option value="3">接受</option>
										<option value="4">拒绝</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
	                        	<div class="form-group">
	                            	<label for="handleContent" class="col-sm-3 control-label">
	                               		<jdf:message code="处理方案" />
	                               	</label>
	                                <div class="col-sm-8">
	                                 	<textarea class="form-control" id="handleContent"   name="handleContent" rows="3" cols="" style="width: 360px;" ></textarea>
	                                </div>
	                            </div>
	                   </div>
					</div>	
					<div class="row">
						<c:if test="${message!='操作成功'}">
							<div class="col-sm-12 col-md-6">
								<div class="pull-right">
									<button type="submit" class="btn btn-primary" id="submitBtn" >
										<span class="glyphicon glyphicon-ok"></span><jdf:message code="common.button.save"/>
									</button>
								</div>
							</div>
							</c:if>	
					</div>
				</form>
			</jdf:form>
		</div>
	</div>
	<jdf:bootstrapDomainValidate domain="ServiceApply" />
	<script type="text/javascript">
	</script>
</body>