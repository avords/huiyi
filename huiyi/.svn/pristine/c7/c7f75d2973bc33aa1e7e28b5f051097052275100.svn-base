<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<jdf:themeFile file="ajaxfileupload.js" />
<title>
		<c:if test="${2==status}">
			企业审核管理
		</c:if>
		<c:if test="${3==status}">
			企业合同管理
		</c:if>
</title>
<style type="text/css">
	.Wdate{
	width:265px;
	}
	.buyer{
	font-family: 'Arial Negreta','Arial';
	font-weight: 700;
	font-style: normal;
	font-size: 16px;
	margin-bottom:10px;
	color: #333;
	text-align: left;
	line-height: normal;
	}
</style>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-check"></span>
				<c:if test="${2==status}">
					企业审核管理
				</c:if>
				<c:if test="${3==status}">
					企业合同管理
				</c:if>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}${searchPath}" method="post" class="form-horizontal">
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
								<label for="search_LIKES_phone" class="col-sm-3 control-label">联系手机</label>
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
						 	<jdf:column property="registerWay" title="注册方式" style="width:10%;">
								<jdf:columnValue dictionaryId="1014" value="${currentRowObject.registerWay}" />
							</jdf:column>
						 	<jdf:column property="nameZh" title="企业名称" style="width:15%;" />
							<jdf:column property="numEmployees" title="企业规模" style="width:15%;">
							<jdf:columnValue dictionaryId="1011" value="${currentRowObject.numEmployees}" />
							</jdf:column>
							<jdf:column property="email" title="邮箱" style="width:10%;" />
							<jdf:column property="telphone" title="手机" style="width:10%;" /> 
							<jdf:column property="status" title="状态" style="width:10%;">
								<jdf:columnValue dictionaryId="1012" value="${currentRowObject.status}" />
							</jdf:column>
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" style="width:30%;">
								<c:if test="${currentRowObject.status==2}">
	                                    <a href="javascript:;" class="btn btn-primary btn-mini" onclick="show_audit_confirm('${dynamicDomain}/admin/company/audit/${currentRowObject.objectId}?status=3');">
	                                        <span class="glyphicon glyphicon-ok-sign"></span><jdf:message code="审核通过"/>
			                            </a>
										<a href="javascript:;" class="btn btn-primary btn-mini" onclick="show_audit_confirm2('${dynamicDomain}/admin/company/audit/${currentRowObject.objectId}?status=4');">
			                                <span class="glyphicon glyphicon-remove-sign"></span><jdf:message code="不通过"/>
			                            </a>
	                            </c:if>
								
								<c:if test="${currentRowObject.status==3}">
                                     <a href="javascript:;" class="btn btn-primary btn-mini" onclick="show_audit_confirm3('${dynamicDomain}/admin/company/audit/${currentRowObject.objectId}?status=6');">
                                        <span class="glyphicon glyphicon-off"></span><jdf:message code="终止合同"/>
                            		</a>
	                            </c:if>
	                           
								<a href="${dynamicDomain}/admin/company/view/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large">
									<span class="glyphicon glyphicon-fullscreen"></span><jdf:message code="查看"/>
								</a>
							</jdf:column>
						</jdf:row> 
					</jdf:table>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
    function show_audit_confirm(url){
        var r=confirm("确定要审核通过吗?");
        if (r==true){
          window.location.href=url;
        }else{
          }
        }
    function show_audit_confirm2(url){
        var r=confirm("确定要不通过审核吗?");
        if (r==true){
          window.location.href=url;
        }else{
          }
        }
    function show_audit_confirm3(url){
        var r=confirm("确定要终止合同吗?");
        if (r==true){
          window.location.href=url;
        }else{
          }
        }
</script>
</body>