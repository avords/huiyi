<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="system.menu.dictionary"/></title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span><jdf:message code="system.menu.dictionary"/>
			<div class="pull-right">
				 <a  href="${dynamicDomain}/admin/dict/dictTree?ajax=1" class="btn btn-primary colorbox-large">
           			<span class="glyphicon glyphicon-plus"></span>
           			<jdf:message code="system.lable.dict.tree"/>
           		 </a>
			</div>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/admin/dict/page" method="post" class="form-horizontal">
					 <!-- start:提示信息 -->
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					 <!-- end:提示信息 -->
					 <!-- start:查询条件 -->
					 <div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQI_dictionaryId" class="col-sm-2 control-label">
									<jdf:message code="system.lable.dict.dictionary_id"/>
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="search_EQI_dictionaryId" name="search_EQI_dictionaryId">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_name" class="col-sm-2 control-label">
									<jdf:message code="system.lable.dict.name"/>
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id=search_LIKES_name name="search_LIKES_name">
								</div>
							</div>
						</div>
					 </div>
					 
					 <div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQI_value" class="col-sm-2 control-label">
									<jdf:message code="system.lable.dict.value"/>
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="search_EQI_value" name="search_EQI_value">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQB_status" class="col-sm-2 control-label">
									<jdf:message code="common.lable.status"/>
								</label>
								<div class="col-sm-8">
									<select name="search_EQB_status"  class="form-control">
										<option value=""></option>
										<jdf:select dictionaryId="111"/>
									</select>
								</div>
							</div>
						</div>
					 </div>
					 <!-- start:查询按钮 -->
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
				 	<!-- end:查询按钮 --> 
				</form>
			</jdf:form>
			<div id="tableDiv" class="row">
				<div class="col-sm-12 col-md-12">
					<jdf:table items="items" var="currentRowObject" retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit" action="page">
						<jdf:export view="csv" fileName="dict.csv" tooltip="Export CSV" imageName="csv" />
						<jdf:export view="xls" fileName="dict.xls" tooltip="Export EXCEL" imageName="xls" />
						<jdf:row>
							<jdf:column property="dictionaryId" title="system.lable.dict.dictionary_id" style="width: 10%" />
							<jdf:column property="name" title="system.lable.dict.name" style="width: 30%" />
							<jdf:column property="value" title="system.lable.dict.value" style="width: 10%" />
							<jdf:column property="parentId" title="system.lable.dict.parent_id" style="width: 10%" />
							<jdf:column property="status" title="common.lable.status" style="width: 10%">
							   <jdf:columnValue dictionaryId="111" value="${currentRowObject.status}"/>
							</jdf:column>
							<jdf:column property="sortId" title="system.lable.dict.order" style="width: 10%" />
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" style="width: 10%">
								<a href="${dynamicDomain}/admin/dict/edit/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large">
									<span class="glyphicon glyphicon-edit"></span>
									修改
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