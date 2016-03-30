<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>会员管理</title>
</head>
<body>
	 <div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-eject"></span><jdf:message code="system.menu.message_property"/>
			<div class="pull-right">
				 <a href="${dynamicDomain}/admin/messageProperty/editMessageProperty?ajax=1"  class="btn btn-primary colorbox-large">
           			<span class="glyphicon glyphicon-plus"></span><jdf:message code="common.button.add"/>
           		 </a>
			</div>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/admin/messageProperty/page" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_messageKey" class="col-sm-3 control-label"><jdf:message code="system.lable.message_property.key"/>：</label>
								<div class="col-sm-8">
									<input type="text" name="search_LIKES_messageKey" class="form-control"/>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_messageValue" class="col-sm-3 control-label"><jdf:message code="system.lable.message_property.value"/>：</label>
								<div class="col-sm-8">
									<input type="text" name="search_LIKES_messageValue" class="form-control"/>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQL_languageId" class="col-sm-3 control-label"><jdf:message code="system.lable.message_property.language"/>：</label>
								<div class="col-sm-6">
									<select name="search_EQL_languageId">
										<option value=""><jdf:message code="common.lable.pleaseSelect"/></option>
										<jdf:selectCollection items="languages" optionValue="objectId" optionText="displayName"/>
									</select>
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
			<div id="tableDiv" class="row">
				<div class="col-sm-12 col-md-12">
					<jdf:table items="items" var="currentRowObject" retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit" action="page">
						<jdf:row>
							<jdf:column property="messageKey" title="system.lable.message_property.key" style="width: 30%" />
							<jdf:column property="languageId" title="system.lable.message_property.language" style="width: 10%">
								<jdf:columnCollectionValue items="languages" nameProperty="displayName" value="${currentRowObject.languageId}"/>
							</jdf:column>
							<jdf:column property="messageValue" title="system.lable.message_property.value" style="width: 40%" />
							<jdf:column alias="common.lable.operate" sortable="false" viewsAllowed="html" style="width: 20%">
								<a href="${dynamicDomain}/admin/messageProperty/editMessageProperty?messageKey=${currentRowObject.messageKey}&ajax=1" class="btn btn-primary btn-mini colorbox-large">
									<span class="glyphicon glyphicon-edit"></span>
									<jdf:message code="common.button.edit"/>
								</a>
								<a href="javascript:toDeleteUrl('${dynamicDomain}/admin/messageProperty/deleteByKey?messageKey=${currentRowObject.messageKey}')" class="btn btn-danger btn-mini">
									<span class="glyphicon glyphicon-trash"></span>
									<jdf:message code="common.button.delete"/>
								</a>
							</jdf:column>
						</jdf:row>
					</jdf:table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>