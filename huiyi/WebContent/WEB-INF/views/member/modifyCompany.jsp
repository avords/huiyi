<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<html>
<head>
<title><jdf:message code="menu_member_account" /></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${dynamicDomain}/static/assets/css/member.css">
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
<jdf:themeFile file="jquery.validate_en.js" />
<jdf:themeFile file="jquery.colorbox.min.js" />
<jdf:themeFile file="css/colorbox.css" />
<jdf:themeFile file="admin.js" />
<style type="text/css">
span.error {
  font-weight: bold;
  color: #B94A48;
  margin-top: 2px;
}
input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
    -webkit-appearance: none !important;
    margin: 0;
    }
.Wdate{
	width:290px;
	}    
</style>
</head>
<body>
<div class="wrapper"> 
<div class="container member">
	<%@ include file="common/member_left.jsp"%>
	<div class="merberBody">
      <div class="tag-box tag-box-v3 form-page"> 
        <div class="headline">
          <h3><jdf:message code="menu_member_company" /></h3>
        </div>
		<jdf:form bean="entity" scope="request">        
        <form class="reg-page form-horizontal" method="post" action="${dynamicDomain}/member/saveCompany" id="editForm">
        <div class="row margin-bottom-40">
	        <c:if test="${message!=null}">
	        	<div class="span12 alert alert-info" id="messageBox">
					<jdf:message code="${message}" />
				</div>
	    	</c:if>
          <input type="hidden" id="validateId" name="validateId">
          <input type="hidden" name="objectId" value="${entity.objectId }">
          <div class="col-md-6">
	          	<div class="form-group">
	                <label for="countryId" class="col-lg-3 control-label"><span class="red">* </span><jdf:message code="label_country" />：</label>
	                <div class="col-lg-8">
	                  <select class="required form-control" name="countryId">
	                         <option value="">-<jdf:message code="label_option_all" />-</option>
	                         <jdf:selectCollection items="countries" optionValue="objectId" optionText="nameZh" />
	                  </select>
	                </div>
	            </div>
               <div class="form-group">
                <label for="" class="col-lg-3 control-label"><span class="red">* </span><jdf:message code="company_phone" />：</label>
                <div class="col-lg-3">
					<input type="tel" class="required form-control" id="phoneAreaCode" name="phoneAreaCode" placeholder="<jdf:message code="company_phone_area_code" />" value="${entity.phoneAreaCode }">
				</div>
				<div class="col-lg-5">
					<input type="tel" class="required form-control" id="phone" name="phone" value="${entity.phone }">
				</div>
              </div>
              <div class="form-group">
                <label for="email" class="col-lg-3 control-label"><span class="red">* </span><jdf:message code="company_email" />：</label>
                <div class="col-lg-8">
                  <input type="email" class="required form-control" id="email" maxlength="128" name="email" value="${entity.email }">
                </div>
              </div>
              <div class="form-group">
                <label for="registNumber" class="col-lg-3 control-label"><jdf:message code="label_reg_no" />：</label>
                <div class="col-lg-8">
                  <input type="text" class="form-control" id="registNumber" maxlength="64" name="registNumber">
                </div>
              </div>
              <div class="form-group">
                <label for="registCapital" class="col-lg-3 control-label"><jdf:message code="label_reg_capital" />：</label>
                <div class="col-lg-8">
                  <input type="number" class="form-control" id="registCapital" name="registCapital">
                </div>
              </div>
              <div class="form-group" style=" margin-bottom:10px;">
                <label for="inputEmail1" class="col-lg-3 control-label"><span class="red">* </span><jdf:message code="company_logo" />：</label>
                <div class="col-lg-8">
                  <input name="logoAddress" type="hidden" id="logoAddress">
                     <div id="logoImg" style="width:80px;">
                     <c:if test="${entity.objectId!=null&&entity.logoAddress!=null&&entity.logoAddress!='' }">
                           <a style="float: right;cursor: pointer;" id="logoDelete" data-path="${entity.logoAddress }">删除</a>
                         <img alt="" src="${dynamicDomain}${entity.logoAddress}" width="100px" height="100px;">
                     </c:if>
                     </div>
                     <input type="file" name="uploadFile" id="uploadFile3" style="display: inline;">
                     <input type="button" value="裁剪图片" onclick="ajaxFileUpload3();" id="uploadButton3">
                     <input type="button" value="默认上传" onclick="ajaxFileUpload33();" id="uploadButton33">
                     </div>
                </div>
              </div>
              
          <div class="col-md-6">
              <div class="form-group">
                <label for="numEmployees" class="col-lg-3 control-label"><span class="red"></span><jdf:message code="label_company_size" />：</label>
                <div class="col-lg-8">
                    <select class="form-control" name="numEmployees" id="numEmployees">
						<option value="">-<jdf:message code="label_option_all" />-</option>
							<jdf:select dictionaryId="1011" />
					</select>
                </div>
              </div>
              <div class="form-group">
                <label for="fax" class="col-lg-3 control-label"><span class="red">* </span><jdf:message code="company_fax" />：</label>
                <div class="col-sm-3">
					<input type="tel" class="required form-control" id="faxAreaCode" name="faxAreaCode" placeholder="<jdf:message code="company_phone_area_code" />" value="${entity.faxAreaCode }">
				</div>
				<div class="col-sm-5">
					<input type="tel" class="required form-control" id="fax" name="fax" value="${entity.fax }">
				</div>
              </div>
              <div class="form-group">
                <label for="telphone" class="col-lg-3 control-label"><jdf:message code="company_telphone" />：</label>
                <div class="col-lg-8">
                  <input type="tel" maxlength="11" class="form-control" id="telphone" name="telphone" value="${entity.telphone }">
                </div>
              </div>
              <div class="form-group">
                <label for="foundingDate" class="col-lg-3 control-label"><jdf:message code="label_reg_date" />：</label>
                <div class="col-lg-8">
                	<input type="date" class="form-control" value="<fmt:formatDate value="${entity.foundingDate}" pattern="yyyy-MM-dd"/>" id="foundingDate" class="Wdate" name="foundingDate">
                </div>
              </div>
              <div class="form-group">
                <label for="website" class="col-lg-3 control-label"><jdf:message code="label_website" />：</label>
                <div class="col-lg-8">
                  <input type="url" class="form-control" id="website" maxlength="64" name="website" value="${entity.website }">
                </div>
              </div>
           </div>
          <div class="col-md-9">
              <div class="form-group">
                <label for="businessType" class="col-lg-2 control-label"><jdf:message code="business_type" />：</label>
                <div class="col-lg-8">
                	<huiyi:checkBox dictionaryId="1013" name="businessType"/>
                </div>	
              </div>
          </div>
        </div>
        <div class="tab-v1 margin-bottom-40">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#button-1" data-toggle="tab" aria-expanded="true">中文</a></li>
            <li class=""><a href="#button-2" data-toggle="tab" aria-expanded="false">English</a></li>
          </ul>
          <div class="tab-content" style="border:1px solid #ddd; padding:20px;">
            <div class="tab-pane fade active in" id="button-1">
              <div class="clearfix margin-bottom-10"></div>
              <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                      <label for="nameZh" class="col-lg-2 control-label"><span class="red">* </span><jdf:message code="label_name" />：</label>
                      <div class="col-lg-9">
                        <input type="text" class="required form-control" id="nameZh" maxlength="32" name="nameZh" value="${entity.nameZh }">
                      </div>
                    </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                      <label for="addressZh" class="col-lg-2 control-label"><span class="red">* </span><jdf:message code="label_address" />：</label>
                      <div class="col-lg-9">
                        <input type="text" class="required form-control" id="addressZh" maxlength="64" name="addressZh" value="${entity.addressZh }">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="descriptionZh" class="col-lg-2 control-label"><span class="red">* </span><jdf:message code="label_company_description" />：</label>
                      <div class="col-lg-9">
                      	<textarea name="descriptionZh" id="descriptionZh" rows="5" class="required form-control" ></textarea>
                      </div>
                      <script type="text/javascript">
                              KindEditor.ready(function(K) {
                                  descriptionEn = K.create('#descriptionZh',{
                                       uploadJson : '${dynamicDomain}/connector/kindUpload?ajax=1',
                                       afterBlur: function(){this.sync();},
                                       allowFileManager : true,
                                       width:628,
                                       height:300,
                                       minWidth:500,
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
                        </script>
                    </div>
                    <div class="form-group">
                      <label for="mainProductsZh" class="col-lg-2 control-label"><span class="red">* </span><jdf:message code="main_product" />：</label>
                      <div class="col-lg-9">
                        <textarea class="required form-control" placeholder="请输入关键字，关键字用英文“,”隔开" style="resize:none;" rows="5" maxlength="64" id="mainProductsZh" name="mainProductsZh"></textarea>
                      </div>
                    </div>
                </div>
              </div>
            </div>
            <div class="tab-pane fade" id="button-2">
              <div class="clearfix margin-bottom-10"></div>
              <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                      <label for="nameEn" class="col-lg-2 control-label"><span class="red">* </span><jdf:message code="label_name" />：</label>
                      <div class="col-lg-9">
                        <input type="text" class="required form-control" id="nameEn" maxlength="32" name="nameEn" value="${entity.nameEn }">
                      </div>
                    </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                      <label for="addressEn" class="col-lg-2 control-label"><span class="red">* </span><jdf:message code="label_address" />：</label>
                      <div class="col-lg-9">
                        <input type="text" class="required form-control" id="addressEn" maxlength="64" name="addressEn" value="${entity.addressEn }">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="descriptionEn" class="col-lg-2 control-label"><span class="red">* </span><jdf:message code="label_company_description" />：</label>
                      <div class="col-lg-9">
                        <textarea name="descriptionEn" id="descriptionEn" class="required form-control" rows="5"></textarea>
                      </div>
                      <script type="text/javascript">
                              KindEditor.ready(function(K) {
                                  descriptionEn = K.create('#descriptionEn',{
                                       uploadJson : '${dynamicDomain}/connector/kindUpload?ajax=1',
                                       afterBlur: function(){this.sync();},
                                       allowFileManager : true,
                                       width:628,
                                       height:300,
                                       minWidth:500,
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
                        </script>
                    </div>
                    <div class="form-group">
                      <label for="mainProductsEn" class="col-lg-2 control-label"><span class="red">* </span><jdf:message code="main_product" />：</label>
                      <div class="col-lg-9">
                      	<textarea class="required form-control" maxlength="64" placeholder="Please input the keywords,separated by a comma “,” in english!" maxlength="64" style="resize:none;" rows="5" id="mainProductsEn" name="mainProductsEn"></textarea>
                      </div>
                    </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="headline">
          <h3><jdf:message code="label_company_display" /></h3>
        </div>
        <div class="row margin-bottom-40">
          <div class="col-md-12  margin-bottom-20">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="type"><span class="red">* </span>
                 <jdf:message code="label_company_main_picture" />：
                  </label>
                <div class="col-sm-8">
                    <input name="mainPicture" type="hidden" id="mainPicture">
                    <div id="mainImg" style="width: 100px;">
                    <c:if test="${entity.objectId!=null&&entity.mainPicture!=null&&entity.mainPicture!='' }">
                        <c:if test="${view!=1}">
                          <a style="float: right;cursor: pointer;" id="mainDelete" data-path="${entity.mainPicture }">删除</a>
                        </c:if>
                          <img alt="" src="${dynamicDomain}${entity.mainPicture}" width="100px" height="100px;">
                    </c:if>
                    </div>
                    <input type="file" name="uploadFile" id="uploadFile1" style="display: inline;">
                    <input type="button" value="裁剪图片" onclick="ajaxFileUpload1();" id="uploadButton1">
                    <input type="button" value="默认上传" onclick="ajaxFileUpload11();" id="uploadButton11">
                    </div>
              </div>
          </div>
          <div class="col-md-12">
              <div class="form-group">
              <input name="subPicture" type="hidden" id="subPicture" value="${subpictureStr }">
                <label class="col-sm-2 control-label" for="type">
                  <jdf:message code="label_company_subpicture" />：
                   </label>
                   <div class="col-sm-10">
                         <span class="detail-picture" id="subImg">
                           <c:forEach items="${subpictures }" var="item" varStatus="status">
                             <div style="width: 100px;display: inline-block;">
                              <c:if test="${view!=1 }">
                                <a style="cursor: pointer;display: block;margin-left: 65px;" class="subDelete" data-path="${item.contentUrl }">删除</a>
                              </c:if>
                               <img alt="" src="${dynamicDomain}${item.contentUrl}" width="100px" height="100px;">
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
        <div class="headline">
          <h3><jdf:message code="label_company_license" /></h3>
        </div>
        <div class="row margin-bottom-40">
          <div class="col-md-12 margin-bottom-5">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="type">
                 <jdf:message code="label_company_business_license" />：
                  </label>
                <div class="col-sm-10">
                    <input name="businessLicence" type="hidden" id="businessLicence">
                    <div id="busImg" style="width: 100px;">
                    <c:if test="${entity.objectId!=null&&entity.businessLicence!=null&&entity.businessLicence!='' }">
                        <c:if test="${view!=1}">
                          <a style="float: right;cursor: pointer;" id="busDelete" data-path="${entity.businessLicence }">删除</a>
                        </c:if>
                          <img alt="" src="${dynamicDomain}${entity.businessLicence}" width="100px" height="100px;">
                    </c:if>
                    </div>
                    <input type="file" name="uploadFile" id="uploadFile4" style="display: inline;">
                    <input type="button" value="上传" onclick="ajaxFileUpload44();" id="uploadButton44">
                    </div>
              </div>
          </div>
          <div class="col-md-12 margin-bottom-5">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="type">
                <jdf:message code="label_tax_registration_certificate" />：
                 </label>
               <div class="col-sm-10">
                   <input name="taxRegistrationCertificate" type="hidden" id="taxRegistrationCertificate">
                   <div id="regImg" style="width: 100px;">
                   <c:if test="${entity.objectId!=null&&entity.taxRegistrationCertificate!=null&&entity.taxRegistrationCertificate!=''}">
                       <c:if test="${view!=1}">
                         <a style="float: right;cursor: pointer;" id="regDelete" data-path="${entity.taxRegistrationCertificate }">删除</a>
                       </c:if>
                         <img alt="" src="${dynamicDomain}${entity.taxRegistrationCertificate}" width="100px" height="100px;">
                   </c:if>
                   </div>
                   <input type="file" name="uploadFile" id="uploadFile5" style="display: inline;">
                   <input type="button" value="上传" onclick="ajaxFileUpload55();" id="uploadButton55">
                   </div>
              </div>
          </div>
          <div class="col-md-12 margin-bottom-5">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="type">
                <jdf:message code="label_organization_code" />：
                 </label>
               <div class="col-sm-10">
                   <input name="organizationRegistrationCode" type="hidden" id="organizationRegistrationCode">
                   <div id="orgImg" style="width: 100px;">
                   <c:if test="${entity.objectId!=null&&entity.organizationRegistrationCode!=null&&entity.organizationRegistrationCode!='' }">
                       <c:if test="${view!=1}">
                         <a style="float: right;cursor: pointer;" id="orgDelete" data-path="${entity.organizationRegistrationCode }">删除</a>
                       </c:if>
                         <img alt="" src="${dynamicDomain}${entity.organizationRegistrationCode}" width="100px" height="100px;">
                   </c:if>
                   </div>
                   <input type="file" name="uploadFile" id="uploadFile6" style="display: inline;">
                   <input type="button" value="上传" onclick="ajaxFileUpload66();" id="uploadButton66">
                   </div>
              </div>
          </div>
          <div class="col-md-12 margin-bottom-5">
          	  <input name="isoPicture" type="hidden" id="isoPicture" value="${isopictureStr }">
              <div class="form-group">
                 <label class="col-sm-2 control-label" for=""><jdf:message code="label_productdetail_qualifications" />：</label>
                 <div class="col-sm-10">
                     <span class="detail-picture" id="ISOImg">
                       <c:forEach items="${ISOpictures }" var="item" varStatus="status">
                         <div style="width: 100px;display: inline-block;">
                          <c:if test="${view!=1 }">
                            <a style="cursor: pointer;display: block;margin-left: 65px;" class="isoDelete" data-path="${item.filePath }">删除</a>
                          </c:if>
                           <img alt="" src="${dynamicDomain}${item.filePath}" width="100px" height="100px;">
                         </div>
                         </c:forEach>
                     </span>
                     <span>
                         <input type="file" name="uploadFile" id="uploadFileCer" style="display: inline;">
                         <input type="button" value="上传" onclick="ajaxFileUploadISO();" id="uploadButtonISO">
                     </span>
                 </div>
              </div>
          </div>
          <input type="hidden" id="status"  name="status" value="${entity.status}">
          <input type="hidden" name="registerWay" value="${entity.registerWay}">
		  <input type="hidden" name="isCheck" value="${entity.isCheck}">
		  <input type="hidden" name="isAllow" value="${entity.isAllow}">
		  <input type="hidden" name="registerDate" value="${entity.registerDate}">
		  <input type="hidden" name="updateDate" value="${entity.updateDate}">
		  <input type="hidden" name="level" value="${entity.level}">
          <div class="margin-bottom-40"></div>
          <c:if test="${message!='common.base.success'}">
	          <div class="col-md-12" style=" text-align:center;">
	            <c:if test="${entity.status==1||entity.status==null}">
	                 <button  type="button" onclick="butSubmit()" class="btn btn-info">
						<span class="glyphicon glyphicon-saved"></span><jdf:message code="common.button.submit"/>
					</button>
	            </c:if>
				<button  type="button" class="btn btn-success"  onclick="saveSubmit()">
					<span class="glyphicon glyphicon-ok"></span><jdf:message code="common.button.save"/>
				</button>
	          </div>
          </c:if>
        </div>
      	</form>
      	</jdf:form>
      </div>
    </div>
</div>
</div>    
<script type="text/javascript">
$(function() {
	$('#editForm').validate();
	$('#modifyCompany').addClass("active");
	<c:if test="${entity.objectId!=null}">
        <c:forEach items="${businessTypeSelect}" var="item" varStatus ="status">
            $('#businessType${item.type}').attr("checked",'checked');
        </c:forEach>
        <c:forEach items="${qualifications}" var="item" varStatus ="status">
	        $('#qualification_${item.type}').attr("checked",'checked');
	        $('#qualificationContent_${item.type}').val("${item.content}");
	    </c:forEach>
    </c:if>
    bindPictureDelete();
});

function butSubmit(obj){
	if($("#logoAddress").val()==''){
        alert('请上传企业logo！');
        return false;
    }
	if($("#mainPicture").val()==''){
        alert('请上传企业主图！');
        return false;
    }
	$("#status").val(2);
	$("#editForm").submit();
}
function saveSubmit(obj){
	if($("#logoAddress").val()==''){
        alert('请上传企业logo！');
        return false;
    }
	if($("#mainPicture").val()==''){
        alert('请上传企业主图！');
        return false;
    }
	$("#editForm").submit();
}


function ajaxFileUpload1() {  
    if($("#uploadFile1").val()==''){
        alert('请选择上传文件');
        return false;
    }
    $.ajaxFileUpload({  
        url: '${dynamicDomain}/admin/companyScreenshot/uploadCompany?ajax=1',  
        secureuri: false,  
        fileElementId: 'uploadFile1',  
        dataType: 'json',  
        success: function(json, status) {
            if(json.result=='true'){
                var filePath = json.filePath;
                var width = json.width;
                var height = json.height;
                var url = '${dynamicDomain}/admin/companyScreenshot/companyCrop?ajax=1&filePath='+filePath+"&width="+width+"&height="+height+"&type=main";
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
        url: '${dynamicDomain}/admin/companyScreenshot/uploadCompany?ajax=1',  
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
            url: '${dynamicDomain}/admin/companyScreenshot/uploadCompany?ajax=1',  
            secureuri: false,  
            fileElementId: 'uploadFile2',  
            dataType: 'json',  
            success: function(json, status) {
                if(json.result=='true'){
                    var filePath = json.filePath;
                    var width = json.width;
                    var height = json.height;
                    var url = '${dynamicDomain}/admin/companyScreenshot/companyCrop?ajax=1&filePath='+filePath+"&width="+width+"&height="+height+"&type=sub";
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
            url: '${dynamicDomain}/admin/companyScreenshot/uploadCompany?ajax=1',  
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
  
  function ajaxFileUpload3() {  
	    if($("#uploadFile3").val()==''){
	        alert('请选择上传文件');
	        return false;
	    }
	    $.ajaxFileUpload({  
	        url: '${dynamicDomain}/admin/companyScreenshot/uploadCompany?ajax=1',  
	        secureuri: false,  
	        fileElementId: 'uploadFile3',  
	        dataType: 'json',  
	        success: function(json, status) {
	            if(json.result=='true'){
	                var filePath = json.filePath;
	                var width = json.width;
	                var height = json.height;
	                var url = '${dynamicDomain}/admin/companyScreenshot/companyCrop?ajax=1&filePath='+filePath+"&width="+width+"&height="+height+"&type=logo";
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

	function ajaxFileUpload33() {  
	    if($("#uploadFile3").val()==''){
	        alert('请选择上传文件');
	        return false;
	    }
	    $.ajaxFileUpload({  
	        url: '${dynamicDomain}/admin/companyScreenshot/uploadCompany?ajax=1',  
	        secureuri: false,  
	        fileElementId: 'uploadFile3',  
	        dataType: 'json',  
	        success: function(json, status) {
	            if(json.result=='true'){
	                var filePath = json.filePath;
	                var img = '<a style="float: right;cursor: pointer;" id="logoDelete" data-path="'+filePath+'">删除</a>'+
	                '<img alt="" src="${dynamicDomain}'+filePath+'" width="100px" height="100px;">';
	                $("#logoAddress").val(filePath);
	                $("#logoImg").html(img);
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
	
	function ajaxFileUpload44() {  
	    if($("#uploadFile4").val()==''){
	        alert('请选择上传文件');
	        return false;
	    }
	    $.ajaxFileUpload({  
	        url: '${dynamicDomain}/admin/companyScreenshot/uploadCompany?ajax=1',  
	        secureuri: false,  
	        fileElementId: 'uploadFile4',  
	        dataType: 'json',  
	        success: function(json, status) {
	            if(json.result=='true'){
	                var filePath = json.filePath;
	                var img = '<a style="float: right;cursor: pointer;" id="busDelete" data-path="'+filePath+'">删除</a>'+
	                '<img alt="" src="${dynamicDomain}'+filePath+'" width="100px" height="100px;">';
	                $("#businessLicence").val(filePath);
	                $("#busImg").html(img);
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
	function ajaxFileUpload55() {  
	    if($("#uploadFile5").val()==''){
	        alert('请选择上传文件');
	        return false;
	    }
	    $.ajaxFileUpload({  
	        url: '${dynamicDomain}/admin/companyScreenshot/uploadCompany?ajax=1',  
	        secureuri: false,  
	        fileElementId: 'uploadFile5',  
	        dataType: 'json',  
	        success: function(json, status) {
	            if(json.result=='true'){
	                var filePath = json.filePath;
	                var img = '<a style="float: right;cursor: pointer;" id="regDelete" data-path="'+filePath+'">删除</a>'+
	                '<img alt="" src="${dynamicDomain}'+filePath+'" width="100px" height="100px;">';
	                $("#taxRegistrationCertificate").val(filePath);
	                $("#regImg").html(img);
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
	function ajaxFileUpload66() {  
	    if($("#uploadFile6").val()==''){
	        alert('请选择上传文件');
	        return false;
	    }
	    $.ajaxFileUpload({  
	        url: '${dynamicDomain}/admin/companyScreenshot/uploadCompany?ajax=1',  
	        secureuri: false,  
	        fileElementId: 'uploadFile6',  
	        dataType: 'json',  
	        success: function(json, status) {
	            if(json.result=='true'){
	                var filePath = json.filePath;
	                var img = '<a style="float: right;cursor: pointer;" id="orgDelete" data-path="'+filePath+'">删除</a>'+
	                '<img alt="" src="${dynamicDomain}'+filePath+'" width="100px" height="100px;">';
	                $("#organizationRegistrationCode").val(filePath);
	                $("#orgImg").html(img);
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
  
	function ajaxFileUploadISO() { 
      if($("#uploadFileCer").val()==''){
          alert('请选择上传文件');
          return false;
      }
        var isoPicture = $('#isoPicture').val();
        var array = new Array();
        array = isoPicture.split(",");
        if(array.length>=10){
            alert("细节图片不能大于10张");
            return false;
        }
        $.ajaxFileUpload({  
            url: '${dynamicDomain}/admin/companyScreenshot/uploadCompany?ajax=1',  
            secureuri: false,  
            fileElementId: 'uploadFileCer',  
            dataType: 'json',  
            success: function(json, status) {
                if(json.result=='true'){
                    var filePath = json.filePath;
                    var img = '<div style="width: 100px;display: inline-block;">'+
                    '<a style="cursor: pointer;display: block;margin-left: 65px;" class="subDelete" data-path="'+filePath+'">删除</a>'+
                    '<img alt="" src="${dynamicDomain}'+filePath+'" width="100px" height="100px;"></div>';
                    var subPath = $("#isoPicture").val();
                    if(subPath==''){
                        $("#isoPicture").val(filePath);
                    }else{
                        $("#isoPicture").val(subPath+','+filePath);
                    }
                    $("#ISOImg").append(img);
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
              url:"${dynamicDomain}/admin/companyScreenshot/deleteCompany",
              type : 'post',
              dataType : 'json',
              data:{'filePath':mainPicture},
              success : function(json) {
                      obj.parent().html('');
                       $('#mainPicture').val('');
              }
          });
          
      });
      //logo删除
      $('#logoDelete').click(function(){
          var logoAddress = $(this).data('path');
          var obj = $(this);
          $.ajax({
              url:"${dynamicDomain}/admin/companyScreenshot/deleteCompany",
              type : 'post',
              dataType : 'json',
              data:{'filePath':logoAddress},
              success : function(json) {
                      obj.parent().html('');
                       $('#logoAddress').val('');
              }
          });
          
      });
      //营业执照删除
      $('#busDelete').click(function(){
          var businessLicence = $(this).data('path');
          var obj = $(this);
          $.ajax({
              url:"${dynamicDomain}/admin/companyScreenshot/deleteCompany",
              type : 'post',
              dataType : 'json',
              data:{'filePath':businessLicence},
              success : function(json) {
                      obj.parent().html('');
                       $('#businessLicence').val('');
              }
          });
          
      });
      //税务登记证删除
      $('#regDelete').click(function(){
          var taxRegistrationCertificate = $(this).data('path');
          var obj = $(this);
          $.ajax({
              url:"${dynamicDomain}/admin/companyScreenshot/deleteCompany",
              type : 'post',
              dataType : 'json',
              data:{'filePath':taxRegistrationCertificate},
              success : function(json) {
                      obj.parent().html('');
                       $('#taxRegistrationCertificate').val('');
              }
          });
          
      });
      //组织机构代码删除
      $('#orgDelete').click(function(){
          var organizationRegistrationCode = $(this).data('path');
          var obj = $(this);
          $.ajax({
              url:"${dynamicDomain}/admin/companyScreenshot/deleteCompany",
              type : 'post',
              dataType : 'json',
              data:{'filePath':organizationRegistrationCode},
              success : function(json) {
                      obj.parent().html('');
                       $('#organizationRegistrationCode').val('');
              }
          });
          
      });
      //子图删除
      $('.subDelete').click(function(){
          var subPicture = $(this).data('path');
          var obj = $(this);
          $.ajax({
              url:"${dynamicDomain}/admin/companyScreenshot/deleteCompany",
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
      
     //资质删除
      $('.isoDelete').click(function(){
          var subPicture = $(this).data('path');
          var obj = $(this);
          $.ajax({
              url:"${dynamicDomain}/admin/companyScreenshot/deleteCompany",
              type : 'post',
              dataType : 'json',
              data:{'filePath':subPicture},
              success : function(json) {
                      obj.parent().remove();
                      //更新子图路径
                      var paths = '';
                      $('.isoDelete').each(function(){
                          var path = $(this).data('path');
                          if(paths==''){
                              paths = path;
                          }else{
                              paths = paths+','+path;
                          }
                      });
                      $('#isoPicture').val(paths);
              }
          });
      });
  }
</script>	
</body>
</html>