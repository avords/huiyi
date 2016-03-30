<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>推荐管理中心</title>
</head>
<body>
	 <div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-list"></span>推荐管理中心
			<div class="pull-right">
				 <a href="${dynamicDomain}/admin/recommend/create?ajax=1" class="btn btn-primary colorbox-large">
           			<span class="glyphicon glyphicon-plus"></span><jdf:message code="common.button.add"/>
           		 </a>
			</div>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/admin/recommend/page" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
						 <!-- <div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_name" class="col-sm-3 control-label">名称</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="search_LIKES_name" name="search_LIKES_name" style="width: 240px;">
								</div>
							</div>
						</div>  -->
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQI_type" class="col-sm-3 control-label">类型</label>
								<div class="col-sm-6">
									<select name="search_EQI_type"  class="input-medium" style="width: 240px;" >
										 <option value="">请选择</option>
										 <jdf:select dictionaryId="1114"/>
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
					<jdf:table items="items" retrieveRowsCallback="limit" var="currentRowObject" filterRowsCallback="limit" sortRowsCallback="limit" action="page">
						<jdf:export view="csv" fileName="Company.csv" tooltip="Export CSV" imageName="csv" />
						<jdf:export view="xls" fileName="Company.xls" tooltip="Export EXCEL" imageName="xls" />
						<jdf:row>
							<jdf:column property="type" title="类型" style="width:10%;">
								<jdf:columnValue dictionaryId="1114" value="${currentRowObject.type}" />
							</jdf:column>
							<jdf:column property="name" title="名称" style="width:10%;" sortable="false"/>
							<jdf:column property="priority" title="顺序" style="width:10%;" />
							 <jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" style="width:20%;">
								<%-- <a href="${dynamicDomain}/recommend/editRecommend/${currentRowObject.itemId}?ajax=1" class="btn btn-primary btn-mini colorbox-large">
									<span class="glyphicon glyphicon-edit"></span>
									<jdf:message code="common.button.edit"/>
								</a>  --%>
								<a href="javascript:toDeleteUrl('${dynamicDomain}/admin/recommend/delete/${currentRowObject.itemId}')" class="btn btn-danger btn-mini">
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