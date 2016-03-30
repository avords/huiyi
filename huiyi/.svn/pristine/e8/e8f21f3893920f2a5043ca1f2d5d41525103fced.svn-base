<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="服务管理"/></title>
</head>
<body>
	 <div class="panel panel-default">
		<div class="panel-heading">
			<span class="menu-icon glyphicon glyphicon-align-left icon-white"></span><jdf:message code="服务管理"/>
			<div class="pull-right">
				 <a href="${dynamicDomain}/admin/service/create"  class="btn btn-primary">
           			<span class="glyphicon glyphicon-plus"></span><jdf:message code="common.button.add"/>
           		 </a>
			</div>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/admin/service/page" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_nameZh" class="col-sm-3 control-label">服务名称</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="search_LIKES_nameZh" name="search_LIKES_nameZh" id="search_LIKES_nameZh">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_nameEn" class="col-sm-3 control-label">英文名称</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="search_LIKES_nameEn" name="search_LIKES_nameEn"  id="search_LIKES_nameEn">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQI_type" class="col-sm-3 control-label">服务种类</label>
								<div class="col-sm-8">
									<select name="search_EQI_type"  class="input-medium" id="search_EQI_type">
										 <option value="">请选择</option>
										 <jdf:select dictionaryId="1304"/>
									 </select>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQI_status" class="col-sm-3 control-label">状态</label>
								<div class="col-sm-8">
									<select name="search_EQI_status"  class="input-medium" style=" width: 100%" id="search_EQI_status">
										 <option value="">请选择</option>
										 <jdf:select dictionaryId="1301"/>
									 </select>
								</div>
							</div>
						</div>
					</div >
					<div class="row">
						<div class="col-sm-12  col-md-12">
							<div class="pull-right">
								<button type="button" class="btn" onclick="clearFunction()">
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
						<jdf:export view="csv" fileName="Role.csv" tooltip="Export CSV" imageName="csv" />
						<jdf:export view="xls" fileName="Role.xls" tooltip="Export EXCEL" imageName="xls" />
						<jdf:row>
							<jdf:column property="nameZh" title="服务名称" style="width:15%;" >
								<a href="${dynamicDomain}/admin/service/viewService/${currentRowObject.objectId}?ajax=1" title="点击查看详情" class="btn-mini colorbox-large ">
								 <c:choose>  
							         <c:when test="${fn:length(currentRowObject.nameZh) > 10}">  
							             <c:out value="${fn:substring(currentRowObject.nameZh, 0, 12)}..." />  
							         </c:when>  
							         <c:otherwise>  
							           <c:out value="${currentRowObject.nameZh}" />  
							         </c:otherwise>  
							      </c:choose>
								</a>
							</jdf:column>
							<jdf:column property="nameEn" title="英文名称" style="width: 20%" >
								<c:choose>  
							         <c:when test="${fn:length(currentRowObject.nameEn) > 23}">  
							             <c:out value="${fn:substring(currentRowObject.nameEn, 0, 25)}..." />  
							         </c:when>  
							         <c:otherwise>  
							           <c:out value="${currentRowObject.nameEn}" />  
							         </c:otherwise>  
							      </c:choose>
							</jdf:column>
							<jdf:column property="priority" title="优先级" style="width:10%;" />
							<jdf:column property="type" title="服务种类" headerStyle="width:10%;">
								<jdf:columnValue dictionaryId="1304" value="${currentRowObject.type}"/>
							</jdf:column>
							<jdf:column property="businessType" title="业务类型" headerStyle="width:10%;">
								<jdf:columnValue dictionaryId="1112" value="${currentRowObject.businessType}"/>
							</jdf:column>
							<jdf:column property="beginDate" cell="date" title="有效期起" headerStyle=" width:10%;" />
							<jdf:column property="endDate" cell="date" title="有效期至" headerStyle=" width:10%;" />
							<jdf:column property="status" title="状态" headerStyle="width:10%;">
								<jdf:columnValue dictionaryId="1301" value="${currentRowObject.status}"/>
							</jdf:column>
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" style="width: 10%;">
								<div class="btn-group">
								  <button type="button" style="width: 100px" class="btn btn-warning dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								    操作选项<span class="glyphicon glyphicon-chevron-down"></span>
								  </button>
								  <ul class="dropdown-menu">
								    <li><a href="${dynamicDomain}/admin/service/viewService/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large ">
									<span class="glyphicon glyphicon-fullscreen"></span><jdf:message code="查看"/>
								    </a></li>
									
									<li><a href="${dynamicDomain}/admin/service/edit/${currentRowObject.objectId}" class="btn btn-primary btn-mini ">
									<span class="glyphicon glyphicon-edit"></span>
									<jdf:message code="common.button.edit"/>
									</a></li>
									
								    <li><c:if test="${currentRowObject.status==1}">
									<a href="${dynamicDomain}/admin/service/submitForCheck/${currentRowObject.objectId}" class="btn btn-primary btn-mini ">
										<span class="glyphicon glyphicon-edit"></span>
										<jdf:message code="提交审核"/>
									</a></c:if></li>
									
								    <li><c:if test="${currentRowObject.status==4 or currentRowObject.status==6}">
									<a href="${dynamicDomain}/admin/service/submitForCheck/${currentRowObject.objectId}" class="btn btn-primary btn-mini ">
										<span class="glyphicon glyphicon-edit"></span>
										<jdf:message code="重新提交"/>
									</a></c:if></li>
									
								    <li><c:if test="${currentRowObject.status==3}">
		                            <a href="${dynamicDomain}/admin/service/submitForPublish/${currentRowObject.objectId}" class="btn btn-primary btn-mini ">
										<span class="glyphicon glyphicon-edit"></span>
										<jdf:message code="发布"/>
									</a></c:if></li>
								  </ul>
								</div>
							</jdf:column>
						</jdf:row>
					</jdf:table>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$(function(){
		$(".js-example-placeholder-single").select2();
	});
	function clearFunction(){
		$('#search_LIKES_nameZh').val("");
		$("#search_LIKES_nameEn").val("");
		$("#search_EQL_serviceCategoryId").select2("val", ""); 
		$("#search_EQI_status").val("");
	}
	
	$(document).ready(function() {
		$("#search_LIKES_nameZh").rules("add",{
			maxlength:30,
			messages:{
	    		maxlength:'名称最大 为30个字',
	        }
		});
		
		$("#search_LIKES_nameEn").rules("add",{
			maxlength:60,
			messages:{
	    		maxlength:'名称最大 为60个字符串',
	        }
		});
	})	
	</script>	
</body>
</html>