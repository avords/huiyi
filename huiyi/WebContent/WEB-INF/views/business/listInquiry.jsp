<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>询盘管理</title>
</head>
<body>
	 <div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-edit"></span>询盘管理
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/admin/inquiry/page" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_productName" class="col-sm-3 control-label">产品名称</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="search_LIKES_productName" name="search_LIKES_productName" style="width: 240px;">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_companyName" class="col-sm-3 control-label">询盘公司</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="search_LIKES_companyName" name="search_LIKES_companyName" style="width: 240px;">
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
						<jdf:export view="csv" fileName="Inquiry.csv" tooltip="Export CSV" imageName="csv" />
						<jdf:export view="xls" fileName="Inquiry.xls" tooltip="Export EXCEL" imageName="xls" />
						<jdf:row>
							<jdf:column property="companyName" title="询盘公司名称" headerStyle="width:15%;"/>
							<jdf:column property="productName" title="产品名称" headerStyle="width:15%;" />
							<jdf:column property="quantity" title="购买数量" headerStyle="width:10%;" />
							<jdf:column property="unit" title="单位" headerStyle="width:15%;" >
								 <jdf:columnValue dictionaryId="1503" value="${currentRowObject.unit}" />
							</jdf:column>
							<jdf:column property="sendDate" title="发送时间" headerStyle="width:15%;" >
								<fmt:formatDate value="${currentRowObject.sendDate}" pattern="yyyy-MM-dd"/>
							</jdf:column>
							<jdf:column property="number" title="报价数" headerStyle="width:10%;" >
							 	<a href="${dynamicDomain}/admin/reportPrice/page?inquiryId=${currentRowObject.objectId}&companyId=${currentRowObject.fromCompanyId}" style="color:blue;"> 
	                            	${currentRowObject.number}
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