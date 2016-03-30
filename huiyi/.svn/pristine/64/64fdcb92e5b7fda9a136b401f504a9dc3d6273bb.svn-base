<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>关联产品分类</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span>${standard.nameZh}关联产品分类
			<div class="pull-right">
			</div>
		</div>
		<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/admin/standard/saveStandardCategory/${objectId}?ajax=1" class="form-horizontal" id="form">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">${message}</div>
					</div>
					<div class="row">
					<c:forEach items="${categories}" var="cat" varStatus="status">
						<div class="col-sm-4 col-md-4">
							<div class="checkbox">
								<label class="col-sm-12"><input type="checkbox" name="categoryId" value="${cat.objectId}" <c:if test="${cat.status==1}">checked</c:if> />${cat.nameZh}</label>
							</div>
						</div>
					</c:forEach>
					</div>
					<div class="row">
						<div class="col-sm-12 col-md-6">
							<div class="pull-right">
								<button type="submit" class="btn btn-primary">
									<jdf:message code="common.button.save" />
									<span class="glyphicon glyphicon-ok"></span>
								</button>
							</div>
						</div>
					</div>
					
				</form>
			</jdf:form>

		</div>
	</div>
</body>
</html>