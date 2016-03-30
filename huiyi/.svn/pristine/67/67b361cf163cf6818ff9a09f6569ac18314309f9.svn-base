<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="服务申请管理"/></title>
</head>
<body>
	 <div class="panel panel-default">
		<div class="panel-heading">
			<span class="menu-icon glyphicon glyphicon-align-left icon-white"></span><jdf:message code="服务申请管理"/>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/admin/serviceApply/page" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
						<div class= "col-sm-6 col-md-6">
						     <div class="form-group">
						          <label class="col-sm-3 control-label"for="search_EQL_companyId">
						          <jdf:message code ="公司名称" />
						          </label >
						             <div class ="col-sm-8">
						                   <select name= "search_EQL_companyId" class ="js-example-placeholder-single" style=" width: 100%"  id="search_EQL_companyId">
						                    <option value= "">---请选择---</option >
						                         <jdf:selectCollection  items="companys" optionValue="objectId" optionText="nameZh"/>
						                   </select >
						              </div >
						      </div >
						</div >
						<div class= "col-sm-6 col-md-6">
						     <div class="form-group">
						          <label class="col-sm-3 control-label"for="search_EQL_serviceId">
						          <jdf:message code ="服务名称" />
						          </label >
						             <div class ="col-sm-8">
						                   <select name= "search_EQL_serviceId" class ="js-example-placeholder-single" style=" width: 100%"  id="search_EQL_serviceId">
						                    <option value= "">---请选择---</option >
						                         <jdf:selectCollection  items="services" optionValue="objectId" optionText="nameZh"/>
						                   </select >
						             </div >
						      </div >
						</div >
					</div>
					<div class="row">
						<div class= "col-sm-6 col-md-6">
							     <div class="form-group">
							          <label class="col-sm-3 control-label"for="search_EQL_updatedBy">
							          <jdf:message code ="处理人" />
							          </label >
							          	<div class ="col-sm-8">
							                   <select name= "search_EQL_updatedBy" class ="js-example-placeholder-single" style=" width: 100%"  id="search_EQL_updatedBy">
							                    <option value= "">---请选择---</option >
							                         <jdf:selectCollection  items="users" optionValue="objectId" optionText="userName"/>
							                   </select >
							              </div >
							      </div >
							</div >
							<div class="col-sm-6 col-md-6">
								<div class="form-group">
									<label for="search_EQI_status" class="col-sm-3 control-label">状态</label>
									<div class="col-sm-8">
										<select name="search_EQI_status"  class="input-medium" style="width: 100%;" >
											 <option value="">请选择</option>
											 <jdf:select dictionaryId="1302"/>
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
						<jdf:export view="csv" fileName="Role.csv" tooltip="Export CSV" imageName="csv" />
						<jdf:export view="xls" fileName="Role.xls" tooltip="Export EXCEL" imageName="xls" />
						<jdf:row>
							<jdf:column property="serviceId" title="服务名称" style="width: 15%" >
								<jdf:columnCollectionValue items="services" nameProperty="nameZh" value="${currentRowObject.serviceId}"/>
							</jdf:column>
							<jdf:column property="serviceType" title="服务类型" style="width: 8%" >
								<jdf:columnCollectionValue items='services' nameProperty='serviceType' value='${currentRowObject.serviceId}'/>
							</jdf:column>
							<jdf:column property="companyId" title="公司名称" style="width: 15%" >
			                	<jdf:columnCollectionValue items="companys" nameProperty="nameZh" value="${currentRowObject.companyId}"/>
							</jdf:column>
							<%-- <jdf:column property="content" title="申请内容" style="width:10%" /> --%>
							<jdf:column property="status" title="状态" style="width:10%" >
							   <jdf:columnValue dictionaryId="1302" value="${currentRowObject.status}"/>
							</jdf:column>
							<jdf:column property="createdOn" cell="date" title="申请时间" style="width:10%;" />
							<jdf:column property="updatedBy" title="处理人" style="width: 6%" >
								<jdf:columnCollectionValue items="users" nameProperty="userName" value="${currentRowObject.updatedBy}"/>
							</jdf:column>
							<jdf:column property="updatedOn" cell="date" title="处理时间" style="width:15%;" format="yyyy-MM-dd HH:mm:ss"/>
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" style="width: 21%;">
								<a href="${dynamicDomain}/admin/serviceApply/viewApply/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large ">
									<span class="glyphicon glyphicon-fullscreen"></span><jdf:message code="查看"/>
								</a>
								<c:if test="${currentRowObject.status==1}">
	                                <a href="${dynamicDomain}/admin/serviceApply/handel/${currentRowObject.objectId}?ajax=1" class="btn btn-danger btn-mini colorbox-large">
										<span class="glyphicon glyphicon-edit"></span><jdf:message code="处理申请"/>
									</a>
								</c:if>
							</jdf:column>
						</jdf:row>
					</jdf:table>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function show_audit_confirm1(url){
	    var r=confirm("确定要接受申请吗?");
	    if (r==true){
	      window.location.href=url;
	    }else{
	      }
	    }
	</script>	
</body>
</html>