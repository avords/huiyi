<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>国际化配置</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<i class="icon-edit"></i>国际化配置
		</div>
		<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/admin/messageProperty/saveMessageProperty?ajax=1" class="form-horizontal" id="editForm">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12 col-md-12">
							<div class="form-group">
								<label for="messageKey" class="col-sm-2 control-label">
									<jdf:message code="system.lable.message_property.key"/>：
								</label>
								<div class="col-sm-8">
									<input type="text" name="messageKey" value="${messageKey}" class="form-control required">
								</div>
							</div>
						</div>
					</div>
					<c:forEach varStatus="num" var="item" items="${messageProperties}">
					<div class="row">
						<div class="col-sm-12 col-md-12">
							<div class="form-group">
								<input type="hidden" name="messageProperties[${num.index }].languageId" value="${item.language.objectId}">
								<label for="messageProperties[${num.index }].messageValue" class="col-sm-2 control-label">
									${item.language.displayName}(${item.language.name})：
								</label>
								<div class="col-sm-8">
									<input type="text" name="messageProperties[${num.index }].messageValue" value="${item.messageValue}" class="form-control required" >
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
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
</body>