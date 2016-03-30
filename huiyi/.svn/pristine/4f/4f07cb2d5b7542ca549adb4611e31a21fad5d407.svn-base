<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
	<title>页面正在加载中...</title>
	<jdf:themeFile file="wait.css" />
</head>
<body>
	<div id="loading" style="display: none;">
		<div class="loading-indicator">
			页面正在加载中...
		</div>
	</div>
	<script type="text/javascript">
		function loading(){
			document.getElementById("loading").style.display = "";
		}
		window.setTimeout(loading,1000);
		var o = parent.document.getElementById("mainContent");
		if(o!=undefined && o!=null){
			o.src="${forwardUrl}";
		}else{
			location = "${forwardUrl}";
		}
	</script>
</body>
</html>