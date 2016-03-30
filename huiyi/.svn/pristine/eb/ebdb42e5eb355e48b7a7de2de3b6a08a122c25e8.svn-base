<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="服务申请管理"/></title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="menu-icon glyphicon glyphicon-align-left icon-white"></span>
			<jdf:message code="服务申请管理"/>
		</div>
		<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/admin/serviceApply/save?ajax=1" class="form-horizontal" id="editForm">
					<input type="hidden" name="objectId">
					<div class="col-sm-12 alert alert-info" id="messageBox">
						${message}
					</div>
					<div class="row">
						 <div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="serviceId">
								<jdf:message code="服务名称" />
								</label>
								<div class="col-sm-8">
									<select id="serviceId" name="serviceId" class="js-example-placeholder-single" style="width: 100%;background-color: white;" id="serviceId" disabled="disabled">
										<option value="">请选择</option>
										<jdf:selectCollection items="services" optionValue="objectId" optionText="nameZh" />
									</select>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="companyId">
								<jdf:message code="所在公司" />
								</label>
								<div class="col-sm-8">
									<select id="companyId" name="companyId" class="js-example-placeholder-single" style="width: 100%;background-color: white;" id="companyId" disabled="disabled">
										<option value="">请选择</option>
										<jdf:selectCollection items="companys" optionValue="objectId" optionText="nameZh"/>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<%-- <div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="optionId">
								<jdf:message code="服务选项" />
								</label>
								<div class="col-sm-8">
									<select id="optionId" name="optionId" class="js-example-placeholder-single" style="width: 100%;background-color: white;" id="optionId" disabled="disabled">
										<option value="">请选择</option>
										<jdf:selectCollection items="options" optionValue="objectId" optionText="nameZh"/>
									</select>
								</div>
							</div>
						</div> --%>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="status" class="col-sm-3 control-label">状态</label>
								<div class="col-sm-8">
									<select class="form-control" name="status" disabled="disabled">
										<option value="">请选择</option>
										<jdf:select dictionaryId="1302" />
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
				    	<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="applyDate" class="col-sm-3 control-label">申请时间</label>
								<div class="col-sm-8">
									<div class="input-append date" id="applyDate">
										<input class="input-medium" size="14" type="text"name="applyDate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" style="width: 100% ;" disabled="disabled">
										<span class="add-on"><i class="icon-calendar"></i></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="handleDate" class="col-sm-3 control-label">处理时间</label>
								<div class="col-sm-8">
									<div class="input-append date" id="handleDate">
										<input class="input-medium" size="14" type="text"name="handleDate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" style="width: 100% ;"disabled="disabled">
										<span class="add-on"><i class="icon-calendar"></i></span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<%-- <div class="row">
						<div class="col-sm-12 col-md-12">
	                        <div class="form-group">
	                            <label for="content" class="col-sm-2 control-label">
	                              	<jdf:message code="申请内容" />
	                            </label>
	                            <div class="col-sm-10">
	                                 <textarea class="form-control" id="content" name="content" rows="3" cols="" readonly="readonly"></textarea>
	                            </div>
	                        </div>
	                     </div>
					</div> --%>
					<div class="row">
						<div class="col-sm-12 col-md-12">
	                        <div class="form-group">
	                            <label for="handleContent" class="col-sm-2 control-label">
	                              	<jdf:message code="处理方案" />
	                            </label>
	                            <div class="col-sm-10">
	                                 <textarea class="form-control" id="handleContent" name="handleContent" rows="3" cols="" readonly="readonly"></textarea>
	                            </div>
	                        </div>
	                     </div>
					</div>
				</form>
			</jdf:form>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
        });
	</script>
</body>