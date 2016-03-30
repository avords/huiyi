<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>企业管理中心</title>
</head>
<body>
	 <div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-list"></span>企业管理中心
			<div class="pull-right">
				 <a href="${dynamicDomain}/admin/company/importCompanyPage" class="btn btn-primary">
           			<span class="glyphicon glyphicon-folder-open"></span> 导入企业
           		 </a>
				 <a href="${dynamicDomain}/admin/company/create" class="btn btn-primary">
           			<span class="glyphicon glyphicon-plus"></span><jdf:message code="common.button.add"/>
           		 </a>
			</div>
		</div>
		
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/admin/company/page" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQI_isSupplier" class="col-sm-3 control-label">是否供应商</label>
								<div class="col-sm-6">
									<select name="search_EQI_isSupplier"  class="input-medium" style="width: 240px;" >
										 <option value="">请选择</option>
										 <jdf:select dictionaryId="109"/>
									</select>
								</div>
							</div>
						 </div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_nameZh" class="col-sm-3 control-label">企业名称</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="search_LIKES_nameZh" name="search_LIKES_nameZh" style="width: 240px;">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQL_countryId" class="col-sm-3 control-label">所在国家</label>
								<div class="col-sm-6">
									 <select  name="search_EQL_countryId"  id="search_EQL_countryId" style="width: 240px;">
                                            <option value="">全部</option>
                                            <jdf:selectCollection items="countries" optionValue="objectId" optionText="nameZh" />
                                    </select>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQI_numEmployees" class="col-sm-3 control-label">企业规模</label>
								<div class="col-sm-6">
									<select name="search_EQI_numEmployees"  class="input-medium" style="width: 240px;" >
										 <option value="">请选择</option>
										 <jdf:select dictionaryId="1011"/>
									 </select>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_telphone" class="col-sm-3 control-label">联系手机</label>
								<div class="col-sm-6">
									<input type="tel" class="form-control" id="search_LIKES_telphone" name="search_LIKES_telphone" style="width: 240px;">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_email" class="col-sm-3 control-label">联系邮箱</label>
								<div class="col-sm-6">
									<input type="email" class="form-control" id="search_LIKES_email" name="search_LIKES_email" style="width: 240px;">
								</div>
							</div>
						</div>
					</div>	
					<div class="row">
						<div class="col-sm-6 col-md-6">
								<div class="form-group">
									<label for="search_EQI_status" class="col-sm-3 control-label">企业状态</label>
									<div class="col-sm-6">
										<select name="search_EQI_status"  class="input-medium" style="width: 240px;" >
											 <option value="">请选择</option>
											 <jdf:select dictionaryId="1012"/>
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
							<jdf:column property="registerWay" title="企业注册方式" style="width:10%;">
								<jdf:columnValue dictionaryId="1014" value="${currentRowObject.registerWay}" />
							</jdf:column>
							<jdf:column property="nameZh" title="企业名称" style="width:15%;" />
							<jdf:column property="numEmployees" title="企业规模" style="width:15%;">
								<jdf:columnValue dictionaryId="1011" value="${currentRowObject.numEmployees}" />
							</jdf:column>
							<jdf:column property="email" title="邮箱" style="width:15%;" />
							<jdf:column property="telphone" title="手机" style="width:15%;" />
							<jdf:column property="status" title="状态" style="width:10%;">
								<jdf:columnValue dictionaryId="1012" value="${currentRowObject.status}" />
							</jdf:column>
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" style="width:20%;">
								<a href="${dynamicDomain}/admin/company/edit/${currentRowObject.objectId}" class="btn btn-primary btn-mini">
									<span class="glyphicon glyphicon-edit"></span>
									<jdf:message code="common.button.edit"/>
								</a>
								<a href="javascript:toDeleteUrl('${dynamicDomain}/admin/company/delete/${currentRowObject.objectId}')" class="btn btn-danger btn-mini">
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