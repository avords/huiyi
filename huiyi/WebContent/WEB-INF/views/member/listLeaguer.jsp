<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>会员级别管理</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span>
			会员级别管理
		</div>
		
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/admin/company/leaguerList" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">${message}</div>
					</div>
					
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_nameZh" class="col-sm-2 control-label">
									企业名称
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="search_LIKES_nameZh" name="search_LIKES_nameZh">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQI_isCheck" class="col-sm-2 control-label">
									企业验厂
								</label>
								<div class="col-sm-8">
									<select name="search_EQI_isCheck" class="form-control">
										<option value=""></option>
										<jdf:select dictionaryId="109" valid="true" />
									</select>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_nameEn" class="col-sm-2 control-label">
									英文名称
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="search_LIKES_nameEn" name="search_LIKES_nameEn">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQI_level" class="col-sm-2 control-label">
									会员级别
								</label>
								<div class="col-sm-8">
									<select name="search_EQI_level" class="form-control">
										<option value=""></option>
										<jdf:select dictionaryId="1402" valid="true" />
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
			
			<!-- 这里是数据表格 -->
			<div id="tableDiv" class="row">
				<div class="col-sm-12 col-md-12">
					<jdf:table items="items" var="currentRowObject" retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit" action="leaguerList">
						<jdf:export view="csv" fileName="leaguer.csv" tooltip="Export CSV" imageName="csv" />
						<jdf:export view="xls" fileName="leaguer.xls" tooltip="Export EXCEL" imageName="xls" />
						<jdf:row>
							<jdf:column property="nameZh" title="企业名称" style="width:20%" />
							<jdf:column property="nameEn" title="英文名称" style="width:20%" />

							<jdf:column property="level" title="会员级别" style="width:15%">
								<jdf:columnValue dictionaryId="1402" value="${currentRowObject.level}" />
							</jdf:column>
							<jdf:column property="isCheck" title="是否验厂" style="width:10%">
								<jdf:columnValue dictionaryId="109" value="${currentRowObject.isCheck}" />
							</jdf:column>
							<jdf:column property="isAllow" title="是否许可" style="width:10%">
								<jdf:columnValue dictionaryId="109" value="${currentRowObject.isAllow}" />
							</jdf:column>
							
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" style="">
								<a href="${dynamicDomain}/admin/company/leaguerEdit/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large"> 
									<span class="glyphicon glyphicon-edit"></span> 
									<jdf:message code="common.button.edit" />
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