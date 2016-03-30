<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>广告管理中心</title>
</head>
<body>
	 <div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-list"></span><jdf:message code="广告管理中心"/>
			<div class="pull-right">
				 <a  href="${dynamicDomain}/admin/advert/create"  class="btn btn-primary">
           			<span class="glyphicon glyphicon-plus"></span><jdf:message code="common.button.add"/>
           		 </a>
			</div>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/admin/advert/page" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQS_positionCode" class="col-sm-2 control-label">
									<jdf:message code="广告位置"/>
								</label>
								<div class="col-sm-6">
									 <select  name="search_EQS_positionCode"  id="search_EQS_positionCode" style="width: 240px;">
                                            <option value="">全部</option>
                                            <jdf:selectCollection items="positions" optionValue="positionCode" optionText="positionName" />
                                    </select>
								</div>
							 </div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_advertName" class="col-sm-2 control-label">
									<jdf:message code="广告名称"/>
								</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" style="width: 240px;" id="search_LIKES_advertName" name="search_LIKES_advertName" onkeyup="replaceSpace(this)" onkeydown="replaceSpace(this)">
								</div>
							 </div>
						</div>
					</div>	
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQI_advertStatus" class="col-sm-2 control-label">
									<jdf:message code="广告状态"/>
								</label>
								<div class="col-sm-6">
									 <select name="search_EQI_advertStatus"  id="search_EQI_advertStatus"  class="input-medium" style="width: 240px;">
										 <option value="">全部</option>
										 <jdf:select dictionaryId="1002"/>
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
					<jdf:table items="items" var="currentRowObject" retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit" action="page">
						<jdf:export view="csv" fileName="advert.csv" tooltip="Export CSV" imageName="csv" />
						<jdf:export view="xls" fileName="advert.xls" tooltip="Export EXCEL" imageName="xls" />
						<jdf:row>
							<jdf:column property="advertName" title="广告名称" style="width: 10%" />
							<jdf:column property="positionCode" title="广告位置" style="width: 10%" >
								<jdf:columnCollectionValue items="positions" nameProperty="positionName" valueProperty="positionCode" value="${currentRowObject.positionCode}"/>
							</jdf:column>
			                <jdf:column property="url" title="跳转网址" style="width: 20%" />
			                <jdf:column property="uploadDate" title="上传时间" style="width:10%" cell="date"/>
			                <jdf:column property="dispalyOrder" title="显示顺序" style="width:10%" />
			                <jdf:column property="advertStatus" title="广告状态" style="width:10%" >
							   <jdf:columnValue dictionaryId="1002" value="${currentRowObject.advertStatus}"/>
							</jdf:column>
							<jdf:column alias="修改" title="修改" sortable="false" viewsAllowed="html" style="width:15%">
								<a href="${dynamicDomain}/admin/advert/edit/${currentRowObject.objectId}" class="btn btn-primary btn-mini">
									<span class="glyphicon glyphicon-edit"></span><jdf:message code="广告修改"/>
								</a>
							</jdf:column>
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" style="width:15%">
								<a href="javascript:toDeleteUrl('${dynamicDomain}/admin/advert/delete/${currentRowObject.objectId}')" class="btn btn-danger btn-mini">
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
<script type="text/javascript">
 function replaceSpace(obj){
   obj.value = obj.value.replace("%","")
 }
 function show_audit_confirm(url){
	    var r=confirm("确定要提交吗?");
	    if (r==true){
	      window.location.href=url;
	    }else{
	      }
	    }
</script>	
	
</body>
</html>