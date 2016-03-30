<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<jdf:themeFile file="css/select2.css" />
<jdf:themeFile file="select2.js"/>
<jdf:themeFile file="ckeditor/ckeditor.js" />
<jdf:themeFile file="ckeditor/config.js" />
<jdf:themeFile file="ajaxfileupload.js" />
<jdf:themeFile file="kindeditor/kindeditor.js" />
<jdf:themeFile file="kindeditor/lang/zh_CN.js" />
<title>产品发布</title>
<style>
.attribute-remarkZh,.attribute-remarkEn{
    width:50px;
}
</style>
</head>
<body>
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="menu-icon glyphicon glyphicon-align-left icon-white"></span>产品发布
                <c:choose>
                    <c:when test="${entity.objectId eq null }">—新增</c:when>
                    <c:otherwise>
                         <c:choose>
                             <c:when test="${view==1 }">
                             —详情
                             </c:when>
                             <c:otherwise>
                             —修改
                             </c:otherwise>
                         </c:choose>
                    </c:otherwise>
                </c:choose>
        </div>
        <div class="panel-body">
            <jdf:form bean="entity" scope="request">
                <form method="post" action="${dynamicDomain}/admin/product/save" class="form-horizontal" id="productForm">
                    <input type="hidden" name="objectId">
                    <input type="hidden" name="status" id="status" value="1">
                    <div class="row">
                        <div class="col-sm-12 alert alert-info" id="messageBox">
                            ${message}</div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <div class="form-group">
                                <label class="control-label" for="paymentWay" style="font-weight: 700;font-size: 15px;">
                                 <jdf:message code="产品基本信息" />
                                  </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-md-6">
                                <div class="form-group">
                                        <label for="supplierId"  class="col-sm-2 control-label">企业名称</label>
                                        <div class="col-sm-10">
                                            <input type="hidden" class="form-control" name="supplierId" id="supplierId">
                                            <c:choose>
                                                <c:when test="${view==1 }">
                                                    <input type="text" class="form-control" name="supplierName" style="width: 100%;display: inline;" readonly="readonly" value="${supplierName }">
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" class="required form-control" name="supplierName" style="width: 80%;display: inline;" readonly="readonly" value="${supplierName }">
                                                    <a href="${dynamicDomain }/admin/company/companyTemplate?inputName=supplier&ajax=1" class="btn btn-primary colorbox-supplier">请选择</a>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="category">
                                 <jdf:message code="产品分类 " />
                                  </label>
                                <div class="col-sm-10">
                                    <c:if test="${entity.objectId!=null }">
                                    <input type="hidden" name="categoryId" value="${entity.categoryId }">
                                    </c:if>
                                    <select name="categoryId" id="categoryId" style="width:100%;">
                                            <option value="">—请选择—</option>
                                            <jdf:selectCollection items="categorys" optionValue="objectId" optionText="nameZh"/>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="productModel">
                                 <jdf:message code="产品型号 " />
                                  </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="productModel">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="minBuyNumber">
                                 <jdf:message code="起订量 " />
                                  </label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" name="minBuyNumber">
                                </div>
                                <div class="col-sm-4">
                                    <select name="buyUnit" class="form-control">
                                            <option value="">—请选择—</option>
                                            <jdf:select dictionaryId="1503" valid="true" />
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="paymentWay">
                                 <jdf:message code="Payment Terms" />
                                  </label>
                                <div class="col-sm-10">
                                    <huiyi:checkBox dictionaryId="1504" name="paymentWay"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="isMain">
                                 <jdf:message code="主产品" />
                                  </label>
                                <div class="col-sm-10">
                                    <select name="isMain"  class="form-control">
                                          <option value="">—请选择—</option>
                                          <jdf:select dictionaryId="109"/>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="paymentWay">资质
                                  </label>
                                <div class="col-sm-10">
                                    <c:forEach items="${qualificationDic }" var="item" varStatus="status">
                                        <div class="row">
                                            <span style="width:20%;display: inline-block;;">
                                                <input type="checkbox" id="qualification_${item.value }" name="qualification" value="${item.value }"><jdf:message code="${item.name }" />
                                            </span>
                                            <input style="width:75%;" type="text" id="qualificationRemark_${item.value }" name="qualificationRemark_${item.value }" placeholder="证照编码">
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="baseAttrs">
                        <c:forEach items="${productAttributes }" var="item" varStatus="status">
                            <div class="col-sm-6 col-md-6">
	                            <div class="form-group">
	                                <label class="col-sm-2 control-label">${item.attribute.nameZh }
		                            </label>
		                            <div class="col-sm-10">
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
								                                    <option value="">—请选择—</option>
								                                    <c:forEach items="${item.attributeVals }" var="attrVal" varStatus="st">
								                                        <option value="${attrVal.objectId }">${attrVal.nameZh }</option>
								                                    </c:forEach>
								                            </select>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <select name="baseAttr_${item.attribute.objectId }" class="form-control">
							                                    <option value="">—请选择—</option>
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
                    <div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="rmbPrice">
                                 <jdf:message code="RMB单价 " />
                                  </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control required" name="rmbPrice">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="usdPrice">
                                 <jdf:message code="USD单价 " />
                                  </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control required" name="usdPrice">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <div class="form-group">
                                <label class="control-label" for="paymentWay" style="font-weight: 700;font-size: 15px;">
                                 <jdf:message code="产品规格" />
                                  </label>
                            </div>
                        </div>
                    </div>
                     <div class="row" id="skuAttrs">
                    </div>
                    <div class="row">
                            <div class="col-sm-12 col-md-12">
                              <c:choose>
                                  <c:when test="${entity.objectId==null }">
                                      <table border="1" style="width: 100%;">
                                          <thead>
                                             <tr>
                                                 <th width="35%">中文属性值</th><th width="35%">英文属性值</th><th width="15%">人民币单价</th><th width="15%">美元单价</th>
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
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <div class="tabbable">
                                <ul class="nav nav-tabs">
                                    <li class=""><a href="#editZh" id="tab-zh" data-toggle="tab">中文</a></li>
                                    <li><a href="#editEn" id="tab-en" data-toggle="tab">英文</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="editZh">
                                        <div class="row">
                                            <div class="col-sm-12 col-md-12">
                                                <div class="form-group">
                                                    <label for="nameZh" class="col-sm-2 control-label"><jdf:message
                                                            code="产品标题" /></label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="nameZh" name="nameZh">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-12">
                                                <div class="form-group">
                                                    <label for="subNameZh" class="col-sm-2 control-label">
                                                        <jdf:message code="产品子标题" />
                                                    </label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="subNameZh" name="subNameZh">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-12">
                                                <div class="form-group">
                                                    <label for="keywordsZh" class="col-sm-2 control-label">
                                                        <jdf:message code="产品关键字" />
                                                    </label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="keywordsZh" name="keywordsZh">
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
					                                    <textarea class="required" name="descriptionZh" id="descriptionZh"  rows="500"></textarea> 
					                                </div>
					                            </div>
					                        </div>
					                    </div>
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
                                    <div id="editEn" class="tab-pane">
                                        <div class="row">
                                            <div class="col-sm-12 col-md-12">
                                                <div class="form-group">
                                                    <label for="nameEn" class="col-sm-2 control-label"><jdf:message
                                                            code="产品英文标题" /></label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="nameEn" name="nameEn">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-12">
                                                <div class="form-group">
                                                    <label for="subNameEn" class="col-sm-2 control-label">
                                                        <jdf:message code="产品英文子标题" />
                                                    </label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="subNameEn" name="subNameEn">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-12">
                                                <div class="form-group">
                                                    <label for="keywordsEn" class="col-sm-2 control-label">
                                                        <jdf:message code="产品英文关键字" />
                                                    </label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="keywordsEn" name="keywordsEn">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12 col-md-12">
                                                <div class="form-group">
                                                    <label for="descriptionEn" class="col-sm-2 control-label">
                                                        <jdf:message code="产品英文描述" />
                                                    </label>
                                                    <div class="col-sm-10">
                                                        <textarea name="descriptionEn" id="descriptionEn"  rows="500"></textarea> 
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-12">
                                                <div class="form-group">
                                                    <label for="packageListEn" class="col-sm-2 control-label">
                                                        <jdf:message code="包装信息" />
                                                    </label>
                                                    <div class="col-sm-10">
                                                        <textarea class="form-control" id="packageListEn" name="packageListEn" rows="10" cols=""></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-12">
                                                <div class="form-group">
                                                    <label for="remarkEn" class="col-sm-2 control-label">
                                                        <jdf:message code="其他" />
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
                    
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <div class="form-group">
                                <label class="control-label" for="paymentWay" style="font-weight: 700;font-size: 15px;">
                                 <jdf:message code="产品展示" />
                                  </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <div class="form-group">
                                <label class="col-sm-1 control-label" for="type">
                                 <jdf:message code="主图 " />
                                  </label>
                                <div class="col-sm-11">
                                    <input name="mainPicture" type="hidden" id="mainPicture">
                                    <div id="mainImg" style="width: 100px;">
                                    <c:if test="${entity.objectId != null&& entity.mainPicture!=null }">
                                        <c:if test="${view!=1 }">
                                          <a style="float: right;cursor: pointer;" id="mainDelete" data-path="${entity.mainPicture }">删除</a>
                                        </c:if>
                                          <img alt="" src="${dynamicDomain}/${entity.mainPicture}" width="100px" height="100px;">
                                    </c:if>
                                    </div>
                                    <input type="file" name="uploadFile" id="uploadFile1" style="display: inline;">
                                    <input type="button" value="裁剪图片" onclick="ajaxFileUpload1();" id="uploadButton1">
                                    <input type="button" value="默认上传" onclick="ajaxFileUpload11();" id="uploadButton11">
                                    </div>
                            </div>
                        </div>
                    </div>
                     <div class="row">
                        <div class="col-sm-12 col-md-12">
                        <input name="subPicture" type="hidden" id="subPicture" value="${subpictureStr }">
                            <div class="form-group">
                                <label class="col-sm-1 control-label" for="type">
                                 <jdf:message code="细节图 " />
                                  </label>
                                  <div class="col-sm-11">
                                        <span class="detail-picture" id="subImg">
                                          <c:forEach items="${subpictures }" var="item" varStatus="status">
                                            <div style="width: 100px;display: inline-block;">
                                             <c:if test="${view!=1 }">
                                               <a style="cursor: pointer;display: block;margin-left: 65px;" class="subDelete" data-path="${item.contentUrl }">删除</a>
                                             </c:if>
                                              <img alt="" src="${dynamicDomain}/${item.contentUrl}" width="100px" height="100px;">
                                            </div>
                                            </c:forEach>
                                        </span>
                                        <span>
                                            <input type="file" name="uploadFile" id="uploadFile2" style="display: inline;">
                                            <input type="button" value="裁剪图片" onclick="ajaxFileUpload2();" id="uploadButton2">
                                            <input type="button" value="默认上传" onclick="ajaxFileUpload22();" id="uploadButton22">
                                        </span>
                                    </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                            <div class="col-sm-12 col-md-12">
                                <div class="form-group">
                                    <label  class="col-sm-1 control-label"></label>
                                    <div class="col-sm-11">
                                    <p style="background-color:#FAFAD2;width:93%;padding:5px;font-size:13px;">为保证产品的网站展示效果，请务必提供画质清晰、具美感、有助于提升购物欲望的图片信息。所有图片信息会经招行审核，严禁上传涉嫌反动、淫秽内容的图片信息。<br>
具体要求：<br>
1.图片分辨率必须为1500*1500；<br>
2.图片格式支持JPG；<br>
3.所有的图片应该是白色背景且没有阴影；<br>
4.最多可以在一个产品创建中上传10张图片，单张图片的体积不能超过5M；<br>
5.若同组产品的不同子产品外观或者颜色存在差异，请提供所有子产品的图片资料。</p>
                                    </div>
                                </div>
                            </div>
                        </div>
<!--                         <div class="row" id="upDate"> -->
<!--                             <div class="col-sm-12 col-md-12"> -->
<!--                                 <div class="form-group"> -->
<!--                                      <label for="logo"  class="col-sm-2 control-label">指定上架时间段：</label> -->
<!--                                     <div class="col-sm-10"> -->
<%--                                         <input value="<fmt:formatDate value="${entity.startDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" type="text" style="width:180px;height:33px;" id="effectiveDate" name="startDate" size="14" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d',maxDate:'#F{$dp.$D(\'expireDate\')}',readOnly:true})">~ --%>
<%--                                         <input value="<fmt:formatDate value="${entity.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" type="text" style="width:180px;height:33px;" id="expireDate" name="endDate" size="14" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'effectiveDate\')}',readOnly:true})"> --%>
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
                    <div class="row">
                        <div class="col-sm-12 col-md-6">
                            <div class="pull-right">
                              <c:if test="${view!=1 }">
                                <button onclick="saveDraft();" class="btn btn-primary" type="button">
                                    <span class="glyphicon glyphicon-ok"></span>保存
                                </button>
                                <button onclick="saveSubmit();" class="btn btn-primary" type="button">
                                    <span class="glyphicon glyphicon-ok"></span>提交
                                </button>
                              </c:if>
                                <a href="${dynamicDomain}/${action}" class="back-btn">返回</a>
                            </div>
                        </div>
                    </div>
                    </div>
                </form>
            </jdf:form>
        </div>
    <jdf:bootstrapDomainValidate domain="Product" />
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
				                    '<option value="">—请选择—</option>'+optionText+
				            '</select>';
                }else{
                    inputType='<select name="baseAttr_'+baseAttr.objectId+'" class="form-control">'+
				                    '<option value="">—请选择—</option>'+optionText+
				            '</select>';
                }
            }
            str = str+'<div class="col-sm-6 col-md-6">'+
				            '<div class="form-group">'+
				            '<label class="col-sm-2 control-label">'+baseAttr.nameZh+
				            '</label>'+
				             '<div class="col-sm-10">'+inputType+
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
            alert('请选择上传文件');
            return false;
        }
        $.ajaxFileUpload({  
            url: '${dynamicDomain}/admin/productScreenshot/uploadProduct?ajax=1',  
            secureuri: false,  
            fileElementId: 'uploadFile1',  
            dataType: 'json',  
            success: function(json, status) {
                if(json.result=='true'){
                    var filePath = json.filePath;
                    var width = json.width;
                    var height = json.height;
                    var url = '${dynamicDomain}/admin/productScreenshot/productCrop?ajax=1&filePath='+filePath+"&width="+width+"&height="+height+"&type=main";
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
            alert('请选择上传文件');
            return false;
        }
        $.ajaxFileUpload({  
            url: '${dynamicDomain}/admin/productScreenshot/uploadProduct?ajax=1',  
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
              alert('请选择上传文件');
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
                url: '${dynamicDomain}/admin/productScreenshot/uploadProduct?ajax=1',  
                secureuri: false,  
                fileElementId: 'uploadFile2',  
                dataType: 'json',  
                success: function(json, status) {
                    if(json.result=='true'){
                        var filePath = json.filePath;
                        var width = json.width;
                        var height = json.height;
                        var url = '${dynamicDomain}/admin/productScreenshot/productCrop?ajax=1&filePath='+filePath+"&width="+width+"&height="+height+"&type=sub";
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
              alert('请选择上传文件');
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
                url: '${dynamicDomain}/admin/productScreenshot/uploadProduct?ajax=1',  
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
                  url:"${dynamicDomain}/admin/productScreenshot/deleteProduct",
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
                  url:"${dynamicDomain}/admin/productScreenshot/deleteProduct",
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
        <c:if test="${entity.objectId!=null&&isHaveSku==true}">
        $("#categoryId").attr("disabled","disabled");
            <c:forEach items="${payment}" var="item" varStatus ="status">
                $('#paymentWay${item.value}').attr("checked",'checked');
            </c:forEach>
            <c:forEach items="${qualifications}" var="item" varStatus ="status">
	            $('#qualification_${item.value}').attr("checked",'checked');
	            $('#qualificationRemark_${item.value}').val("${item.remark}");
	        </c:forEach>
        </c:if>
        
        <c:if test="${entity.objectId==null||isHaveSku==false}">
	        $("#categoryId").bind("change",function(){
	            if($(this).val()){
	                $.ajax({
	                    url:"${dynamicDomain}/admin/attribute/getAttribute/" + $(this).val(),
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
        $('[name="contryId"]').select2();
    });
    reloadParent=false;
    
    $(function(){
        KindEditor.ready(function(K) {
            descriptionZh = K.create('#descriptionZh',{
                 uploadJson : '${dynamicDomain}/connector/kindUpload?ajax=1',
                 afterBlur: function(){this.sync();},
                 allowFileManager : true,
                 width:795,
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
                 width:795,
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
                 width:795,
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
                 width:795,
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
                 width:795,
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
                 width:795,
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
    $(function(){
        $('#tab-zh').parent().addClass('active');
        $('#tab-en').parent().removeClass('active');
    });
    $(".colorbox-supplier").colorbox({width:"55%", height:"75%", fixed: true, iframe:true,onClosed:function(){ if(false){location.search=location.search.replace(/message.*&/,"");}},overlayClose:false});
    </script>
</body>
</html>