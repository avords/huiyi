<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
	<base target="_self"/>
</head>
<body>
	<div class="contentBody contentborder">
		<div class="tab-pane" id="tabPane">
			<div id="message"><%=message %></div>
			<div class="tab-page">
				 <h1 class="tab">菜单图片配置列表</h1>
 				 <div class="contentborder">
                	 <jdf:form bean="request" scope="request">
						<form action="<%=dynamicDomain%>/menuImage/page" method="post">
							 <table class="inputTable">
			                 	<tr>
									<td nowrap class="label cancelBorderLeft">
										<label for="search_EQI_type">配置类型：</label>
									</td>
									<td class="content">
										<select name="search_EQI_type">
											<jdf:select dictionaryId="126"/>
										</select>
									</td>
									<td nowrap class="label">
										<label for="search_EQL_menuId">菜单ID：</label>
									</td>
									<td class="content">
										<input type="text" name="search_EQL_menuId">
									</td>
			                 	</tr>
			                 	<tr>
									<td nowrap class="label cancelBorderLeft">
										<label for="search_EQL_moduleId">模块ID：</label>
									</td>
									<td class="content" colspan="3">
										<input type="text" name="search_EQL_moduleId">
									</td>
			                 	</tr>
			                 	<tr>
                                	<td class="bottomLabel" nowrap colspan="4">
                                		<div class="pull-right">
											<button type="reset">重置</button>
											<button type="submit">查询</button>
                                		</div>
									</td>
			                 </table>
			            </form>
			        </jdf:form>
				</div>
				<div class="contentborder listArea">
					<div class="toolBar">
		 				<button type="button" onclick="window.location.href='<%=dynamicDomain%>/menuImage/create'">增加</button>
					</div>
					<div id="tableDiv">
						<jdf:table items="items" var="currentRowObject" retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit" action="page">
							<jdf:export view="csv" fileName="block.csv" tooltip="导出CSV" imageName="csv" />
							<jdf:export view="xls" fileName="block.xls" tooltip="导出EXCEL" imageName="xls" />
							<jdf:row>
								<jdf:column property="type" title="图片配置类型" style="width:25%">
									<jdf:columnValue dictionaryId="126" value="${currentRowObject.type}"/>
								</jdf:column>
								<jdf:column property="shortName" title="名称简写" style="width: 10%" />
								<jdf:column property="imageName" title="图片名称" style="width: 35%" />
								<jdf:column property="moduleId" title="模块ID" style="width: 10%" />
								<jdf:column property="menuId" title="菜单ID" style="width: 10%"/>
								<jdf:column alias="操作" sortable="false" viewsAllowed="html" style="width: 10%">
									<a href="<%=dynamicDomain%>/menuImage/edit/${currentRowObject.id}">修改</a>
								</jdf:column>
							</jdf:row>
						</jdf:table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>