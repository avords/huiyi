<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<jdf:themeFile file="ajaxfileupload.js" />
<title>
	询盘信息查看
</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-pencil"></span>
				询盘信息查看
		</div>
		<div class="panel-content">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/admin/inquiry/save?ajax=1" class="form-horizontal" id="editForm" enctype="multipart/form-data">
						<input type="hidden" name="objectId">
						<div class="span12 alert alert-info" id="messageBox">
							${message}
						</div><br>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="fromCompanyId" class="col-sm-3 control-label">发送公司:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="fromCompanyId" name="fromCompanyId">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="toCompany" class="col-sm-3 control-label">接收单位</label>
								<div class="col-sm-6">
										<select class="form-control" name="toCompany" >
											<option value="">请选择</option>
												<jdf:select dictionaryId="1017" />
										</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="name" class="col-sm-3 control-label">产品名称</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="name" name="name" style="width: 240px;">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="description" class="col-sm-3 control-label">产品描述</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="description" name="description" >
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="isFile" class="col-sm-3 control-label">是否有附件</label>
									<div class="col-sm-6">
										<select class="form-control" name="isFile" >
											<option value="">请选择</option>
												<jdf:select dictionaryId="109" />
										</select>
									</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
								<div class="form-group">
									<label for="type" class="col-sm-3 control-label">分类</label>
									<div class="col-sm-6">
										<select class="form-control" name="type" >
											<option value="">请选择</option>
												<jdf:select dictionaryId="1013" />
										</select>
									</div>
								</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="enquiryNum" class="col-sm-3 control-label">购买数量</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="enquiryNum" name="enquiryNum" style="width: 240px;">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="enquiryUnit" class="col-sm-3 control-label">计数单位</label>
								<div class="col-sm-6">
									<select class="form-control" name="enquiryUnit" >
											<option value="">请选择</option>
												<jdf:select dictionaryId="1016" />
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="sendDate" class="col-sm-3 control-label" >发送时间</label>
								<div class="col-sm-8">
									<input type="text" id="sendDate" name="sendDate" class="Wdate" style="width:343px"
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="endDate" class="col-sm-3 control-label" >截至时间</label>
								<div class="col-sm-8">
									<input type="text" id="endDate" name="endDate" class="Wdate" style="width:343px"
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})">
								</div>
							</div>
						</div>
					</div>
	                  <div class="row">
							<div class="col-sm-12 col-md-12">
								<div class="pull-right">
									<button  type="submit" class="btn btn-success">
										<span class="glyphicon glyphicon-ok"></span><jdf:message code="common.button.save"/>
									</button>
								</div>
							</div>
						</div>	
				</form>
			</jdf:form>
		</div>
	</div>
</body>