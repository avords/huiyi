<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>文章编辑</title>
</head>
<body>
<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-list"></span>文章编辑
			<div class="pull-right">
				 <a href="${dynamicDomain}/admin/content/create" class="btn btn-primary ">
           			<span class="glyphicon glyphicon-plus"></span><jdf:message code="common.button.add"/>
           		 </a>
			</div>
		</div>
		
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="<%=dynamicDomain%>/admin/content/page" id="selectForm" method="post" class="form-horizontal">
				<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="search_LIKES_nameZh">
								<jdf:message code="中文标题" />
								</label>
								<div class="col-sm-6">
									<input type="text" name="search_LIKES_nameZh" class="form-control" />
								</div>
							</div>
						</div>
						
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="search_LIKES_status">
								<jdf:message code="状态" />
								</label>
								<div class="col-sm-6">
								    <select class="form-control" name="search_EQI_status" id="search_EQI_status">
										<option></option>
										<jdf:select dictionaryId="1201" />
									</select>
								</div>
							</div>
						</div>
					</div>
					
					<div class="span12 pull-right text-right">
						<button type="button" class="btn" onclick="clearForm2(this)">
							<i class="icon-search icon-white"></i>清理
						</button>
						<button type="submit" class="btn btn-primary">
							<i class="icon-search icon-white"></i>
							<jdf:message code="common.button.query" />
						</button>
					</div>
					
				</form>
			</jdf:form>
			
			<div id="tableDiv">
				<jdf:table items="items" retrieveRowsCallback="limit" var="currentRowObject" filterRowsCallback="limit" sortRowsCallback="limit" action="page">
					<jdf:export view="csv" fileName="student.csv" tooltip="Export CSV" imageName="csv" />
					<jdf:export view="xls" fileName="student.xls" tooltip="Export EXCEL" imageName="xls" />
					<jdf:row>
						<jdf:column property="nameZh" title="中文标题" headerStyle="width:10%;" />
						<jdf:column property="nameEn" title="英文标题" headerStyle="width:10%;" />
						<jdf:column property="status" title="状态" headerStyle="width:5%;" >
						<jdf:dictionaryName value="${currentRowObject.status}" dictionaryId="1201"/>
						</jdf:column>
						<jdf:column alias="操作" title="操作" sortable="false" viewsAllowed="html" style="width: 20%">
							<a href="<%=dynamicDomain%>/admin/content/view/${currentRowObject.objectId}"class="btn btn-primary btn-mini">
								<i class="icon-pencil icon-white"></i>查看
							</a>
							
							<a href="<%=dynamicDomain%>/admin/content/delete/${currentRowObject.objectId}" class="btn btn-danger btn-mini">
								<span class="glyphicon glyphicon-trash"></span>
								<jdf:message code="common.button.delete" />
							</a>
						</jdf:column>
					</jdf:row>
				</jdf:table>
			</div>
        </div>
</div>
</body>
</html>