<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="system.menu.menu"/></title>
</head>
<body>
	 <div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span><jdf:message code="system.menu.menu"/>
			<div class="pull-right">
				 <a  href="${dynamicDomain}/admin/menu/create?ajax=1"  class="btn btn-primary colorbox-large">
           			<span class="glyphicon glyphicon-plus"></span><jdf:message code="common.button.add"/>
           		 </a>
			</div>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/admin/menu/page" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQI_type" class="col-sm-2 control-label">
									<jdf:message code="system.lable.menu.type"/>
								</label>
								<div class="col-sm-8">
									<select name="search_EQI_type" class="form-control">
										<option value=""></option>
										<jdf:select dictionaryId="106" valid="true" />
									</select>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_name" class="col-sm-2 control-label">
									<jdf:message code="system.lable.menu.name"/>
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="search_LIKES_name" name="search_LIKES_name">
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
						<jdf:export view="csv" fileName="menu.csv" tooltip="Export CSV" imageName="csv" />
						<jdf:export view="xls" fileName="menu.xls" tooltip="Export EXCEL" imageName="xls" />
						<jdf:row>
							<jdf:column property="objectId" title="common.lable.id" style="width: 5%" />
							<jdf:column property="name" title="system.lable.menu.name" style="width:15%" />
							<jdf:column property="path" title="system.lable.menu.path" style="width:35%" />
							<jdf:column property="type" title="system.lable.menu.type" style="width:5%">
								<jdf:columnValue dictionaryId="106" value="${currentRowObject.type}"/>
							</jdf:column>
							<jdf:column property="status" title="common.lable.status" style="width:5%">
								<jdf:columnValue dictionaryId="103" value="${currentRowObject.status}"/>
							</jdf:column>
							<jdf:column property="displayPosition" title="system.lable.menu.location" style="width:10%">
								<jdf:columnValue dictionaryId="124" value="${currentRowObject.displayPosition}"/>
							</jdf:column>
							<jdf:column property="orderId" title="system.lable.menu.order" style="width:5%" />
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" style="width: 20%">
								<a href="${dynamicDomain}/admin/menu/edit/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large">
									<span class="glyphicon glyphicon-edit"></span>
									<jdf:message code="common.button.edit"/>
								</a>
								<a href="javascript:toDeleteUrl('${dynamicDomain}/admin/menu/delete/${currentRowObject.objectId}')" class="btn btn-danger btn-mini">
									<span class="glyphicon glyphicon-trash"></span>
									<jdf:message code="common.button.delete"/>
								</a>
								<c:if test="${currentRowObject.type==2}">
								<a href="${dynamicDomain}/admin/menuLink/addMenuLink/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large">
									<i class="icon-link icon-white"></i>
									<jdf:message code="system.lable.menu.link"/>
								</a>
								</c:if>
							</jdf:column>
						</jdf:row>
					</jdf:table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>