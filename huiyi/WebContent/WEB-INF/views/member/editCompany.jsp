<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<jdf:themeFile file="ckeditor/ckeditor.js" />
<jdf:themeFile file="ckeditor/config.js" />
<jdf:themeFile file="ajaxfileupload.js" />
<jdf:themeFile file="kindeditor/kindeditor.js" />
<jdf:themeFile file="kindeditor/lang/zh_CN.js" />
<title>企业信息修改</title>
<style type="text/css">
	.Wdate{
	width:265px;
	}
	.buyer{
	font-family: 'Arial Negreta','Arial';
	font-weight: 700;
	font-style: normal;
	font-size: 16px;
	margin-bottom:10px;
	color: #333;
	text-align: left;
	line-height: normal;
	}
	input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
    -webkit-appearance: none !important;
    margin: 0;
    }
</style>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-pencil"></span>企业信息修改
			<div class="pull-right" id="cd">
				 <a  href="${dynamicDomain}/admin/company/page"  class="btn btn-primary">
           			<span class="glyphicon glyphicon-th-list"></span><jdf:message code="返回列表"/>
           		 </a>
			</div>
		</div>
		<div class="panel-content">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/admin/company/save?ajax=1" class="form-horizontal" id="editForm" enctype="multipart/form-data">
						<input type="hidden" name="objectId">
						<div class="span12 alert alert-info" id="messageBox">
							${message=="success"?"操作成功":""}
						</div><br>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="isSupplier" class="col-sm-3 control-label">是否供应商:</label>
									<div class="col-sm-7">
										<select class="form-control" name="isSupplier" >
											<option value="">请选择</option>
												<jdf:select dictionaryId="109" />
										</select>
									</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="numEmployees" class="col-sm-3 control-label">企业规模:</label>
									<div class="col-sm-7">
										<select class="form-control" name="numEmployees" >
											<option value="">请选择</option>
												<jdf:select dictionaryId="1011" />
										</select>
									</div>
							</div>
						</div>
					</div>	
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="email" class="col-sm-3 control-label">联系邮箱:</label>
								<div class="col-sm-7">
									<input type="email" class="form-control" maxlength="128" id="email" name="email" value="${entity.email }">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="telphone" class="col-sm-3 control-label">联系手机:</label>
								<div class="col-sm-7">
									<input type="tel" maxlength="11" class="form-control" id="telphone" name="telphone" value="${entity.telphone }">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="" class="col-sm-3 control-label">公司传真:</label>
								<div class="col-sm-2">
									<input type="tel" class="form-control" id="faxAreaCode" name="faxAreaCode" placeholder="区号" value="${entity.faxAreaCode }">
								</div>
								<div class="col-sm-5">
									<input type="tel" class="form-control" id="fax" name="fax" value="${entity.fax }">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="" class="col-sm-3 control-label">公司电话:</label>
								<div class="col-sm-2">
									<input type="tel" class="form-control" id="phoneAreaCode" name="phoneAreaCode" placeholder="区号" value="${entity.phoneAreaCode }">
								</div>
								<div class="col-sm-5">
									<input type="tel" class="form-control" id="phone" name="phone" value="${entity.phone }">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
								<div class="form-group">
									<label for="registCapital" class="col-sm-3 control-label">注册资本:</label>
									<div class="col-sm-7">
										<input type="number" class="form-control" id="registCapital" name="registCapital">
									</div>
								</div>
							</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="registNumber" class="col-sm-3 control-label">工商注册号:</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" id="registNumber" maxlength="64" name="registNumber">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
                                <div class="form-group">
                                     <label for="foundingDate"  class="col-sm-3 control-label">成立时间:</label>
                                    <div class="col-sm-7">
                                        <input type="text" class="form-control" id="foundingDate" name="foundingDate" class="Wdate" 
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})">
                                    </div>
                                </div>
                            </div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="website" class="col-sm-3 control-label">企业网址:</label>
									<div class="col-sm-7">
										<input type="url" class="form-control" id="website" maxlength="64" name="website" value="${entity.website }">
									</div>
							</div>
						</div>
					</div>
					 <div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="type">企业logo:</label>
                                <div class="col-sm-9">
                                    <input name="logoAddress" type="hidden" id="logoAddress">
                                    <div id="logoImg" style="width: 100px;">
                                    <c:if test="${entity.objectId!=null&&entity.logoAddress!=null&&entity.logoAddress!='' }">
                                        <c:if test="${view!=1}">
                                          <a style="float: right;cursor: pointer;" id="logoDelete" data-path="${entity.logoAddress }">删除</a>
                                        </c:if>
                                        <img alt="" src="${dynamicDomain}${entity.logoAddress}" width="100px" height="100px;">
                                    </c:if>
                                    </div>
                                    <input type="file" name="uploadFile" id="uploadFile3" style="display: inline;">
                                    <input type="button" value="裁剪图片" onclick="ajaxFileUpload3();" id="uploadButton3">
                                    <input type="button" value="默认上传" onclick="ajaxFileUpload33();" id="uploadButton33">
                                    </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="businessType" class="col-sm-3 control-label">商业类型:</label>
									<div class="col-sm-9">
		                                  <huiyi:checkBox dictionaryId="1013" name="businessType"/>
									</div>
							</div>
						</div> 
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="countryId" class="col-sm-3 control-label">国&nbsp;&nbsp;家:</label>
								<div class="col-sm-7">
									 <select class="form-control" name="countryId">
                                           <option value="">全部</option>
                                           <jdf:selectCollection items="countries" optionValue="objectId" optionText="nameZh" />
                                    </select>
								</div>
							</div>
						</div> 
					</div>
				 
				  <div class="row" style="margin-left: 40px">
					 <div class="col-sm-12 col-md-12">
						<div class="tabbable">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#editZh" data-toggle="tab">中文</a></li>
								<li><a href="#editEn" data-toggle="tab">英文</a></li>
							</ul>
						 	<div class="tab-content">
								<div class="tab-pane active" id="editZh">
									<div class="row">
										<div class="col-sm-12 col-md-12">
											<div class="form-group">
												<label for="nameZh" class="col-sm-2 control-label">企业名称:</label>
												<div class="col-sm-10">
													<input type="text" class="form-control" maxlength="32" id="nameZh" name="nameZh">
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-12 col-md-12">
											<div class="form-group">
												<label for="addressZh" class="col-sm-2 control-label">详细地址:</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" maxlength="64" id="addressZh" name="addressZh">
													</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-12 col-md-12">
											<div class="form-group">
												<label for="descriptionZh" class="col-sm-2 control-label">企业描述:</label>
												<div class="col-sm-10">
					                                    <textarea name="descriptionZh" id="descriptionZh"  rows="500"></textarea> 
					                                </div>
					                                <script type="text/javascript">
						                                KindEditor.ready(function(K) {
						                                    descriptionZh = K.create('#descriptionZh',{
						                                         uploadJson : '${dynamicDomain}/connector/kindUpload?ajax=1',
						                                         afterBlur: function(){this.sync();},
						                                         allowFileManager : true,
						                                         width:790,
						                                         height:300,
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
					                                </script>
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-sm-12 col-md-12">
											<div class="form-group">
												<label for="mainProductsZh" class="col-sm-2 control-label">主营产品:</label>
													<div class="col-sm-10">
														<textarea class="form-control" placeholder="请输入关键字，关键字用英文“,”隔开" style="resize:none;" maxlength="64" rows="3" id="mainProductsZh" name="mainProductsZh"></textarea>
													</div>
											</div>
										</div>
									</div>
								</div>
								
								<div id="editEn" class="tab-pane">
									<div class="row">
										<div class="col-sm-12 col-md-12">
											<div class="form-group">
												<label for="nameEn" class="col-sm-2 control-label">Company Name:</label>
												<div class="col-sm-10">
													<input type="text" class="form-control" maxlength="64" id="nameEn" name="nameEn">
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-12 col-md-12">
											<div class="form-group">
												<label for="addressEn" class="col-sm-2 control-label">Detail Address:</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" maxlength="128" id="addressEn" name="addressEn">
													</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-12 col-md-12">
											<div class="form-group">
												<label for="descriptionEn" class="col-sm-2 control-label">Description:</label>
												<div class="col-sm-10">
					                                    <textarea name="descriptionEn" id="descriptionEn"  rows="500"></textarea> 
					                                </div>
					                                <script type="text/javascript">
						                                KindEditor.ready(function(K) {
						                                    descriptionEn = K.create('#descriptionEn',{
						                                         uploadJson : '${dynamicDomain}/connector/kindUpload?ajax=1',
						                                         afterBlur: function(){this.sync();},
						                                         allowFileManager : true,
						                                         width:790,
						                                         height:300,
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
					                                </script>
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-sm-12 col-md-12">
											<div class="form-group">
												<label for="mainProductsEn" class="col-sm-2 control-label">Main Products:</label>
													<div class="col-sm-10">
														<textarea class="form-control" maxlength="128" placeholder="Please input the keywords,separated by a comma “,” in english!" style="resize:none;" rows="3" id="mainProductsEn" name="mainProductsEn"></textarea>
													</div>
											</div>
										</div>
									</div>
								</div>	
		    				</div>
						</div>
					</div>
				</div><hr style="border:none;border-top:1px dashed #0066CC;">
				<div class="buyer">
					<span>企业展示</span>
				</div>
	            <div class="row">
                        <div class="col-sm-9 col-md-9">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="type">
                                 <jdf:message code="主图 " />
                                  </label>
                                <div class="col-sm-10">
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
                    </div>
                     <div class="row">
                        <div class="col-sm-9 col-md-9">
                        <input name="subPicture" type="hidden" id="subPicture" value="${subpictureStr }">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="type">
                                 <jdf:message code="细节图 " />
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
	            <hr style="border:none;border-top:1px dashed #0066CC;">    
	            <div class="buyer">
					<span>企业证照</span>
				</div>
				<div class="row">
                        <div class="col-sm-9 col-md-9">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="type">
                                 <jdf:message code="营业执照:" />
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
                    </div>
                   <div class="row">
                        <div class="col-sm-9 col-md-9">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="type">
                                 <jdf:message code="税务登记证:" />
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
                    </div>
                    <div class="row">
                        <div class="col-sm-9 col-md-9">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="type">
                                 <jdf:message code="组织机构代码:" />
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
                    </div>
                    
                    <div class="row">
                        <div class="col-sm-9 col-md-9">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for=""><jdf:message code="资质:" /></label>
                                <div class="col-sm-6">
                                	<c:if test="${entity.objectId!=null}">
                                		<c:forEach items="${companyCertificateFiles }" var="item" varStatus="status">
                                        <div class="row" style="margin-top: 10px;">
                                        	<img alt="" src="${dynamicDomain}${item.filePath}" width="120px" height="120px;">
                                        </div>
                                    </c:forEach>
                                	</c:if>
                                    <c:forEach items="${qualificationDic }" var="item" varStatus="status">
                                        <div class="row" style="margin-top: 10px;">
                                            <span style="width:20%;display: inline-block;;">
                                                <input type="checkbox" id="qualification_${item.value }" name="qualification" value="${item.value }"><jdf:message code="${item.name }" />
                                            </span>
                                            <input style="width:75%;" type="text" id="qualificationContent_${item.value }" name="qualificationContent_${item.value }" placeholder="证照编码" maxlength="40">
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="status" id="status" value="${entity.status}">
					<input type="hidden" name="registerWay" value="${entity.registerWay}">
					<input type="hidden" name="isCheck" value="${entity.isCheck}">
					<input type="hidden" name="isAllow" value="${entity.isAllow}">
					<input type="hidden" name="registerDate" value="${entity.registerDate}">
					<input type="hidden" name="updateDate" value="${entity.updateDate}">
					<input type="hidden" name="level" value="${entity.level}">
					<c:if test="${message!='success'}">
	                  <div class="row">
							<div class="col-sm-12 col-md-12">
								<div class="pull-right">
								<c:if test="${entity.status==1||entity.status==null}">
		                                    <button  type="button" onclick="butSubmit()" class="btn btn-info">
												<span class="glyphicon glyphicon-saved"></span>提交
											</button>
		                        </c:if>
									<button  type="button" class="btn btn-success"  onclick="saveSubmit()">
										<span class="glyphicon glyphicon-ok"></span><jdf:message code="common.button.save"/>
									</button>
								</div>
							</div>
						</div>
					</c:if>
				</form>
			</jdf:form>
		</div>
	</div>
	<jdf:bootstrapDomainValidate domain="Company" />
<script type="text/javascript">
$(function() {
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

function butSubmit(){
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
function saveSubmit(){
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
  }
</script>	
</body>
</html>