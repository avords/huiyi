<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>帮助信息</title>
<jdf:themeFile file="fckeditor/fckeditor.js" />
</head>
<body>
<div class="editForm">
<h3>帮助信息</h3>
<div class="message"><%=message %></div>
<div class="content">
<jdf:form bean="entity" scope="request">
<form action="<%=dynamicDomain%>/help/save" method="post" name="Help" id="Help">
	<input type="hidden" name="id" id="id">
	<input type="hidden" name="objectId">
	<ul>
		<li>
			<label for="title">标题：</label>
			<input type="text" name="title" style="width: 200px;">
		</li>
		<li>
			<label for="type">帐户类型：</label>
			<select  name="type"  style="width: 200px;">
				<jdf:select dictionaryId="227"/>
			</select>
		</li>
		<li style="width: 100%;">
			<label for="content">内容：</label>
			<textarea name="content" id="content" rows="20" cols="60"></textarea>
		</li>
	</ul>
	<div class="btns">
		<button type="submit">提交</button>
		<button type="button" onclick="toUrl('<%=dynamicDomain%>/help/page')">返回</button>
	</div>
	<script type="text/javascript">
		window.onload = function(){
			var oFCKeditor = new FCKeditor( 'content' ) ;
			oFCKeditor.BasePath = "<%=DomainUtils.getStaticDomain()%>js/fckeditor/" ;
			oFCKeditor.Height	= 400;
			oFCKeditor.Width = "80%";
			oFCKeditor.ToolbarSet = "Custom";
			oFCKeditor.ReplaceTextarea() ;
		};
	</script>
</form>
</jdf:form>
<jdf:commonValidate  domain="com.mvc.portal.model.Help"/>
</div>

</div>

</body>
</html>