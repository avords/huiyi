<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<html>
<head>
<title><jdf:message code="page_company" /></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${dynamicDomain}/static/assets/css/company.css">
<jdf:themeFile file="jquery.validate.min.js" />
<jdf:themeFile file="additional-methods_zh.js" />
<jdf:themeFile file="jquery.validate_zh.js" />
<style type="text/css">
.companyIndex .header_logo {
    height: auto;
    border: 1px solid #ddd;
    margin-top: 20px;
    padding: 15px 20px;
}
.companyIndex .send .content .news_control_title {
    width: 595px;
    height: 40px;
    padding: 0 17px;
    margin-bottom: 20px;
    border: 1px solid #ddd;
}
.companyIndex .send .content .news_control_content {
    width: 595px;
    height: 180px;
    margin-bottom: 15px;
    padding: 7px 17px;
    border: 1px solid #ddd;
}
.error {
    color: #b90808;
    font-size: 12px;
}
</style>
</head>

<body>
<div class="wrapper"> 
  
  <!--=== 企业首页 ===-->
  <div class="container companyIndex"> 
  	<%@ include file="common/companyHeader.jsp"%>
  
    <div class="Introduce clearfix"> 
      <!--=== 公司简介 ===-->
      <div class="news">
        <div class="title">
          <h3><img src="${dynamicDomain}/static/assets/img/iconfont-gongsi.png"><jdf:message code="company_profile" /></h3>
        </div>
        <div class="news-pic"> <img src="${dynamicDomain }/${company.mainPicture}">
          <ul class="listinfo">
            <li>
              <label><jdf:message code="business_type" />：</label>
              <span><c:forEach items="${businessTypes }" var="businessType" varStatus="status">
                      <jdf:columnValue dictionaryId="1013" value="${businessType.type }"/>、
                   </c:forEach></span> </li>
            <li class="border-dashed">
              <label><jdf:message code="main_product" />：</label>
              <span style=" color:#f30;">
                      <huiyi:i18n name="mainProducts" object="${company}"/>
              </span> 
            </li>
            <li>
              <label><jdf:message code="company_phone" />：</label>
              <span>${company.phoneAreaCode}-${company.phone}</span> </li>
            <li>
              <label><jdf:message code="company_email" />：</label>
              <span>${company.email}</span> </li>
            <li>
              <label><jdf:message code="company_fax" />：</label>
              <span>${company.faxAreaCode}-${company.fax}</span> </li>
          </ul>
          <div class="clearfix"></div>
          <p><div id="desc2">${company.txtDescription}</div><a class="color-red more" href="javascript:void(0)" id="detail2" onclick="detail2();"><jdf:message code="company_description" /></a></p>
        </div>
      </div>
      <!--=== End 公司简介 ===--> 
      
      <!--=== 公司概况 ===-->
      <div class="brand">
        <div class="tit">
          <h3><huiyi:i18n name="name" object="${company}"/></h3>
          <div class="icon">
          <c:if test="${company.level==1}"><span class="icon-jp1"><jdf:message code="company_ordinary" /></span></c:if>
          <c:if test="${company.level==2}"><span class="icon-jp2"><jdf:message code="company_gold" /></span></c:if>
          <c:if test="${company.level==3}"><span class="icon-jp3"><jdf:message code="company_vip" /></span></c:if>
          <c:if test="${company.isCheck==1}"><span class="icon-yz1"><jdf:message code="company_audited_supplier" /></span></c:if>
          </div>
        </div>
        <ul class="state">
          <li>
            <label><jdf:message code="label_country" />：</label>
            <span><huiyi:i18n name="name" object="${country}"/></span></li>
          <li>
            <label><jdf:message code="label_address" />：</label>
            <span><huiyi:i18n name="address" object="${company}"/></span></li>
          <li>
            <label><jdf:message code="label_aptitude" />：</label>
            <span>
				<c:forEach items="${certificates }" var="certificate" varStatus="status">
                      <jdf:columnValue dictionaryId="1015" value="${certificate.type }"/>、
                   </c:forEach>
			</span></li>
          <li>
            <label><jdf:message code="label_company_size" />：</label>
            <span><jdf:columnValue dictionaryId="1011" value="${company.numEmployees}"/></span></li>
          <li>
            <label><jdf:message code="label_website" />：</label>
            <span style="color:#5685C9;"><a href="${company.website}" target="_blank">${company.website}</a></span></li>
        </ul>
        <ul class="enroll">
          <li>
            <label><jdf:message code="label_reg_date" />：</label>
            <span><fmt:formatDate value="${company.foundingDate}" pattern="yyyy-MM-dd"/></span></li>
          <li>
            <label><jdf:message code="label_reg_capital" />：</label>
            <span>${company.registCapital==null?0:company.registCapital}</span></li>
          <li>
            <label><jdf:message code="label_reg_no" />：</label>
            <span>${company.registNumber}</span></li>
        </ul>
      </div>
      <!--=== End 公司概况 ===--> 
    </div>
    
    <!--=== 产品推荐 ===-->
    <div class="ourProduct clearfix">
      <div class="title">
        <h3><img src="${dynamicDomain}/static/assets/img/iconfont-chanpin.png"><jdf:message code="main_product" /></h3>
        <span><a href="${dynamicDomain}/home/company/product/${company.objectId}">More <i class="fa fa-angle-right"></i></a></span> </div>
      <ul>
      	<c:forEach items="${mainProducts }" var="mainProduct" varStatus="status" begin="0" end="4">
             <li> <a target="_blank" href="${dynamicDomain }/home/product/detail/${mainProduct.objectId}">
          <div class="pic"><img src="${dynamicDomain}/${mainProduct.mainPicture }"></div>
          <p>  <huiyi:i18n name="name" object="${mainProduct}"/> </p>
          <p class="color-red">${mainProduct.sellPrice }</p>
          </a> </li>        
        </c:forEach>
      </ul>
    </div>
    <!--=== End 产品推荐 ===--> 
    
    <!--=== 发送站内消息 ===-->
    <div class="send clearfix">
      <div class="title">
        <h3><img src="${dynamicDomain}/static/assets/img/iconfont-fasong.png"> <jdf:message code="label_send_message" /></h3>
      </div>
      <div class="content">
        <div class="news_content">
        	<span id="msg" style="color:red;font-size:14px;"></span>
			<form method="post" id="sendForm">
				  <input type="hidden" name="toCompany" value="${company.objectId}">
		          <div class="news_group">
		            <label><span style="color:#f30;">*</span> <jdf:message code="label_message_title" />：</label>
		            <input type="text" name="title" id="title" maxlength="50" class="news_control_title required" placeholder="Your message title(50 words)" >
		          </div>
		          <div class="news_group">
		            <label><span style="color:#f30;">*</span><jdf:message code="label_message_content" />：</label>
		            <textarea type="text" name="content" id="content" class="news_control_content required" placeholder="Enter your inquiry details such as product name, color, size, MOQ, FOB, etc."></textarea>
		          </div>
		          <div>
		            <label class="btn-u btn-u-orange" style="float:right;" onclick="sendMessage();"><jdf:message code="btn_send_now" /></label>
		          </div>
            </form>
        </div>
      </div>
    </div>
    <!--=== End 发送站内消息 ===--> 
  </div>
  <!--=== End 企业首页 ===--> 
  
<!-- 新增插件 SuperSlide --> 
<script type="text/javascript" src="${dynamicDomain}/static/assets/js/jquery.jqzoom.js"></script>
<script type="text/javascript">
    // 导航
    jQuery("#nav").slide({ 
        type:"menu",
        titCell:".nLi",
        targetCell:".sub",
        effect:"slideDown",
        delayTime:150 ,
        triggerTime:0,
        returnDefault:true 
    });
    jQuery(".picFocus").slide({ mainCell:".bd ul",effect:"left",autoPlay:true });
    
   	function sendMessage() {
   		var flag = $("#sendForm").valid();
   		if(!flag){
   			return false;
   		}
        var params = $("#sendForm").serialize();
		$.ajax({
			url : "${dynamicDomain}/home/company/saveCompanyMessage",
			type : 'post',
			dataType : 'json',
			data : params,
			success : function(json) {
				if(json.result){
					$("#title").val("");
					$("#content").val("");
				}
				alert(json.msg);
			}
		});
   	}
    
</script> 

</body>
</html>