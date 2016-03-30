<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>帮助列表</title>
</head>
<body>
<div class="editForm">
<h3>帮助列表</h3>
<div class="message"><%=message %></div>
<div class="content"><jdf:form bean="request" scope="request">
	<form action="<%=dynamicDomain%>/help/page" method="post" name="User" id="User">
	<ul>
		<li>
			<label for="search_LIKES_title">标题：</label>
			<input type="text" name="search_LIKES_title">
		</li>
		<li>
			<label for="search_EQL_type">类型：</label>
			<select  name="search_EQL_type" style="width: 200px;">
				<option></option>
				<jdf:select dictionaryId="227"/>
			</select>
		</li>
	</ul>
	<div class="btns">
		<button type="reset">重置</button><button type="submit">查询</button>
	</div>
	</form>
</jdf:form>
</div>
</div>

<div class="rightToolBar">
	<a href="<%=dynamicDomain%>/help/create">增加</a>
</div>
<div id="tableDiv">
<jdf:table items="items"  retrieveRowsCallback="limit" var="currentRowObject" filterRowsCallback="limit" sortRowsCallback="limit" action="page">
	<jdf:export view="csv" fileName="help.csv" tooltip="导出CSV" imageName="csv" />
	<jdf:export view="xls" fileName="help.xls" tooltip="导出EXCEL" imageName="xls" />
	<jdf:row>
		<jdf:column property="title" title="标题" style="width: 40%" />
		<jdf:column property="type" title="类型" style="width:15%">
			<jdf:columnValue dictionaryId="227" value="${currentRowObject.type}"/>
		</jdf:column>
		<jdf:column alias="操作" sortable="false" viewsAllowed="html" style="width: 10%">
			<a href="<%=dynamicDomain%>/help/edit/${currentRowObject.id}">修改</a>
			<a href="<%=dynamicDomain%>/help/preview/${currentRowObject.helpId}">查看</a>
			<a href="<%=dynamicDomain%>/help/delete/${currentRowObject.id}">删除</a>
		</jdf:column>
	</jdf:row>
</jdf:table>
</div>
</body>
</html>