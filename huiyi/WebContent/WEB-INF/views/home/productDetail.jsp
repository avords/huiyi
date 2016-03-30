<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<html>
<head>
<title>产品页</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${dynamicDomain}/static/assets/css/company.css">
<jdf:themeFile file="jquery.validate.min.js" />
<jdf:themeFile file="jquery.validate_zh.js" />
<jdf:themeFile file="jquery.validate_en.js" />
</head>

<body>
<div class="wrapper"> 
  <!--=== 企业首页 ===-->
  <div class="container companyIndex"> 
    <%@ include file="common/companyHeader.jsp"%>
    <!--=== 产品介绍 ===-->
    <div class="product_introduce clearfix"> 
      <!--=== 1产品详情 ===-->
      <div class="product_detail clearfix"> 
        <!--产品参数开始-->
        <div style="float:left;">
          <div id="preview" class="spec-preview"> <span class="jqzoom"><img jqimg="${dynamicDomain }/${product.mainPicture}" src="${dynamicDomain }/${product.mainPicture}" /></span> </div>
          <!--缩图开始-->
          <div class="spec-scroll"> <a class="prev">&lt;</a> <a class="next">&gt;</a>
            <div class="items">
              <ul>
                <c:forEach items="${subpictures }" var="item" varStatus="status">
                    <li><img bimg="${dynamicDomain }/${item.contentUrl}" src="${dynamicDomain }/${item.contentUrl}" onmousemove="preview(this);"></li>
                </c:forEach>
              </ul>
            </div>
          </div>
          <!--缩图结束--> 
        </div>
        <!--产品参数结束-->
        
        <div class="product_list">
          <ul class="listinfo">
            <h3><huiyi:i18n name="name" object="${product}"/></h3>
            <li>
              <label><jdf:message code="label_productdetail_price" />：</label>
              <span style=" color:#f30; font-size:18px;">${product.sellPrice }
              </span> </li>
            <li>
              <label><jdf:message code="label_productdetail_MOQ" />：</label>
              <span>≥${product.minBuyNumber }<jdf:columnValue dictionaryId="1503" value="${product.buyUnit }"/></span> </li>
            <li>
              <label><jdf:message code="label_productdetail_trade" />：</label>
              <span>FOB, CIF, EXW</span> </li>
              <li>
              <label><jdf:message code="label_productdetail_qualifications" />：</label>
              <span>${qualification }</span> </li>
            <li>
            <li>
              <label><jdf:message code="label_productdetail_payment" />：</label>
              <span>${paymentWay }</span> </li>
<!--             <li> -->
<!--               <label>有效期：</label> -->
<%--               <span><fmt:formatDate value="${product.startDate}" pattern="yyyy-MM-dd"/> --%>
<%--               &nbsp;&nbsp;To&nbsp;&nbsp;<fmt:formatDate value="${product.endDate}" pattern="yyyy-MM-dd"/></span> </li> --%>
          </ul>
          <a class="btn-u btn-u-orange" style=" float:right; margin-right:240px; font-size:16px; padding:7px 25px;" href="#" data-toggle="modal" data-target="#singleInquiryModal" onclick="singleInquiry(${product.objectId});"><jdf:message code="label_product_contact"/></a>
        </div>
      </div>
      <!--=== End 产品详情 ===--> 
      
      <!--=== 2产品描述 ===-->
      <div class="product_describe clearfix">
        <div class="news">
          <div class="slideTxtBox">
            <div class="hd">
              <ul>
                <li><jdf:message code="label_productdetail_description" /></li>
                <li><jdf:message code="label_productdetail_specifications" /></li>
                <li><jdf:message code="label_productdetail_packing" /></li>
              </ul>
            </div>
            <div class="bd">
              <div class="news-pic">
                <div class="product_img clearfix">
                 <huiyi:i18n name="description" object="${product}"/>
                 </div>
              </div>
              <div class="news-pic">
                <div class="pic">
                  <ul class="pic_left">
                   <c:forEach items="${productAttributes }" var="item" varStatus="status">
                       <li>
                      <label>${item.attributeName }：</label>
                      <span>${item.attributeValue }</span> </li>
                   </c:forEach>
                  </ul>
                </div>
              </div>
              <div class="news-pic">
                <div class="product_img clearfix">
                <huiyi:i18n name="packageList" object="${product}"/>
                </div>
              </div>
              <!--=== End slideTxtBox ===--> 
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--=== End 产品介绍 ===--> 
    
    <!--=== 相关产品 ===-->
    <div class="product_relative clearfix">
      <a href="${dynamicDomain}/home/servicesList/1?ajax=1" class="colorbox-large">
      <label class="btn btn-success" style=" width:100%;font-size:17px; padding:7px 23px; margin-bottom:17px;">
      <img src="${dynamicDomain}/static/assets/img/iconfont-youhua.png" width="27"><jdf:message code="label_service_for_buyer"/>
      </label></a>
      <!--=== 相关标准 ===-->
      <div class="standard clearfix">
        <div class="title">
          <h3><jdf:message code="label_productdetail_standards" /></h3>
        </div>
        <ul>
         <c:forEach items="${standards }" var="item" varStatus="status">
          <li>
            <label><a href="${dynamicDomain }/home/stdDetail/${item.objectId}" target="_blank">${item.nameZh }</a></label>
            </li>
         </c:forEach>
        </ul>
      </div>
      <!--=== End 相关标准 ===--> 
      
      <!--=== 相关产品 ===-->
      <div class="relaProduct clearfix">
        <div class="title">
          <h3><jdf:message code="label_productdetail_products" /></h3>
        </div>
        <ul class="tc-bd">
          <c:forEach items="${products }" var="item" varStatus="status">
	          <li><a href="${dynamicDomain }/home/product/detail/${item.objectId}"><img src="${dynamicDomain }/${item.mainPicture}" /></a>
	            <dl>
	              <dt><a href="${dynamicDomain }/home/product/detail/${item.objectId}"><huiyi:i18n name="name" object="${item }"/></a></dt>
	              <dd>${item.sellPrice }</dd>
	            </dl>
	          </li>
          </c:forEach>
        </ul>
      </div>
      <!--=== End 相关产品 ===--> 
      
    </div>
    <!--=== End 产品介绍  ===--> 
  </div>
</div>
<!-- 单个产品询盘弹窗begin -->
<div class="modal fade" id="singleInquiryModal" tabindex="-1" role="dialog" aria-labelledby="singleInquiryModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="singleInquiryModalLabel"><jdf:message code="btn_inquiry"/></h4>
      </div>
      <div class="modal-body">
      <jdf:form bean="entity" scope="request">
        <form method="post" action="${dynamicDomain}/member/releaseInquiry" class="form-horizontal" id="singleInquiry" >
		<input type="hidden" name="productId" id="productId">
		<input type="hidden" name="categoryId" id="categoryId" value="0">
		<input type="hidden" name="secondCategoryId" id="secondCategoryId" value="0">
          <div class="form-group">
            <label class="col-lg-2 control-label"><jdf:message code="label_inquiry_fromCompany"/></label>
            <div class="col-lg-8">
              <input type="text" class="form-control" id="fromCompanyName" name="fromCompanyName" readonly="readonly">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-2 control-label"><span class="text-danger"> </span><jdf:message code="label_inquiry_product_name"/></label>
            <div class="col-lg-8">
              <input type="text" class="form-control" id="productName"  name="productName" readonly="readonly">
            </div>
          </div>
         <div class="form-group">
            <label class="col-lg-2 control-label"><span class="text-danger"> </span><jdf:message code="label_inquiry_description"/></label>
            <div class="col-lg-8">
              <textarea class="form-control" rows="3" readonly="readonly" id="description" name="description"></textarea><br>
            </div>
          </div>
         <div class="form-group">
            <label class="col-lg-2 control-label"><span class="red">* </span><jdf:message code="label_inquiry_quantity"/></label>
            <div class="col-lg-4">
              <input type="text" class="required form-control" name="quantity" id="quantity">
            </div>
            <div class="col-lg-2">
              <select class="required form-control" name="unit" id="unit">
					<jdf:select dictionaryId="1503" valid="true" />
              </select>
            </div>
         </div>
        </form>
        </jdf:form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><jdf:message code="label_inquiry_cancel"/></button>
        <button type="button" class="btn btn-primary" onclick="subform();"><jdf:message code="label_inquiry_submit"/></button>
      </div>
    </div>
  </div>
</div>
<!-- 单个产品询盘弹窗end -->

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
    
    function singleInquiry(productId){
    	$("#productId").val(productId);
    	$.ajax({
			url: "${dynamicDomain}/member/getProductInfo?productId="+productId,
			type : 'post',
			dataType : 'json',
			success :function (data) {
			 //对请求返回的JSON格式进行分解加载
				 $("#productName").val(data.product.nameZh);
				 $("#description").val(data.product.descriptionZh);
				 $("#fromCompanyName").val(data.fromCompanyName);
			}
		});
    }
    
    function subform(){
	   	 $('#singleInquiry').validate();
	   	 $('#singleInquiry').submit();
    }

</script> 

</body>
</html>