<%@page import="com.mvc.cms.model.Channel"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>栏目管理</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="menu-icon glyphicon glyphicon-align-left icon-white"></span>栏目管理
			<div class="actions-bar pull-right ">
				<a href="<%=dynamicDomain%>/admin/channel/create" class="btn btn-primary">
				        <span class="glyphicon glyphicon-plus"></span>
				        <jdf:message code="common.button.add" />
				</a>
			</div>
		</div>
		
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="<%=dynamicDomain%>/admin/channel/page" id="selectForm" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="search_LIKES_nameZh">
								<jdf:message code="栏目名称" />
								</label>
								<div class="col-sm-6">
									<input type="text" name="search_LIKES_nameZh" class="form-control"/>
								</div>
							</div>
						</div>
						
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="search_LIKES_positionCode">
								<jdf:message code="栏目编码" />
								</label>
								<div class="col-sm-6">
									<input type="text" name="search_LIKES_positionCode" class="form-control" />
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="search_EQL_parentId">
								<jdf:message code="父栏目" />
								</label>
								<div class="col-sm-6">
									<select id="search_EQL_parentId" name="search_EQL_parentId" class="js-example-placeholder-single" style="width: 100%" >
										<option value="">全部</option>
										<jdf:selectCollection items="channels" optionValue="objectId" optionText="fullName" />
									</select>
								</div>
							</div>
						</div>
						
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="search_LIKES_description">
								<jdf:message code="状态" />
								</label>
								<div class="col-sm-6">
									<select id="search_EQI_status" name="search_EQI_status" style="width: 100%" >
										<option value="">全部</option>
										<jdf:select dictionaryId="111"/>
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
						<jdf:column property="nameZh" title="栏目名称中文" headerStyle="width:10%;" />
						<jdf:column property="nameEn" title="栏目名称英文" headerStyle="width:10%;" />
						<jdf:column property="positionCode" title="栏目编码" headerStyle="width:10%;" />
						<jdf:column property="priority" title="顺序" headerStyle="width:5%;" />
						<jdf:column property="status" title="状态" headerStyle="width:5%;">
							<jdf:dictionaryName value="${currentRowObject.status }" dictionaryId="111" />
						</jdf:column>
						<jdf:column property="level" title="级别" headerStyle="width:10%;" />
						<jdf:column alias="操作" title="操作" sortable="false" viewsAllowed="html" style="width: 20%">
							<a href="<%=dynamicDomain%>/admin/channel/edit/${currentRowObject.objectId}"class="btn btn-primary btn-mini">
								<i class="icon-pencil icon-white"></i>修改
							</a>
							
							<a href="javascript:void(0)" onclick="enableToDelete(${currentRowObject.objectId})" class="btn btn-danger btn-mini">
								<span class="glyphicon glyphicon-trash"></span>
								<jdf:message code="common.button.delete" />
							</a>
						</jdf:column>
					</jdf:row>
				</jdf:table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$(function(){
		$(".js-example-placeholder-single").select2();
	});
	
	//清楚搜索表单内容
	function clearForm2(ele){
		$(ele).closest("form").find(':input').each(function() {
	        switch(this.type) {
	            case 'password':
	            case 'select-multiple':
	            case 'select-one':
	            case 'text':
	            case 'textarea':
	                $(this).val('');
	                break;
	            case 'checkbox':
	            case 'radio':
	                this.checked = false;
	        }
	    });
		$("#search_EQL_parentId").select2("val", ""); 
	};
	
	//通过是否有子栏目,判断是否可以删除
	function enableToDelete(id){
		$.ajax({
            url:"${dynamicDomain}/admin/channel/jsonDelete/"+id,
            type : 'get',
            dataType: "json", 
            success : function(tf) {
            	if(tf.result){
            		alert(tf.message);
            		location.reload();
            	}else{
            		alert(tf.message);
            	}
            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
                alert(e);
            }
        });
	}
	</script>
</body>
</html>