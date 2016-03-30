<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<html>
<head>
<title><jdf:message code="label_product_newProducts" /></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${staticDomain}assets/css/member.css">
<jdf:themeFile file="My97DatePicker/WdatePicker.js" />
<jdf:themeFile file="kindeditor/kindeditor.js" />
<jdf:themeFile file="kindeditor/lang/zh_CN.js" />
<jdf:themeFile file="css/select2.css" />
<jdf:themeFile file="select2.js"/>
<jdf:themeFile file="ckeditor/ckeditor.js" />
<jdf:themeFile file="ckeditor/config.js" />
<jdf:themeFile file="ajaxfileupload.js" />
<jdf:themeFile file="jquery.validate.min.js" />
<jdf:themeFile file="additional-methods_zh.js" />
<jdf:themeFile file="jquery.validate_zh.js" />
<jdf:themeFile file="jquery.colorbox.min.js" />
<jdf:themeFile file="css/colorbox.css" />
<jdf:themeFile file="admin.js" />
<link rel="stylesheet" href="${staticDomain}assets/css/list.css">
<style type="text/css">
.attribute-remarkZh{
width:50px;:
}
.attribute-remarkEn{
width:50px;
}
span.error {
  font-weight: bold;
  color: #B94A48;
  margin-top: 2px;
}
</style>
</head>

<body>
<div class="wrapper"> 
  <div class="container member">
  <%@ include file="common/member_seller_left.jsp"%>
    <!--  内容  -->
    <div class="merberBody">
      <div class="tag-box tag-box-v3 form-page"> 
        <!--Inputs-->
        <h1 class="merberH1">
        <c:choose>
            <c:when test="${entity.objectId eq null }"><jdf:message code="label_product_newProducts" /></c:when>
            <c:otherwise>
                 <c:choose>
                     <c:when test="${view==1 }">
                        <jdf:message code="label_product_productDetails" />
                     </c:when>
                     <c:otherwise>
                         <jdf:message code="label_product_modifyProduct" />
                     </c:otherwise>
                 </c:choose>
            </c:otherwise>
        </c:choose>
        </h1>
        <div class="headline">
          <h3><jdf:message code="label_product_baseInfo" /></h3>
        </div>
      <jdf:form bean="entity" scope="request">
        <form method="post" action="${dynamicDomain}/member/product/save" class="form-horizontal" id="productForm">
        <input type="hidden" name="objectId">
        <input type="hidden" name="status" id="status" value="1">
        <div class="row">
            <div class="col-sm-12 alert alert-info" id="messageBox">
                ${message}</div>
        </div>
        <div class="row margin-bottom-40">
          <div class="col-md-6">
              <div class="form-group">
                <label for="inputEmail1" class="col-md-4 control-label"><span class="red">* </span><jdf:message code="label_product_supplierName" />：</label>
                <div class="col-md-7">
                  <input type="hidden" class="form-control" name="supplierId" value="${company.objectId }">
                  <input type="text" class="required form-control" readonly="readonly" value="${company.nameZh }">
                </div>
              </div>
          </div>
          <div class="col-sm-6 col-md-6">
               <div class="form-group">
                   <label class="col-sm-3 control-label" for="isMain">
                        <jdf:message code="label_product_isMain" />
                     </label>
                   <div class="col-sm-7">
                       <select name="isMain"  class="required form-control">
                             <option value="">—<jdf:message code="label_product_pleaseSelect" />—</option>
                             <jdf:select dictionaryId="109"/>
                       </select>
                   </div>
               </div>
           </div>
          <div class="col-md-12">
              <div class="form-group">
                <label for="inputEmail1" class="col-md-2 control-label"><span class="red">* </span><jdf:message code="label_product_category" />：</label>
                <div class="col-md-9">
                   <c:if test="${entity.objectId!=null }">
                   <input type="hidden" name="categoryId" value="${entity.categoryId }">
                   </c:if>
                   <select name="categoryId" class="required" id="categoryId" style="width:100%;">
                           <option value="">—<jdf:message code="label_product_pleaseSelect" />—</option>
                           <jdf:selectCollection items="categorys" optionValue="objectId" optionText="nameZh"/>
                   </select>
                </div>
              </div>
          </div>
          <div class="col-md-6">
              <div class="form-group">
                <label for="productModel" class="col-md-4 control-label"><jdf:message code="label_product_productModel" />：</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" name="productModel">
                </div>
              </div>
          </div>
          <div class="col-md-6">
              <div class="form-group">
                <label for="minBuyNumber" class="col-md-3 control-label"><jdf:message code="label_product_MOQ" />：</label>
                <div class="col-md-4">
                  <input type="text" class="required form-control" name="minBuyNumber">
                </div>
                <div class="col-md-3">
                  <select name="buyUnit" class="required form-control">
                          <option value="">—<jdf:message code="label_product_pleaseSelect" />—</option>
                          <jdf:select dictionaryId="1503" valid="true" />
                  </select>
                </div>
              </div>
          </div>
          <div class="col-md-12 margin-bottom-10">
              <div class="form-group">
                <label for="inputPassword1" class="col-md-2 control-label">Payment Terms：</label>
                <div class="col-sm-10">
                    <huiyi:checkBox dictionaryId="1504" name="paymentWay"/>
                </div>
              </div>
          </div>
          <div class="col-md-12">
              <div class="form-group">
                <label for="inputPassword1" class="col-md-2 control-label"><jdf:message code="label_productdetail_qualifications" />：</label>
                <div class="col-sm-10">
	              <c:forEach items="${qualificationDic }" var="item" varStatus="status">
	                  <div class="row">
	                      <div class="col-md-2" style="line-height:34px;">
	                          <input type="checkbox" id="qualification_${item.value }" name="qualification" value="${item.value }"><jdf:message code="${item.name }" />
	                      </div>
	                      <div class="col-md-8">
	                          <input class="form-control" type="text" id="qualificationRemark_${item.value }" name="qualificationRemark_${item.value }" placeholder="<jdf:message code="label_product_encodingLicense" />">
	                      </div>
	                  </div>
	              </c:forEach>
	          </div>
              </div>
          </div>
           <div class="row" id="baseAttrs">
             <c:forEach items="${productAttributes }" var="item" varStatus="status">
                 <div class="col-sm-6 col-md-6">
                     <div class="form-group">
                         <label class="col-sm-4 control-label">${item.attribute.nameZh }
                         </label>
                         <div class="col-sm-7">
                             <c:choose>
                                 <c:when test="${item.attribute.inputType==1}"><!-- 文本框 -->
                                     <c:choose>
                                         <c:when test="${item.attribute.type==1}"><!-- 关键属性 -->
                                             <input type="text" class="form-control required" name="baseAttr_${item.attribute.objectId }" value="${item.value }">
                                         </c:when>
                                         <c:otherwise>
                                             <input type="text" class="form-control" name="baseAttr_${item.attribute.objectId }" value="${item.value }">
                                         </c:otherwise>
                                     </c:choose>
                                 </c:when>
                                 <c:when test="${item.attribute.inputType==2}"><!-- 下拉框 -->
                                     <c:choose>
                                         <c:when test="${item.attribute.type==1}"><!-- 关键属性 -->
                                                 <select name="baseAttr_${item.attribute.objectId }" class="form-control required">
                                                         <option value="">—<jdf:message code="label_product_pleaseSelect" />—</option>
                                                         <c:forEach items="${item.attributeVals }" var="attrVal" varStatus="st">
                                                             <option value="${attrVal.objectId }">${attrVal.nameZh }</option>
                                                         </c:forEach>
                                                 </select>
                                         </c:when>
                                         <c:otherwise>
                                             <select name="baseAttr_${item.attribute.objectId }" class="form-control">
                                                     <option value="">—<jdf:message code="label_product_pleaseSelect" />—</option>
                                                     <c:forEach items="${item.attributeVals }" var="attrVal" varStatus="st">
                                                         <option value="${attrVal.objectId }">${attrVal.nameZh }</option>
                                                     </c:forEach>
                                             </select>
                                         </c:otherwise>
                                     </c:choose>
                                     <script>
                                        $('[name="baseAttr_${item.attribute.objectId }"]').val('${item.attributeValId }');
                                     </script>
                                 </c:when>
                             </c:choose>
                         </div>
                      </div>
                </div>
             </c:forEach>
         </div>
          <c:if test="${entity.objectId==null }">
             <div class="row">
                 <div class="col-sm-6 col-md-6">
                     <div class="form-group">
                         <label class="col-sm-4 control-label" for="rmbPrice">
                             <jdf:message code="label_product_RMBPrice" />
                           </label>
                         <div class="col-sm-7">
                             <input type="text" class="form-control required" name="rmbPrice">
                         </div>
                     </div>
                 </div>
                 <div class="col-sm-6 col-md-6">
                     <div class="form-group">
                         <label class="col-sm-3 control-label" for="usdPrice">
                               <jdf:message code="label_product_USDPrice" />
                           </label>
                         <div class="col-sm-7">
                             <input type="text" class="form-control required" name="usdPrice">
                         </div>
                     </div>
                 </div>
             </div>
             </c:if>
        </div>
        <div class="headline">
          <h3><span class="red">* </span><jdf:message code="label_product_productSpec" /></h3>
        </div>
        <div class="row margin-bottom-40">
          <div class="row" id="skuAttrs">
          </div>
          <div class="row">
              <div class="col-sm-12 col-md-12">
                <c:choose>
                    <c:when test="${entity.objectId==null }">
                        <table border="1" style="width: 100%;">
                            <thead>
                               <tr>
                                   <th width="35%"></span><jdf:message code="label_product_chineseAttributeValue" /></th><th width="35%"><jdf:message code="label_product_englishAttributeValue" /></th><th width="15%"><jdf:message code="label_product_RMBPrice" /></th><th width="15%"><jdf:message code="label_product_USDPrice" /></th>
                               </tr>
                            </thead>
                            <tbody id="skuBody">
                            </tbody>
                          </table>
                    </c:when>
                    <c:otherwise>
                        <table border="1" style="width: 100%;">
                            <thead>
                               <tr>
                                   <th width="15%">状态</th><th width="15%">产品编号</th><th width="20%">中文属性值</th><th width="20%">英文属性值</th><th width="15%">人民币单价</th><th width="15%">美元单价</th>
                               </tr>
                            </thead>
                            <tbody id="skuBody">
                                  <c:forEach items="${skus }" var="item" varStatus="status">
                                    <tr>
                                      <td style="display:none;">
                                          <input type="hidden" name="skuObjectId" value="${item.objectId }"/>
                                          <input type="hidden" name="skuNo" value="${item.skuNo }"/>
                                          <input type="hidden" name="skuStatus" value="${item.status }"/>
                                      </td>
                                      <td>
                                         <jdf:columnValue dictionaryId="1505" value="${item.status}" />
                                      </td>
                                      <td>
                                         ${item.skuNo }
                                      </td>
                                      <td>
                                         <input type="hidden" name="attributeValueIds" value="${item.attributeVals }"/>
                                         ${item.attributeValsZh }
                                      </td>
                                      <td>
                                         ${item.attributeValsEn }
                                      </td>
                                      <c:choose>
                                          <c:when test="${item.status==2||item.status==5}">
                                              <td><input name="sellPriceZh" readonly="readonly" id="sellPriceZh${status.index }" class="priceDouble required" value="${item.sellPriceZh }"></td>
                                              <td><input name="sellPriceEn" readonly="readonly" id="sellPriceEn${status.index }" class="priceDouble required" value="${item.sellPriceEn }"></td>
                                          </c:when>
                                          <c:otherwise>
                                              <td><input name="sellPriceZh" id="sellPriceZh${status.index }" class="priceDouble required" value="${item.sellPriceZh }"></td>
                                              <td><input name="sellPriceEn" id="sellPriceEn${status.index }" class="priceDouble required" value="${item.sellPriceEn }"></td>
                                          </c:otherwise>
                                      </c:choose>
                                  </tr>
                                </c:forEach>
                            </tbody>
                          </table>
                    </c:otherwise>
                </c:choose>
                  
              </div>
          </div>
          <div class="tab-v1" style="padding:0 10px;">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#button-1" data-toggle="tab" aria-expanded="true"><jdf:message code="label_product_chinese" /></a></li>
              <li class=""><a href="#button-2" data-toggle="tab" aria-expanded="false"><jdf:message code="label_product_english" /></a></li>
            </ul>
            <div class="tab-content" style="border:1px solid #ddd; padding:20px;">
              <div class="tab-pane fade active in" id="button-1">
                <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <div class="form-group">
                            <label for="nameZh" class="col-sm-2 control-label"><jdf:message
                                    code="产品标题" /></label>
                            <div class="col-sm-10">
                                <input type="text" class="required form-control" id="nameZh" name="nameZh">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12">
                        <div class="form-group">
                            <label for="subNameZh" class="col-sm-2 control-label">
                                <jdf:message code="产品子标题" />
                            </label>
                            <div class="col-sm-10">
                                <input type="text" class="required form-control" id="subNameZh" name="subNameZh">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12">
                        <div class="form-group">
                            <label for="keywordsZh" class="col-sm-2 control-label">
                                <jdf:message code="产品关键字" />
                            </label>
                            <div class="col-sm-10">
                                <input type="text" class="required form-control" id="keywordsZh" name="keywordsZh">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                   <div class="col-sm-12 col-md-12">
                       <div class="form-group">
                           <label for="descriptionZh" class="col-sm-2 control-label">
                               <jdf:message code="产品描述" />
                           </label>
                           <div class="col-sm-10">
                               <textarea name="descriptionZh" id="descriptionZh" class="required" rows="500"></textarea> 
                           </div>
                       </div>
                   </div>
               </div>
               <br>
                  <div class="row">
                   <div class="col-sm-12 col-md-12">
                       <div class="form-group">
                           <label for="packageListZh" class="col-sm-2 control-label">
                               <jdf:message code="包装信息" />
                           </label>
                           <div class="col-sm-10">
                               <textarea class="form-control" id="packageListZh" name="packageListZh" rows="10" cols=""></textarea>
                           </div>
                       </div>
                   </div>
                   </div>
                   <br>
                   <div class="row">
                   <div class="col-sm-12 col-md-12">
                       <div class="form-group">
                           <label for="remarkZh" class="col-sm-2 control-label">
                               <jdf:message code="其他" />
                           </label>
                           <div class="col-sm-10">
                               <textarea class="form-control" id="remarkZh" name="remarkZh" rows="5" cols=""></textarea>
                           </div>
                       </div>
                   </div>
                   </div>
              </div>
              <div class="tab-pane fade" id="button-2">
                <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <div class="form-group">
                            <label for="nameEn" class="col-sm-2 control-label">Product English title</label>
                            <div class="col-sm-10">
                                <input type="text" class="required form-control" id="nameEn" name="nameEn">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12">
                        <div class="form-group">
                            <label for="subNameEn" class="col-sm-2 control-label">
                                Product English sub title
                            </label>
                            <div class="col-sm-10">
                                <input type="text" class="required form-control" id="subNameEn" name="subNameEn">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12">
                        <div class="form-group">
                            <label for="keywordsEn" class="col-sm-2 control-label">
                                Product English key word
                            </label>
                            <div class="col-sm-10">
                                <input type="text" class="required form-control" id="keywordsEn" name="keywordsEn">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <div class="form-group">
                            <label for="descriptionEn" class="col-sm-2 control-label">
                                Product description in English
                            </label>
                            <div class="col-sm-10">
                                <textarea name="descriptionEn" id="descriptionEn" class="required" rows="500"></textarea> 
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row">
                <div class="col-sm-12 col-md-12">
                     <div class="form-group">
                         <label for="packageListEn" class="col-sm-2 control-label">
                             Product packaging information
                         </label>
                         <div class="col-sm-10">
                             <textarea class="form-control" id="packageListEn" name="packageListEn" rows="10" cols=""></textarea>
                         </div>
                     </div>
                 </div>
                 </div>
                 <br>
                 <div class="row">
                 <div class="col-sm-12 col-md-12">
                     <div class="form-group">
                         <label for="remarkEn" class="col-sm-2 control-label">
                             Other information
                         </label>
                         <div class="col-sm-10">
                             <textarea class="form-control" id="remarkEn" name="remarkEn" rows="5" cols=""></textarea>
                         </div>
                     </div>
                 </div>
                 </div>
              </div>
            </div>
          </div>
        </div>
        <div class="headline">
          <h3><jdf:message code="label_product_productShow" /></h3>
        </div>
        <div class="row margin-bottom-40">
          <div class="row">
              <div class="col-sm-12 col-md-12">
                  <div class="form-group">
                      <label class="col-sm-2 control-label" for="type">
                           <jdf:message code="label_product_mainPicture" />
                        </label>
                      <div class="col-sm-10">
                          <input name="mainPicture" type="hidden" id="mainPicture">
                          <div id="mainImg" style="width: 100px;">
                          <c:if test="${entity.objectId != null&& entity.mainPicture!=null }">
                              <c:if test="${view!=1 }">
                                <a style="float: right;cursor: pointer;" id="mainDelete" data-path="${entity.mainPicture }"><jdf:message code="label_product_delete" /></a>
                              </c:if>
                                <img alt="" src="${dynamicDomain}/${entity.mainPicture}" width="100px" height="100px;">
                          </c:if>
                          </div>
                          <input type="file" name="uploadFile" id="uploadFile1" style="display: inline;">
                          <input type="button" value="<jdf:message code="label_product_cutPicture" />" onclick="ajaxFileUpload1();" id="uploadButton1">
                          <input type="button" value="<jdf:message code="label_product_directUpload" />" onclick="ajaxFileUpload11();" id="uploadButton11">
                          </div>
                  </div>
              </div>
          </div>
          <div class="row">
               <div class="col-sm-12 col-md-12">
               <input name="subPicture" type="hidden" id="subPicture" value="${subpictureStr }">
                   <div class="form-group">
                       <label class="col-sm-2 control-label" for="type">
                             <jdf:message code="label_product_detailPicture" />
                         </label>
                         <div class="col-sm-10">
                               <span class="detail-picture" id="subImg">
                                 <c:forEach items="${subpictures }" var="item" varStatus="status">
                                   <div style="width: 100px;display: inline-block;">
                                    <c:if test="${view!=1 }">
                                      <a style="cursor: pointer;display: block;margin-left: 65px;" class="subDelete" data-path="${item.contentUrl }"><jdf:message code="label_product_delete" /></a>
                                    </c:if>
                                     <img alt="" src="${dynamicDomain}/${item.contentUrl}" width="100px" height="100px;">
                                   </div>
                                   </c:forEach>
                               </span>
                               <span>
                                   <input type="file" name="uploadFile" id="uploadFile2" style="display: inline;">
                                   <input type="button" value="<jdf:message code="label_product_cutPicture" />" onclick="ajaxFileUpload2();" id="uploadButton2">
                                   <input type="button" value="<jdf:message code="label_product_directUpload" />" onclick="ajaxFileUpload22();" id="uploadButton22">
                               </span>
                           </div>
                   </div>
               </div>
           </div>
          <div class="col-md-10 col-md-offset-1 margin-bottom-20" style="border:1px solid #F7BF91; background:#F8F8E0; padding:10px 0;">
            <div class="col-md-1" style="text-align:center; line-height:150px;"><img src="${dynamicDomain }/static/assets/img/iconfont-tishi.png"></div>
            <div class="col-md-11">
              <p>为保证产品的网站展示效果，请务必提供画质清晰、具美感、有助于提升购物欲望的图片信息。所有图片信息会经招行审核，严禁上传涉嫌反动、淫秽内容的图片信息。</p>
              <p>具体图片要求：</p>
              <p>1.图片分辨率必须为1500*1500；</p>
              <p>2.格式支持：JPG；</p>
              <p>3.所有的图片应该是白色背景且没有阴影；</p>
              <p>4.罪过可以再一个产品创建中上传10张图片，单张图片的体积不能超过5M；</p>
              <p>5.若同组产品的不同子产品外观或者颜色存在差异，请提供所有子产品的图片资料。</p>
            </div>
          </div>
<!--           <div class="row" id="upDate"> -->
<!--               <div class="col-sm-12 col-md-12"> -->
<!--                   <div class="form-group"> -->
<!--                        <label for="logo"  class="col-sm-2 control-label">指定上架时间段：</label> -->
<!--                       <div class="col-sm-10"> -->
<%--                           <input value="<fmt:formatDate value="${entity.startDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" type="text" style="width:180px;height:33px;display: inline-block;" id="effectiveDate" name="startDate" size="14" class="form-control Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d',maxDate:'#F{$dp.$D(\'expireDate\')}',readOnly:true})">~ --%>
<%--                           <input value="<fmt:formatDate value="${entity.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" type="text" style="width:180px;height:33px;display: inline-block;" id="expireDate" name="endDate" size="14" class="form-control Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'effectiveDate\')}',readOnly:true})"> --%>
<!--                       </div> -->
<!--                   </div> -->
<!--               </div> -->
<!--           </div> -->
        </div>
        <div class="row margin-bottom-40">
          <div class="col-md-12" style="text-align:center;"> 
          <c:if test="${view!=1 }">
             <a href="javascript:void(0);">
                <button class="btn btn-warning btn-sm" onclick="saveDraft();" type="button" style="width:60px; margin-right:20px;"><jdf:message code="label_product_save" /></button>
            </a>
             <a href="javascript:void(0);">
                <button class="btn btn-warning btn-sm" onclick="saveSubmit();" type="button" style="width:60px; margin-right:20px;"><jdf:message code="label_product_submit" /></button>
            </a> 
            </c:if>
            <a href="${dynamicDomain}/member/product/listSku">
            <button class="btn btn-info btn-u-sm" type="button" style="width:60px; margin-right:20px;"><jdf:message code="label_product_back" /></button>
            </a> 
            <c:if test="${view!=1 }">
            <a href="#">
            <button class="btn btn-success btn-u-sm" type="button"><jdf:message code="label_product_ApplyTranslation" /></button>
            </a> 
            </c:if>
            </div>
        </div>
        </form>
        </jdf:form>
      </div>
    </div>
    <!-- end  内容  --> 
  </div>
</div>
<script type="text/javascript">
function createBaseAttr(baseAttrs){
    var str = '';
    for(var i=0;i<baseAttrs.length;i++){
        var inputType='';
        var baseAttr = baseAttrs[i];
        var type = baseAttr.inputType;
        if(type=='1'){//文本框
            if(baseAttr.type=='1'){//关键属性
                inputType='<input type="text" class="form-control required" name="baseAttr_'+baseAttr.objectId+'">';
            }else{
                inputType='<input type="text" class="form-control" name="baseAttr_'+baseAttr.objectId+'">';
            }
        }else if(type=='2'){//下拉框
            var optionText='';
            for(var j in baseAttr.attributeVals){
                var attrVal = baseAttr.attributeVals[j];
                optionText = optionText+ '<option value="'+attrVal.objectId+'">'+attrVal.nameZh+'</option>';
            }
            if(baseAttr.type=='1'){//关键属性
                inputType='<select name="baseAttr_'+baseAttr.objectId+'" class="form-control required">'+
                                '<option value="">—<jdf:message code="label_product_pleaseSelect" />—</option>'+optionText+
                        '</select>';
            }else{
                inputType='<select name="baseAttr_'+baseAttr.objectId+'" class="form-control">'+
                                '<option value="">—<jdf:message code="label_product_pleaseSelect" />—</option>'+optionText+
                        '</select>';
            }
        }
        str = str+'<div class="col-sm-6 col-md-6">'+
                        '<div class="form-group">'+
                        '<label class="col-sm-4 control-label">'+baseAttr.nameZh+
                        '</label>'+
                         '<div class="col-sm-7">'+inputType+
                        '</div>'+
                    '</div>'+
                '</div>';
       
    }
    $('#baseAttrs').html(str);
}
function createSkuAttr(skuAttrs){
    var str = '';
    for(var i=0;i<skuAttrs.length;i++){
        var skuAttr = skuAttrs[i];
        var attrValStr = '';
        for(var j in skuAttr.attributeVals){
            var attrVal = skuAttr.attributeVals[j];
            attrValStr = attrValStr+'<span><input name="attributeValueId" type="checkbox" class="attributeValue atr" value="'+attrVal.objectId+'"><span class="attValue">'+attrVal.nameZh+'</span><input type="hidden" class="attValueEn" value="'+attrVal.nameEn+'"/><input type="text" name="attributeValueNameZh_'+attrVal.objectId+'" class="attribute-remarkZh" placeholder="中文"><input type="text" name="attributeValueNameEn_'+attrVal.objectId+'" class="attribute-remarkEn" placeholder="英文"></span>&nbsp;&nbsp;';
        }
        str = str+'<div class="col-sm-12 col-md-12 attr">'+
                        '<div class="form-group">'+
                        '<label class="col-sm-1 control-label">'+skuAttr.nameZh+
                          '</label>'+
                        '<div class="col-sm-11">'+attrValStr+
                        '</div>'+
                    '</div>'+
                '</div>';
    }
    $('#skuAttrs').html(str);
    createSku();
}
function createSku(){
    $(".attributeValue").click(function(){
        $('#skuBody').html('');
        //创建二维数组存储属性值id和属性值
        var attributeValId = new Array();
        var attributeName = new Array();
        var attributeName1 = new Array();
        var attributeNameZh = new Array();
        var attributeNameEn = new Array();
        var rowIndex=0;
        $('.attr').each(function(index,element){
            var obj = $(this);
            var valueLength = obj.find('.attributeValue:checked').length;
            if(valueLength>0){
                attributeValId[rowIndex] = new Array();
                attributeName[rowIndex] = new Array();
                attributeName1[rowIndex] = new Array();
                attributeNameZh[rowIndex] = new Array();
                attributeNameEn[rowIndex] = new Array();
                var colIndex=0;
                obj.find('.attributeValue:checked').each(function(index,element){
                    var valueObj = $(this);
                    attributeValId[rowIndex][colIndex] = valueObj.val();
                    attributeName[rowIndex][colIndex] = valueObj.siblings('.attValue').text();//原装中文名
                    attributeName1[rowIndex][colIndex] = valueObj.siblings('.attValueEn').val();//原装英文名
                    attributeNameZh[rowIndex][colIndex] = valueObj.siblings('.attribute-remarkZh').val();//备注中文名
                    attributeNameEn[rowIndex][colIndex] = valueObj.siblings('.attribute-remarkEn').val();//备注英文名
                    colIndex = colIndex+1;
                });
                rowIndex = rowIndex+1;
            }
        });
        //数据准备完成生产sku body
        var skuContent = '';
        //计算中文属性
        var attrValueZh = new Array();
        for(var i in attributeName){
            attrValueZh[i] = new Array();
            for(var j in attributeName[i]){
                if(attributeNameZh[i][j]==''){
                    attrValueZh[i][j] = attributeName[i][j];
                }else{
                    attrValueZh[i][j] = attributeNameZh[i][j];
                }
            }
        }
        //计算英文属性
        var attrValueEn = new Array();
        for(var i in attributeName1){
            attrValueEn[i] = new Array();
            for(var j in attributeName1[i]){
                if(attributeNameEn[i][j]==''){
                    attrValueEn[i][j] = attributeName1[i][j];
                }else{
                    attrValueEn[i][j] = attributeNameEn[i][j];
                }
            }
        }
        var vId =  generateGroup(attributeValId);
        var vNameZh =  generateGroup(attrValueZh);
        var vNameEn =  generateGroup(attrValueEn);
        var sellPriceZh = $('[name="rmbPrice"]').val();
        var sellPriceEn = $('[name="usdPrice"]').val();
        for(var i in vId){
            skuContent = skuContent+
            '<tr>'+
                '<td style="display:none;">'+
                   '<input type="hidden" name="skuObjectId" value=""/>'+
                   '<input type="hidden" name="skuNo" value=""/>'+
               '</td>'+
               '<td>'+
                   '<input type="hidden" name="attributeValueIds" value="'+vId[i]+'"/>'+
                   vNameZh[i]+
               '</td>'+
               '<td>'+
                   vNameEn[i]+
               '</td>'+
               '<td><input name="sellPriceZh" id="sellPriceZh'+i+'" class="priceDouble" value="'+sellPriceZh+'"></td>'+
               '<td><input name="sellPriceEn" id="sellPriceEn'+i+'" class="priceDouble" value="'+sellPriceEn+'"></td>'+
           '</tr>';
        }
        $('#skuBody').html(skuContent);
    });
}

function generateGroup(arrSpecValueList){
    var tempGroup = new Array();
    for(var i in arrSpecValueList){
        var s = arrSpecValueList[i];
        if(tempGroup.length==0){
            tempGroup = arrSpecValueList[0];
        }else{
            var newTempGroup = new Array();
            for(var j in tempGroup){
                for(var k in s){
                    newTempGroup.push(tempGroup[j]+','+s[k]);
                }
            }
            tempGroup = newTempGroup;
        }
    }
    return tempGroup;
}

function ajaxFileUpload1() {  
    if($("#uploadFile1").val()==''){
        alert('<jdf:message code="label_product_pleaseSelect" />上传文件');
        return false;
    }
    $.ajaxFileUpload({  
        url: '${dynamicDomain}/member/productScreenshot/uploadProduct?ajax=1',  
        secureuri: false,  
        fileElementId: 'uploadFile1',  
        dataType: 'json',  
        success: function(json, status) {
            if(json.result=='true'){
                var filePath = json.filePath;
                var width = json.width;
                var height = json.height;
                var url = '${dynamicDomain}/member/productScreenshot/productCrop?ajax=1&filePath='+filePath+"&width="+width+"&height="+height+"&type=main";
                $.colorbox({opacity:0.2,href:url,fixed:true,width:"65%", height:"85%", iframe:true,onClosed:function(){ if(false){location.reload(true);}},overlayClose:false});
            }else{
                alert(json.message);
            }
        },error: function (data, status, e)//服务器响应失败处理函数
        {
            alert(e);
        }
    }  
);
    return false;  
} 

function ajaxFileUpload11() {  
    if($("#uploadFile1").val()==''){
        alert('<jdf:message code="label_product_pleaseSelect" />上传文件');
        return false;
    }
    $.ajaxFileUpload({  
        url: '${dynamicDomain}/member/productScreenshot/uploadProduct?ajax=1',  
        secureuri: false,  
        fileElementId: 'uploadFile1',  
        dataType: 'json',  
        success: function(json, status) {
            if(json.result=='true'){
                var filePath = json.filePath;
                var img = '<a style="float: right;cursor: pointer;" id="mainDelete" data-path="'+filePath+'">删除</a>'+
                '<img alt="" src="${dynamicDomain}'+filePath+'" width="100px" height="100px;">';
                $("#mainPicture").val(filePath);
                $("#mainImg").html(img);
                bindPictureDelete();
            }else{
                alert(json.message);
            }
        },error: function (data, status, e)//服务器响应失败处理函数
        {
            alert(e);
        }
    }  
);
    return false;  
} 
    //副图图片上传
  function ajaxFileUpload2() { 
      if($("#uploadFile2").val()==''){
          alert('<jdf:message code="label_product_pleaseSelect" />上传文件');
          return false;
      }
        var subPicture = $('#subPicture').val();
        var array = new Array();
        array = subPicture.split(",");
        if(array.length>=10){
            alert("细节图片不能大于10张");
            return false;
        }
        $.ajaxFileUpload( {  
            url: '${dynamicDomain}/member/productScreenshot/uploadProduct?ajax=1',  
            secureuri: false,  
            fileElementId: 'uploadFile2',  
            dataType: 'json',  
            success: function(json, status) {
                if(json.result=='true'){
                    var filePath = json.filePath;
                    var width = json.width;
                    var height = json.height;
                    var url = '${dynamicDomain}/member/productScreenshot/productCrop?ajax=1&filePath='+filePath+"&width="+width+"&height="+height+"&type=sub";
                    $.colorbox({opacity:0.2,href:url,fixed:true,width:"65%", height:"85%", iframe:true,onClosed:function(){ if(false){location.reload(true);}},overlayClose:false});
                }else{
                    alert(json.message);
                }
            },error: function (data, status, e)//服务器响应失败处理函数
            {
                alert(e);
            }
        }  
    );
        return false;  
    } 
  function ajaxFileUpload22() { 
      if($("#uploadFile2").val()==''){
          alert('<jdf:message code="label_product_pleaseSelect" />上传文件');
          return false;
      }
        var subPicture = $('#subPicture').val();
        var array = new Array();
        array = subPicture.split(",");
        if(array.length>=10){
            alert("细节图片不能大于10张");
            return false;
        }
        $.ajaxFileUpload({  
            url: '${dynamicDomain}/member/productScreenshot/uploadProduct?ajax=1',  
            secureuri: false,  
            fileElementId: 'uploadFile2',  
            dataType: 'json',  
            success: function(json, status) {
                if(json.result=='true'){
                    var filePath = json.filePath;
                    var img = '<div style="width: 100px;display: inline-block;">'+
                    '<a style="cursor: pointer;display: block;margin-left: 65px;" class="subDelete" data-path="'+filePath+'">删除</a>'+
                    '<img alt="" src="${dynamicDomain}'+filePath+'" width="100px" height="100px;"></div>';
                    var subPath = $("#subPicture").val();
                    if(subPath==''){
                        $("#subPicture").val(filePath);
                    }else{
                        $("#subPicture").val(subPath+','+filePath);
                    }
                    $("#subImg").append(img);
                    bindPictureDelete();
                }else{
                    alert(json.message);
                }
            },error: function (data, status, e)//服务器响应失败处理函数
            {
                alert(e);
            }
        }  
    );
        return false;  
    }
  
  function bindPictureDelete(){
      //主图删除
      $('#mainDelete').click(function(){
          var mainPicture = $(this).data('path');
          var obj = $(this);
          $.ajax({
              url:"${dynamicDomain}/member/productScreenshot/deleteProduct",
              type : 'post',
              dataType : 'json',
              data:{'filePath':mainPicture},
              success : function(json) {
                      obj.parent().html('');
                       $('#mainPicture').val('');
              }
          });
          
      });
      //子图删除
      $('.subDelete').click(function(){
          var subPicture = $(this).data('path');
          var obj = $(this);
          $.ajax({
              url:"${dynamicDomain}/member/productScreenshot/deleteProduct",
              type : 'post',
              dataType : 'json',
              data:{'filePath':subPicture},
              success : function(json) {
                      obj.parent().remove();
                      //更新子图路径
                      var paths = '';
                      $('.subDelete').each(function(){
                          var path = $(this).data('path');
                          if(paths==''){
                              paths = path;
                          }else{
                              paths = paths+','+path;
                          }
                      });
                      $('#subPicture').val(paths);
              }
          });
      });
  }
  
$(function(){
    <c:if test="${entity.objectId!=null}">
    $("#categoryId").attr("disabled","disabled");
        <c:forEach items="${payment}" var="item" varStatus ="status">
            $('#paymentWay${item.value}').attr("checked",'checked');
        </c:forEach>
        <c:forEach items="${qualifications}" var="item" varStatus ="status">
            $('#qualification_${item.value}').attr("checked",'checked');
            $('#qualificationRemark_${item.value}').val("${item.remark}");
        </c:forEach>
    </c:if>
    
    <c:if test="${entity.objectId==null}">
        $("#categoryId").bind("change",function(){
            if($(this).val()){
                $.ajax({
                    url:"${dynamicDomain}/member/attribute/getAttribute/" + $(this).val(),
                    type : 'post',
                    dataType : 'json',
                    success : function(json) {
                        var skuAttrs = json.skuAttrs;
                        var otherAttrs = json.otherAttrs;
                        createBaseAttr(otherAttrs);
                        createSkuAttr(skuAttrs);
                    }
                });
            }
         }).change();
    </c:if>
    
    <c:if test="${view==1 }">
        $('input').each(function(){
            $(this).attr('disabled','disabled');
        });
        $('select').each(function(){
            $(this).attr('disabled','disabled');
        });
    </c:if>
});
reloadParent=false;
$('#productForm').validate();
$(function(){
	$('#productPublish').addClass("active");
	KindEditor.ready(function(K) {
		descriptionZh = K.create('#descriptionZh',{
             uploadJson : '${dynamicDomain}/connector/kindUpload?ajax=1',
             afterBlur: function(){this.sync();},
             allowFileManager : true,
             width:695,
             height:600,
             minWidth:658,
             minHeight:250,
             resizeType:0,
             items:['source', '|', 'fullscreen', 'undo', 'redo', 'print', 'cut', 'copy', 'paste',
                    'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
                    'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
                    'superscript', '|', 'selectall', '-',
                    'title', 'fontname', 'fontsize', '|', 'textcolor', 'bgcolor', 'bold',
                    'italic', 'underline', 'strikethrough', 'removeformat', '|', 'image',
                    'flash', 'media', 'advtable', 'hr', 'emoticons', 'link', 'unlink', '|', 'about']
        });
  });
	KindEditor.ready(function(K) {
		packageListZh = K.create('#packageListZh',{
             uploadJson : '${dynamicDomain}/connector/kindUpload?ajax=1',
             afterBlur: function(){this.sync();},
             allowFileManager : true,
             width:695,
             height:250,
             minWidth:658,
             minHeight:250,
             resizeType:0,
             items:['source', '|', 'fullscreen', 'undo', 'redo', 'print', 'cut', 'copy', 'paste',
                    'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
                    'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
                    'superscript', '|', 'selectall', '-',
                    'title', 'fontname', 'fontsize', '|', 'textcolor', 'bgcolor', 'bold',
                    'italic', 'underline', 'strikethrough', 'removeformat', '|', 'image',
                    'flash', 'media', 'advtable', 'hr', 'emoticons', 'link', 'unlink', '|', 'about']
        });
  });
	KindEditor.ready(function(K) {
		remarkZh = K.create('#remarkZh',{
             uploadJson : '${dynamicDomain}/connector/kindUpload?ajax=1',
             afterBlur: function(){this.sync();},
             allowFileManager : true,
             width:695,
             height:250,
             minWidth:658,
             minHeight:250,
             resizeType:0,
             items:['source', '|', 'fullscreen', 'undo', 'redo', 'print', 'cut', 'copy', 'paste',
                    'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
                    'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
                    'superscript', '|', 'selectall', '-',
                    'title', 'fontname', 'fontsize', '|', 'textcolor', 'bgcolor', 'bold',
                    'italic', 'underline', 'strikethrough', 'removeformat', '|', 'image',
                    'flash', 'media', 'advtable', 'hr', 'emoticons', 'link', 'unlink', '|', 'about']
        });
  });
	KindEditor.ready(function(K) {
		descriptionEn = K.create('#descriptionEn',{
             uploadJson : '${dynamicDomain}/connector/kindUpload?ajax=1',
             afterBlur: function(){this.sync();},
             allowFileManager : true,
             width:695,
             height:600,
             minWidth:658,
             minHeight:250,
             resizeType:0,
             items:['source', '|', 'fullscreen', 'undo', 'redo', 'print', 'cut', 'copy', 'paste',
                    'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
                    'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
                    'superscript', '|', 'selectall', '-',
                    'title', 'fontname', 'fontsize', '|', 'textcolor', 'bgcolor', 'bold',
                    'italic', 'underline', 'strikethrough', 'removeformat', '|', 'image',
                    'flash', 'media', 'advtable', 'hr', 'emoticons', 'link', 'unlink', '|', 'about']
        });
  });
	KindEditor.ready(function(K) {
		packageListEn = K.create('#packageListEn',{
             uploadJson : '${dynamicDomain}/connector/kindUpload?ajax=1',
             afterBlur: function(){this.sync();},
             allowFileManager : true,
             width:695,
             height:250,
             minWidth:658,
             minHeight:250,
             resizeType:0,
             items:['source', '|', 'fullscreen', 'undo', 'redo', 'print', 'cut', 'copy', 'paste',
                    'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
                    'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
                    'superscript', '|', 'selectall', '-',
                    'title', 'fontname', 'fontsize', '|', 'textcolor', 'bgcolor', 'bold',
                    'italic', 'underline', 'strikethrough', 'removeformat', '|', 'image',
                    'flash', 'media', 'advtable', 'hr', 'emoticons', 'link', 'unlink', '|', 'about']
        });
  });
	KindEditor.ready(function(K) {
		remarkEn = K.create('#remarkEn',{
             uploadJson : '${dynamicDomain}/connector/kindUpload?ajax=1',
             afterBlur: function(){this.sync();},
             allowFileManager : true,
             width:695,
             height:250,
             minWidth:658,
             minHeight:250,
             resizeType:0,
             items:['source', '|', 'fullscreen', 'undo', 'redo', 'print', 'cut', 'copy', 'paste',
                    'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
                    'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
                    'superscript', '|', 'selectall', '-',
                    'title', 'fontname', 'fontsize', '|', 'textcolor', 'bgcolor', 'bold',
                    'italic', 'underline', 'strikethrough', 'removeformat', '|', 'image',
                    'flash', 'media', 'advtable', 'hr', 'emoticons', 'link', 'unlink', '|', 'about']
        });
  });
});
function valideKind(){
    var nameZh = $('input[name="nameZh"]').val();
    var nameEn = $('input[name="nameEn"]').val();
    if(nameZh!==''){
        var d = descriptionZh.html();
        var p = packageListZh.html();
        if(/^\s*$/.test(d)){
            alert('产品描述中文不能为空!');
            return false;
        }
        if(/^\s*$/.test(p)){
            alert('包装信息中文不能为空!');
            return false;
        }
    }
    if(nameEn!==''){
        var d = descriptionEn.html();
        var p = packageListEn.html();
        if(/^\s*$/.test(d)){
            alert('产品描述英文不能为空!');
            return false;
        }
        if(/^\s*$/.test(p)){
            alert('包装信息英文不能为空!');
            return false;
        }
    }
    return true;
}
function saveDraft(){
	$('#status').val(1);
	if($('#mainPicture').val()==''){
		alert('主图不能为空');
		return false;
	}
	if(!valideKind()){
        return false;
    }
	$('#productForm').submit();
}
function saveSubmit(){
	$('#status').val(2);
    if($('#mainPicture').val()==''){
        alert('主图不能为空');
        return false;
    }
    if(!valideKind()){
        return false;
    }
    $('#productForm').submit();
}
$('#categoryId').select2();
</script>
</body>
</html>