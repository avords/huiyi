<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="com.mvc.portal.model.MenuImage"%>
<%@ include file="../common/header.jsp"%>
</head>
<body>
	<div class="contentBody contentborder">
		<div class="tab-pane" id="tabPane">
			<div id="message"><%=message %></div>
			<div class="tab-page" id="tabPage1">
				<h1 class="tab">菜单图片配置</h1>
				<div class="contentborder tableForm">
					<jdf:form bean="entity" scope="request">
						<form action="<%=dynamicDomain%>/menuImage/save" method="post">
							<input type="hidden" name="id">
							<input type="hidden" name="objectId">
							<table class="inputTable">
							    <tr class="BorderBottom">
									<td nowrap class="label cancelBorderLeft">
										<label for="type">图片类型：</label>
									</td>
									<td class="content">
										<select name="type" id="type">
											<jdf:select dictionaryId="126"/>
										</select>
									</td>
									<td nowrap class="label">
										<label for="imageName">图片名称：</label>
									</td>
									<td class="content">
										<input type="text" name="imageName">
									</td>
								</tr>
								<tr>
									<td nowrap class="label cancelBorderLeft module">
										<label for="moduleId">模块：</label>
									</td>
									<td class="content module" colspan="3">
										<select name="moduleId">
											<jdf:select dictionaryId="200"/>
										</select>
									</td>
									<td nowrap class="label menu">
										<label for="menuId">菜单：</label>
									</td>
									<td class="content menu" colspan="3">
										<select name="menuId">
											<jdf:selectCollection items="menus" optionValue="menuId" optionText="name"/>
										</select>
									</td>
								</tr>
								<tr>
									<td class="bottomLabel" nowrap colspan="6">
										<div class="pull-right">
											<button type="submit">提交</button>
											<c:if test="${not empty message}">
											<button type="button" onclick="toUrl('<%=dynamicDomain%>/menuImage/create?ajax=1')">继续增加</button>
											</c:if>
											<button type="button" onclick="toUrl('<%=dynamicDomain%>/menuImage/page')">返回</button>
										</div>
									</td>
								</tr>
							</table>
						</form>
					</jdf:form>
				</div>
			</div>
		</div>
	</div>
	<jdf:tableLabelValidate domain="MenuImage"/>
	<script type="text/javascript">

		function typeChange(){
			if($("#type").val()=="<%=MenuImage.MENU_IMAGE_TYPE_MODULE%>"){
				$(".menu").hide();
				$(".module").show();
			}else{
				$(".module").hide();
				$(".menu").show();
			}
		}

		$(document).ready(function(){
			$("#type").change(function(){
				typeChange();
			});
		});

		typeChange();
	</script>
</body>
</html>