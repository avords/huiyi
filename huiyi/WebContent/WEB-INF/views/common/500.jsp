<%@page import="org.springside.modules.beanvalidator.BeanValidators"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="javax.validation.ConstraintViolationException"%>
<%@page import="org.slf4j.LoggerFactory"%>
<%@page import="org.slf4j.Logger"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isErrorPage="true"%>
<%@ include file="header.jsp"%>
<%
	String errorMessage = null;
	if(exception!=null){
		if(exception instanceof ConstraintViolationException){
			errorMessage = StringUtils.join(BeanValidators.extractPropertyAndMessageAsList((ConstraintViolationException)exception, " "), "\n");
		}else{
			errorMessage = exception.getMessage();
		}
	}else{
		errorMessage = "Unknow Problem";
	}
	String ajax = request.getParameter("ajax");
	if(ajax!=null&&ajax.equals("1")){
		out.print("{resultType:1,message:" + errorMessage + "}");
		out.flush();
		return;
	}
	if (exception == null){
		exception = (Exception) request.getAttribute("javax.servlet.error.exception");
		if(exception==null){
			exception = (Exception) session.getAttribute("javax.servlet.jsp.jspException");
			session.removeAttribute("javax.servlet.jsp.jspException");
		}
	}
	Logger logger = LoggerFactory.getLogger("500.jsp");
	logger.error(exception.getMessage(), exception);
%>
	<title>Error 500 (Internal Server Error)</title>
</head>
<body>
	<div>
		<div class="entry-header">
			<img src="<jdf:theme/>img/warning.gif">
			<button type="button" class="btn btn-primary" onclick="if (detail_error_msg.style.display == 'none'){detail_error_msg.style.display = '';parent.iframeAutoFit();}else{detail_error_msg.style.display = 'none';}"><i class="icon-circle-arrow-down"></i>详细信息</button>
			<button type="button" class="btn btn-primary" onclick="javascript:history.go(-1);"><i class="icon-circle-arrow-left"></i>返回</button>
			<div class="span12">
				<b>Error: </b> <span><%=errorMessage%></span>
			</div>
		</div>
		<div class="span12 entry-content" id="detail_error_msg" style="display:none;">
			<pre class="prettyprint linenums Lang-css">
				<span class="nocode">
			<%
				while(exception != null){
					exception.printStackTrace(new PrintWriter(out));
					if (exception instanceof JspException){
				      exception = ((JspException) exception).getRootCause();
				    }else if (exception instanceof ServletException){
				      exception = ((ServletException) exception).getRootCause();
				    }else {
				    	exception = exception.getCause();
				    }
				}
			%>
				</span>
			</pre>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
		     prettyPrint();
		});
	</script>
</body>
</html>
