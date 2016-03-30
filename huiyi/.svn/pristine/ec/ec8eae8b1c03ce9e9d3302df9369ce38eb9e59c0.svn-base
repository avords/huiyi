<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>热门搜索</title>
</head>
<body>
	 <div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-list"></span>热门搜索
			<div class="pull-right">
				 <a href="${dynamicDomain}/admin/searchWords/create?ajax=1" class="btn btn-primary colorbox-large">
           			<span class="glyphicon glyphicon-plus"></span><jdf:message code="common.button.add"/>
           		 </a>
			</div>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/admin/searchWords/page" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
						  <div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_nameZh" class="col-sm-3 control-label">热门词中文名称</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="search_LIKES_nameZh" name="search_LIKES_nameZh">
								</div>
							</div>
						  </div>
						  <div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_nameEn" class="col-sm-3 control-label">热门词英文名称</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="search_LIKES_nameEn" name="search_LIKES_nameEn">
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
							<jdf:column property="nameZh" title="中文名称" style="width:10%;" />
							<jdf:column property="nameEn" title="英文名称" style="width:10%;" />
							<jdf:column property="sortNo" title="顺序" style="width:10%;" />
							 <jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" style="width:20%;">
								 <a href="${dynamicDomain}/admin/searchWords/edit/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large">
									<span class="glyphicon glyphicon-edit"></span>
									<jdf:message code="common.button.edit"/>
								</a>  
								<a href="javascript:toDeleteUrl('${dynamicDomain}/admin/searchWords/delete/${currentRowObject.objectId}')" class="btn btn-danger btn-mini">
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