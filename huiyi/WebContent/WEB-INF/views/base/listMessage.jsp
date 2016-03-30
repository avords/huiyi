<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>站内信管理</title>
</head>
<body>
	 <div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-list"></span><jdf:message code="站内信管理"/>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/admin/message/page" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQL_fromUser" class="col-sm-2 control-label">
									<jdf:message code="发送人"/>
								</label>
								<div class="col-sm-6">
									 <select  name="search_EQL_fromUser"  id="search_EQL_fromUser" style="width: 240px;">
                                            <option value="">全部</option>
                                            <jdf:selectCollection items="members" optionValue="objectId" optionText="userName" />
                                    </select>
								</div>
							 </div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_title" class="col-sm-2 control-label">
									<jdf:message code="标题"/>
								</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" style="width: 240px;" id="search_LIKES_title" name="search_LIKES_title" onkeyup="replaceSpace(this)" onkeydown="replaceSpace(this)">
								</div>
							 </div>
						</div>
					</div>	
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQI_isSee" class="col-sm-2 control-label">
									<jdf:message code="是否查看"/>
								</label>
								<div class="col-sm-6">
									 <select name="search_EQI_isSee"  id="search_EQI_isSee"  class="input-medium" style="width: 240px;">
										 <option value="">全部</option>
										 <jdf:select dictionaryId="109"/>
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
						<jdf:export view="csv" fileName="message.csv" tooltip="Export CSV" imageName="csv" />
						<jdf:export view="xls" fileName="message.xls" tooltip="Export EXCEL" imageName="xls" />
						<jdf:row>
							<jdf:column property="fromUser" title="发送人" style="width: 8%">
								<jdf:columnCollectionValue items="members" nameProperty="userName"  value="${currentRowObject.fromUser}"/>
							</jdf:column>
							<jdf:column property="fromCompany" title="发送企业" style="width: 15%" >
								<jdf:columnCollectionValue items="companys" nameProperty="nameZh"  value="${currentRowObject.fromCompany}"/>
							</jdf:column>
			                <jdf:column property="toCompany" title="接收企业" style="width: 15%" >
			               		 <jdf:columnCollectionValue items="companys" nameProperty="nameZh"  value="${currentRowObject.toCompany}"/>
							</jdf:column>
			                <jdf:column property="sendDate" title="发送时间" style="width:15%" cell="date" format="yyyy-MM-dd HH:mm:ss"/>
			                <jdf:column property="title" title="标题" style="width:25%" />
			                <jdf:column property="isSee" title="是否查看" style="width:8%" >
							   <jdf:columnValue dictionaryId="109" value="${currentRowObject.isSee}"/>
							</jdf:column>
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" style="width:18%">
								<a href="${dynamicDomain}/admin/message/view/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large">
									<span class="glyphicon glyphicon-edit"></span>
									<jdf:message code="查看"/>
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