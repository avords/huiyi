<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<jdf:themeFile file="My97DatePicker/WdatePicker.js" />
<title><jdf:message code="system.menu.menu"/></title>
</head>
<body>
	 <div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span><jdf:message code="system.menu.login_log"/>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/admin/loginLog/page" method="post" class="form-horizontal">
				 	<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					 <div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_loginName" class="col-sm-2 control-label">
									<jdf:message code="system.lable.user.login_name"/>
								</label>
								<div class="col-sm-8">
									 <input type="text" class="form-control" id="search_LIKES_loginName" name="search_LIKES_loginName">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_GED_beginDate" class="col-sm-2 control-label">
									<jdf:message code="system.lable.login.begin_date"/>
								</label>
								<div class="col-sm-8">
									<div class="input-append date" id="search_GED_beginDate">
										<input class="form-control Wdate" type="text" name="search_GED_beginDate"  id="search_GED_beginDate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})">
									</div>
								</div>
							 </div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQI_result" class="col-sm-2 control-label">
									<jdf:message code="common.lable.result"/>
								</label>
								<div class="col-sm-8">
									<select name="search_EQI_result" class="form-control">
										  <option value=""></option>
                                         <jdf:select dictionaryId="109"/>
									</select>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_message" class="col-sm-2 control-label">
									<jdf:message code="common.lable.remark"/>
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="search_LIKES_message" name="search_LIKES_message">
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
					<jdf:table items="items"  retrieveRowsCallback="limit" var="currentRowObject" filterRowsCallback="limit" sortRowsCallback="limit" action="page">
						<jdf:export view="csv" fileName="login_Log.csv" tooltip="导出CSV" imageName="csv" />
						<jdf:export view="xls" fileName="login_Log.xls" tooltip="导出EXCEL" imageName="xls" />
						<jdf:row>
							<jdf:column property="loginName" title="system.lable.user.login_name" style="width:10%" />
							<jdf:column property="userId" title="system.lable.user.user_name" style="width:15%">
	                                  <jdf:columnCollectionValue items="users"  nameProperty="userName" value="${currentRowObject.userId}"/>
	                              </jdf:column>
							<jdf:column property="beginDate" title="system.lable.login.begin_date" style="width:20%" cell="date" format="yyyy-MM-dd HH:mm:ss"/>
							<jdf:column property="ip" title="登录IP" style="width:10%" />
							<jdf:column property="result" title="common.lable.result" style="width:5%">
	                            <jdf:columnValue dictionaryId="109" value="${currentRowObject.result}"/>
	                        </jdf:column>
	                        <jdf:column property="onlineTime" title="system.lable.login.online_time" style="width:10%" />
	                        <jdf:column property="message" title="common.lable.remark" style="width:20%" />
						</jdf:row>
					</jdf:table>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	 	$(function() {
			 //为表格加上奇偶不同的样式
			$("#ec_table").addClass("table table-bordered table-striped");
		});
	 </script>
</body>
</html>