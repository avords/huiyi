<%@page import="com.mvc.member.model.Company"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>会员级别管理</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span>
			会员级别管理
		</div>
		<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/admin/company/leaguerSave?ajax=1" class="form-horizontal" id="editForm">
					<input type="hidden" name="objectId">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">${message}</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="nameZh" class="col-sm-3 control-label"> 
									企业名称
								</label>
								<div class="col-sm-8">
									<label for="nameZh" id="nameZh" name="nameZh">
										${entity.nameZh}
									</label>	
								</div>
							</div>
						</div>						
					</div>

					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="nameEn" class="col-sm-3 control-label"> 
									英文名称
								</label>
								<div class="col-sm-8">
									<label for="nameEn" id="nameEn" name="nameEn"> 
										${entity.nameEn}
									</label>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="level" class="col-sm-3 control-label">会员级别</label>
								<div class="col-sm-8">
									<huiyi:radio dictionaryId="1402" name="level"/>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="isCheck" class="col-sm-3 control-label">是否验厂</label>
								<div class="col-sm-8">
									<huiyi:radio dictionaryId="109" name="isCheck"/>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="isAllow" class="col-sm-3 control-label">是否许可</label>
								<div class="col-sm-8">
									<huiyi:radio dictionaryId="109" name="isAllow"/>
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
							</div>
						</div>
					</div>
					
				</form>
			</jdf:form>
		</div>
	</div>
	<jdf:bootstrapDomainValidate domain="Leaguer" />
</body>