<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<html>
<head>
<title>企业首页</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${dynamicDomain}/static/assets/css/company.css">
<jdf:themeFile file="jquery.validate.min.js" />
<jdf:themeFile file="additional-methods_zh.js" />
<jdf:themeFile file="jquery.validate_zh.js" />
<style type="text/css">
	.companyIndex .ourProduct {
	    margin-bottom: 0px;
	    border: 1px solid #ddd;
	}
    .ourProduct p{
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        width:90%;
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
      <div class="newsL">
        <div class="title">
          <h3><jdf:message code="menu_supply_product" /></h3>
        </div>
        <div class="ourProduct clearfix">
	      <ul>
	      	<c:forEach items="${products }" var="mainProduct" varStatus="status">
	             <li> <a target="_blank" href="${dynamicDomain }/home/product/detail/${mainProduct.objectId}">
	          <div class="pic"><img src="${dynamicDomain}/${mainProduct.mainPicture }"></div>
	          <p title="<huiyi:i18n name='name' object='${mainProduct}'/>">  <huiyi:i18n name="name" object="${mainProduct}"/> </p>
	          <p class="color-red">${mainProduct.sellPrice }</p>
	          </a> </li>        
	        </c:forEach>
	      </ul>
	    </div>
      </div>
      <!--=== End 公司简介 ===--> 
      
    </div>
    
    
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
    
</script> 

</body>
</html>