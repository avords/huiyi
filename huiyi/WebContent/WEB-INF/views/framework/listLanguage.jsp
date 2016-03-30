<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="system.menu.language"/></title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<i class="icon-table"></i><jdf:message code="system.menu.language"/>
			<div class="actions-bar pull-right ">
            	<a href="${dynamicDomain}/admin/language/create?ajax=1" class="btn btn-primary colorbox-large">
            		<i class="glyphicon glyphicon-plus"></i><jdf:message code="common.button.add"/>
            	</a>
            </div>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/admin/language/page" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_name" class="col-sm-3 control-label"><jdf:message code="system.lable.language.locale"/></label>
								<div class="col-sm-6">
									<input type="text" name="search_LIKES_name" class="form-control"/>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_displayName" class="col-sm-3 control-label"><jdf:message code="system.lable.language.name"/></label>
								<div class="col-sm-6">
									<input type="text" name="search_LIKES_displayName" class="form-control"/>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12  col-md-12">
							<div class="pull-right">
								<button type="button" class="btn" onclick="clearForm(this)">
									<span class="glyphicon glyphicon-remove"></span>
									<jdf:message code="common.button.clear" />
								</button>
								<button type="submit" class="btn btn-primary">
									<span class="glyphicon glyphicon-search"></span>
									<jdf:message code="common.button.query" />
								</button>
							</div>
						</div>
					 </div>
				</form>
			</jdf:form>
			<div id="tableDiv">
				<jdf:table items="items" var="currentRowObject" retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit" action="page">
					<jdf:row>
						<jdf:column property="objectId" title="common.lable.id" style="width: 15%" />
						<jdf:column property="name" title="system.lable.language.locale" style="width: 28%" />
						<jdf:column property="displayName" title="system.lable.language.name" style="width: 10%" />
						<jdf:column property="status" title="common.lable.status">
							<jdf:columnValue dictionaryId="103" value="${currentRowObject.status}"/>
						</jdf:column>
						<jdf:column alias="common.lable.operate" sortable="false" viewsAllowed="html" style="width: 15%">
							<a href="${dynamicDomain}/admin/language/edit/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large">
								<i class="icon-pencil icon-white"></i><jdf:message code="common.button.edit"/>
							</a>
							<a href="javascript:toDeleteUrl('${dynamicDomain}/admin/language/delete/${currentRowObject.objectId}')" class="btn btn-danger btn-mini">
								<i class="icon-trash icon-white"></i><jdf:message code="common.button.delete"/>
							</a>
						</jdf:column>
					</jdf:row>
				</jdf:table>
			</div>
		</div>
	</div>
</body>
</html>