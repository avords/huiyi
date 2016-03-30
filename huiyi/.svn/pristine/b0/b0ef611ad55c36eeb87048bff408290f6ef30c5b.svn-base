<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="../common/header.jsp"%>
<title>Home</title>
</head>
<body>
<script type="text/javascript">
$(document).ready(function(){
	$(".nav-list a").each(function(item){
		if($(this).attr("href")!="#"){
			var bro=$.browser;
			if(bro.safari) {
				var evObj = document.createEvent('MouseEvents');
				evObj.initMouseEvent('click', true, true, window);
				this.dispatchEvent(evObj);
			}else{
				this.click();
			}
			return false;
		}
	});
});
</script>
</body>
