<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="system.menu.language"/></title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<i class="icon-edit"></i><jdf:message code="system.menu.language"/>
		</div>
		<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/admin/language/save?ajax=1" class="form-horizontal" id="editForm">
					<input type="hidden" name="objectId">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="name" class="col-sm-3 control-label"><jdf:message code="system.lable.language.locale"/></label>
								<div class="col-sm-6">
									<input type="text" name="name" class="form-control"/>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="displayName" class="col-sm-3 control-label"><jdf:message code="system.lable.language.name"/></label>
								<div class="col-sm-6">
									<input type="text" name="displayName" class="form-control"/>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="status" class="col-sm-3 control-label"><jdf:message code="common.lable.status"/></label>
								<div class="col-sm-6">
									<select name="status">
										<option value=""><jdf:message code="common.lable.pleaseSelect"/></option>
										<jdf:select dictionaryId="103"/>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12 col-md-6">
							<div class="pull-right">
								<button type="submit" class="btn btn-primary">
									<span class="glyphicon glyphicon-ok"></span><jdf:message code="common.button.save"/>
								</button>
							</div>
						</div>
					</div>
				</form>
			</jdf:form>
		</div>
	</div>
	<jdf:bootstrapDomainValidate domain="Language"/>
</body>