<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>展会管理</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span>
			展会管理
			<div class="pull-right" id="cd">
					 <a  href="${dynamicDomain}/admin/exhibition/page"  class="btn btn-primary">
	           			<span class="glyphicon glyphicon-th-list"></span><jdf:message code="返回列表"/>
	           		 </a>
			</div>	
		</div>
		
		<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/admin/exhibition/save?ajax=1" class="form-horizontal" id="editForm">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message=="success"?"操作成功":""}
						</div>
					</div>
					<input type="hidden" name="objectId">
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="companyName" class="col-sm-3 control-label">企业名称</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="companyName" name="companyName" readonly="true">
									<input type="hidden" class="form-control" id="companyId" name="companyId">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<div class="col-sm-8">
									<a href="${dynamicDomain}/admin/company/selectCompany?ajax=1" class="btn btn-info btn-mini colorbox-big"> 
										<span class="glyphicon glyphicon-asterisk"></span>
										选择企业
									</a>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="attendDate" class="col-sm-3 control-label">展位号</label>
								<div class="col-sm-8">
									<input type="text" class="required form-control" maxlength="16" id="boothNo" name="boothNo">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="" class="col-sm-3 control-label">展会时间</label>
								<div class="col-sm-9">
                                   <input value="<fmt:formatDate value="${entity.startDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" type="text" style="width:150px;height:33px;" id="startDate" name="startDate" size="14" class="required Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'endDate\')}',readOnly:true})">~ 
                                   <input value="<fmt:formatDate value="${entity.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" type="text" style="width:150px;height:33px;" id="endDate" name="endDate" size="14" class="required Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'startDate\')}',readOnly:true})"> 
                                </div>
							</div>
						</div>
					</div>
					<div class="tab-v1 margin-bottom-40">
			          <ul class="nav nav-tabs">
			            <li class="active"><a href="#button-1" data-toggle="tab" aria-expanded="true">中文</a></li>
			            <li class=""><a href="#button-2" data-toggle="tab" aria-expanded="false">English</a></li>
			          </ul>
			          <div class="tab-content" style="border:1px solid #ddd; padding:20px;">
			            <div class="tab-pane fade active in" id="button-1">
			              <div class="clearfix margin-bottom-10"></div>
									<div class="row">
										<div class="col-sm-12 col-md-12">
											<div class="form-group">
												<label for="nameZh" class="col-sm-2 control-label">展会名称:</label>
												<div class="col-sm-10">
													<input type="text" class="required form-control" maxlength="32" id="nameZh" name="nameZh">
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-12 col-md-12">
											<div class="form-group">
												<label for="addressZh" class="col-sm-2 control-label">展会地址:</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" maxlength="64" id="addressZh" name="addressZh">
													</div>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane fade" id="button-2">
             						<div class="clearfix margin-bottom-10"></div>
									<div class="row">
										<div class="col-sm-12 col-md-12">
											<div class="form-group">
												<label for="nameEn" class="col-sm-3 control-label">Exhibition Name:</label>
												<div class="col-sm-9">
													<input type="text" class="required form-control" maxlength="64" id="nameEn" name="nameEn">
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-12 col-md-12">
											<div class="form-group">
												<label for="addressEn" class="col-sm-3 control-label">Exhibition Address:</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" maxlength="128" id="addressEn" name="addressEn">
													</div>
											</div>
										</div>
									</div>
								</div>	
		    				</div>
						</div>
						<c:if test="${message!='success'}">
							<div class="row">
								<div class="col-sm-12 col-md-6">
									<div class="pull-right">
										<button  type="button" class="btn btn-success" onclick="saveSubmit()">
												<span class="glyphicon glyphicon-ok"></span><jdf:message code="common.button.save"/>
										</button>
									</div>
								</div>
							</div>
						</c:if>	
				</form>
			</jdf:form>
		</div>
	</div>
	<jdf:bootstrapDomainValidate domain="Exhibition" />
<script type="text/javascript">
		reloadParent=false;
		
		function saveSubmit(){
			if($("#companyName").val()==''){
		        alert('请选择企业！');
		        return false;
		    }
			$("#editForm").submit();
		}	
		
</script>	
</body>