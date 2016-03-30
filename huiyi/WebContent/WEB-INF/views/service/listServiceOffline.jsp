<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="服务下线中心"/></title>
</head>
<body>
	 <div class="panel panel-default">
		<div class="panel-heading">
			<span class="menu-icon glyphicon glyphicon-align-left icon-white"></span><jdf:message code="服务下线中心"/>
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
								<label for="search_LIKES_nameZh" class="col-sm-3 control-label">
									<jdf:message code="服务名称"/>
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="search_LIKES_nameZh" name="search_LIKES_nameZh" id="search_LIKES_nameZh">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_nameEn" class="col-sm-3 control-label">
									<jdf:message code="英文名称"/>
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="search_LIKES_nameEn" name="search_LIKES_nameEn"  id="search_LIKES_nameEn">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
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
							<jdf:column property="nameZh" title="服务名称" style="width:10%;" >
								<a href="${dynamicDomain}/admin/service/viewService/${currentRowObject.objectId}?ajax=1" title="点击查看详情" class="btn-mini colorbox-large ">
										${currentRowObject.nameZh}
								</a>
							</jdf:column>
							<jdf:column property="nameEn" title="英文名称" style="width: 10%" />
							<jdf:column property="beginDate" cell="date" title="有效期起" headerStyle=" width:10%;" />
							<jdf:column property="endDate" cell="date" title="有效期至" headerStyle=" width:10%;" />
							<jdf:column property="status" title="状态" headerStyle="width:10%;">
								<jdf:columnValue dictionaryId="1301" value="${currentRowObject.status}"/>
							</jdf:column>
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" style="width: 40%;">
								<a href="${dynamicDomain}/admin/service/viewService/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large ">
									<span class="glyphicon glyphicon-fullscreen"></span><jdf:message code="查看"/>
								</a>
								<a href="javascript:;" class="btn btn-danger btn-mini" onclick="confirm6('${dynamicDomain}/admin/service/handelStatus/${currentRowObject.objectId}?status=6');">
	                            	<span class="glyphicon glyphicon-check"></span><jdf:message code="下线"/>
	                            </a>
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
	
	function confirm6(url){
	    var r=confirm("确定要下线吗?");
	    if (r==true){
	      window.location.href=url;
	    }else{
	      }
	    }
	</script>	
</body>
</html>