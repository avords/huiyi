<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<%@page import="com.mvc.framework.util.DomainUtils"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Cache" content="no-cache">
<meta http-equiv="Expires" content="0">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-control" content="no-cache">
<meta http-equiv="Cache" content="no-cache">
<title><jdf:message code="menu_platform_service" /></title>
<jdf:themeFile file="css/home_base.css" />
<style type="text/css">
</style>
</head>
<div class="container hy-service">
    <div class="wz"><a href="${dynamicDomain}/home"><jdf:message code="menu_home"/></a> &gt; <a href="${dynamicDomain}/home/services"><jdf:message code="menu_platform_service" /></a> &gt; <jdf:message code="label_detail" /></div>
    <div class="hy-detail">
      <div class="box">
        <div class="tit">
          <h3><huiyi:i18n name="name" object="${service}"/></h3>
        </div>
        <div class="content">
          <p><huiyi:i18n name="summary" object="${service}"/></p>
          <br>
          <p><huiyi:i18n name="detail" object="${service}"/></p>
          <br>
            <button class="btn-u btn-u-blue" id="buttonServiceApply" type="button" onclick="saveServiceApply()"><jdf:message code="btn_apply_service" /></button>
        </div>
      </div>
    </div>
  </div>
<script type="text/javascript">
	$(function(){ 
		$(".nav li").removeClass("active");  
	    $(".nav [role='services']").addClass("active");
	});
	
   function saveServiceApply(){
	 if(${empty sessionScope.m_loginName}){
        alert('<jdf:message code="message_login_first"/>！');
        return false;
     } 
	 var serviceId = ${service.objectId };
		$.ajax({
			type:'post',
			url:'${dynamicDomain}/home/saveServiceApply',
			dataType:'json',
			data:"serviceId="+serviceId,
            success:function(msg){
	        	if(msg.result){
	        		alert('<jdf:message code="common.base.success"/>！');
	        		$("#buttonServiceApply").hide();
	        	}else if(msg.noCompany){
	        		alert('<jdf:message code="company_status_no"/>！');
	        		$("#buttonServiceApply").hide();
	        	}
		     }
       });
	}

</script>  
</body>
</html>
