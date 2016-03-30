<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>广告发布中心</title>
</head>
<body>
	 <div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span><jdf:message code="广告发布中心"/>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/advert/display/list" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQI_belongColumn" class="col-sm-2 control-label">
									<jdf:message code="所属栏目"/>
								</label>
								<div class="col-sm-8">
									 <select name="search_EQI_belongColumn"  class="input-medium">
										 <option value=""></option>
										 <jdf:select dictionaryId="1001"/>
									 </select>
								</div>
							 </div>
						</div>	
					
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_advertName" class="col-sm-2 control-label">
									<jdf:message code="广告名称"/>
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" style="width: 150px;" id="search_LIKES_advertName" name="search_LIKES_advertName">
								</div>
							</div>
					</div>
						
					</div>	
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQI_type" class="col-sm-2 control-label">
									<jdf:message code="内容类型"/>
								</label>
								<div class="col-sm-8">
									 <select name="search_EQI_type"  class="input-medium">
										 <option value=""></option>
										 <jdf:select dictionaryId="1003"/>
									 </select>
								</div>
							 </div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQI_advertStatus" class="col-sm-2 control-label">
									<jdf:message code="广告状态"/>
								</label>
								<div class="col-sm-8">
									 <select name="search_EQI_advertStatus"  class="input-medium">
										 
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
									<jdf:message code="查询已审核的广告" />
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
							<jdf:column property="belongColumn" title="所属栏目" style="width: 15%" >
			                	<jdf:columnValue dictionaryId="1001" value="${currentRowObject.belongColumn}"/>
							</jdf:column>
							<jdf:column property="advertName" title="广告名称" style="width: 15%" />
							<jdf:column property="type" title="内容类型" style="width: 15%" >
							   <jdf:columnValue dictionaryId="1003" value="${currentRowObject.type}"/>
							</jdf:column>
			                <jdf:column property="url" title="跳转网址" style="width: 15%" />
			                <jdf:column property="dispalyOrder" title="显示顺序" style="width: 15%" />
			                <jdf:column property="advertStatus" title="广告状态" style="width: 10%" >
							   <jdf:columnValue dictionaryId="1002" value="${currentRowObject.advertStatus}"/>
							</jdf:column>
			                
			                
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" style="width: 25%">
                                    <a href="${dynamicDomain}/advert/view/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large">
                                       <jdf:message code="查看"/>
                                    </a>
                                   <a href="${dynamicDomain}/advert/edit/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large">
                                       <jdf:message code="修改"/>
                                   </a>
								 <a href="${dynamicDomain}/advert/advertPicture?ajax=1" class="btn btn-primary btn-mini">
									<jdf:message code="查看广告图片效果"/>
								 </a>
								<a href="${dynamicDomain}/advert/display/list/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large">
									<jdf:message code="应用到页面"/>
								 </a>
                            </jdf:column>
						</jdf:row>
					</jdf:table>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
    
    </script>
</body>
</html>