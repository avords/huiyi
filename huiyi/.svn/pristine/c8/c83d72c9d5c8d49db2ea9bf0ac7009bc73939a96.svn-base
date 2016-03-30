<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<jdf:themeFile file="ckeditor/ckeditor.js" />
<jdf:themeFile file="ckeditor/config.js" />
<jdf:themeFile file="ajaxfileupload.js" />
<title>企业信息查看</title>
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
</style>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-pencil"></span>企业信息查看
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
										<select class="form-control" disabled="disabled" name="isSupplier" >
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
										<select class="form-control" disabled="disabled" name="numEmployees" >
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
									<input type="email" class="form-control" readonly="readonly" id="email" name="email" value="${entity.email }">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="telphone" class="col-sm-3 control-label">联系手机:</label>
								<div class="col-sm-7">
									<input type="tel" maxlength="11" class="form-control" readonly="readonly" id="telphone" name="telphone" value="${entity.telphone }">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="" class="col-sm-3 control-label">公司传真:</label>
								<div class="col-sm-2">
									<input type="tel" class="form-control" id="faxAreaCode" readonly="readonly" name="faxAreaCode" placeholder="区号" value="${entity.faxAreaCode }">
								</div>
								<div class="col-sm-5">
									<input type="tel" class="form-control" readonly="readonly" id="fax" name="fax" value="${entity.fax }">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="" class="col-sm-3 control-label">公司电话:</label>
								<div class="col-sm-2">
									<input type="tel" class="form-control" id="phoneAreaCode" readonly="readonly" name="phoneAreaCode" placeholder="区号" value="${entity.phoneAreaCode }">
								</div>
								<div class="col-sm-5">
									<input type="tel" class="form-control" readonly="readonly" id="phone" name="phone" value="${entity.phone }">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
								<div class="form-group">
									<label for="registCapital" class="col-sm-3 control-label">注册资本:</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" readonly="readonly" id="registCapital" name="registCapital" value="${entity.registCapital }">
									</div>
								</div>
							</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="registNumber" class="col-sm-3 control-label">工商注册号:</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" id="registNumber" readonly="readonly" name="registNumber" value="${entity.registNumber }">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
                                <div class="form-group">
                                     <label for="foundingDate"  class="col-sm-3 control-label">成立时间:</label>
                                    <div class="col-sm-7">
                                        <input type="text" class="form-control" id="foundingDate" readonly="readonly" name="foundingDate" class="Wdate"
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})">
                                    </div>
                                </div>
                            </div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="website" class="col-sm-3 control-label">企业网址:</label>
									<div class="col-sm-7">
										<input type="url" class="form-control" readonly="readonly" id="website" name="website" value="${entity.website }">
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
                                        <img alt="" src="${dynamicDomain}${entity.logoAddress}" width="100px" height="100px;">
                                    </c:if>
                                    </div>
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
									 <select class="form-control" name="countryId" disabled="disabled">
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
													<input type="text" class="form-control" readonly="readonly" id="nameZh" name="nameZh">
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-12 col-md-12">
											<div class="form-group">
												<label for="addressZh" class="col-sm-2 control-label">详细地址:</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" readonly="readonly" id="addressZh" name="addressZh">
													</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-12 col-md-12">
											<div class="form-group">
												<label for="descriptionZh" class="col-sm-2 control-label">企业描述:</label>
												<div class="col-sm-10">
					                                    <textarea name="descriptionZh" disabled="disabled" id="txtZh"  rows="500"></textarea> 
					                                </div>
					                                <script type="text/javascript">
					                                    CKEDITOR.replace( 'txtZh', {
					                                          language : 'zh-cn',
					                                          width:'100%', 
					                                          height:200,
					                                          toolbarLocation:'top',
					                                          toolbarStartupExpanded :true,
					                                          toolbar: [
					                                                        ['Source','-','Save','NewPage','Preview','-','Templates'],
					                                                        ['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print', 'SpellChecker', 'Scayt'],
					                                                        ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
					                                                        ['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'],
					                                                        '/',
					                                                        ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
					                                                        ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
					                                                        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
					                                                        ['Link','Unlink','Anchor'],
					                                                        ['Image','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
					                                                        '/',
					                                                        ['Styles','Format','Font','FontSize'],
					                                                        ['TextColor','BGColor']
					                                                ],
					                                          filebrowserUploadUrl : '<%=request.getContextPath()%>/connector/upload?ajax=1',   
					                                          filebrowserImageUploadUrl : '<%=request.getContextPath()%>/connector/upload?ajax=1',   
					                                          filebrowserFlashUploadUrl : '<%=request.getContextPath()%>/connector/upload?ajax=1'  
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
														<textarea class="form-control" disabled="disabled" placeholder="用英文逗号（，）隔开!" style="resize:none;" cols="200" rows="4" id="mainProductsZh" name="mainProductsZh"></textarea>
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
													<input type="text" readonly="readonly" class="form-control" id="nameEn" name="nameEn">
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-12 col-md-12">
											<div class="form-group">
												<label for="addressEn" class="col-sm-2 control-label">Detail Address:</label>
													<div class="col-sm-10">
														<input type="text" readonly="readonly" class="form-control" id="addressEn" name="addressEn">
													</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-12 col-md-12">
											<div class="form-group">
												<label for="descriptionEn" class="col-sm-2 control-label">Description:</label>
												<div class="col-sm-10">
					                                    <textarea disabled="disabled" name="descriptionEn" id="txtEn"  rows="500"></textarea> 
					                                </div>
					                                <script type="text/javascript">
					                                    CKEDITOR.replace( 'txtEn', {
					                                          language : 'zh-cn',
					                                          width:'100%', 
					                                          height:200,
					                                          toolbarLocation:'top',
					                                          toolbarStartupExpanded :true,
					                                          toolbar: [
					                                                        ['Source','-','Save','NewPage','Preview','-','Templates'],
					                                                        ['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print', 'SpellChecker', 'Scayt'],
					                                                        ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
					                                                        ['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'],
					                                                        '/',
					                                                        ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
					                                                        ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
					                                                        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
					                                                        ['Link','Unlink','Anchor'],
					                                                        ['Image','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
					                                                        '/',
					                                                        ['Styles','Format','Font','FontSize'],
					                                                        ['TextColor','BGColor']
					                                                ],
					                                          filebrowserUploadUrl : '<%=request.getContextPath()%>/connector/upload?ajax=1',   
					                                          filebrowserImageUploadUrl : '<%=request.getContextPath()%>/connector/upload?ajax=1',   
					                                          filebrowserFlashUploadUrl : '<%=request.getContextPath()%>/connector/upload?ajax=1'  
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
														<textarea class="form-control" disabled="disabled" placeholder="Separated by a comma (,) in english!" style="resize:none;" cols="200" rows="4" id="mainProductsEn" name="mainProductsEn"></textarea>
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
                                          <img alt="" src="${dynamicDomain}${entity.mainPicture}" width="100px" height="100px;">
                                    </c:if>
                                    </div>
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
                                              <img alt="" src="${dynamicDomain}${item.contentUrl}" width="100px" height="100px;">
                                            </div>
                                            </c:forEach>
                                        </span>
                                        <span>
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
                                          <img alt="" src="${dynamicDomain}${entity.businessLicence}" width="100px" height="100px;">
                                    </c:if>
                                    </div>
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
                                          <img alt="" src="${dynamicDomain}${entity.taxRegistrationCertificate}" width="100px" height="100px;">
                                    </c:if>
                                    </div>
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
                                          <img alt="" src="${dynamicDomain}${entity.organizationRegistrationCode}" width="100px" height="100px;">
                                    </c:if>
                                    </div>
                                    </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-sm-9 col-md-9">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="paymentWay"><jdf:message code="资质:" /></label>
                                <div class="col-sm-6">
                                    <c:forEach items="${qualificationDic }" var="item" varStatus="status">
                                        <div class="row" style="margin-top: 10px;">
                                            <span style="width:20%;display: inline-block;;">
                                                <jdf:message code="${item.name }" />
                                            </span>
                                            <input style="width:75%;" type="text" readonly="readonly" id="qualificationContent_${item.value }" name="qualificationContent_${item.value }" placeholder="证照编码" maxlength="40">
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
				<input type="hidden" id="status"  name="status" value="${entity.status}">
				</form>
			</jdf:form>
		</div>
	</div>
	<jdf:bootstrapDomainValidate domain="Company" />
<script type="text/javascript">
$(function() {
	parent.reloadParent= false;
	<c:if test="${entity.objectId!=null}">
        <c:forEach items="${businessTypeSelect}" var="item" varStatus ="status">
            $('#businessType${item.type}').attr("checked",'checked');
        </c:forEach>
        <c:forEach items="${qualifications}" var="item" varStatus ="status">
	        $('#qualificationContent_${item.type}').val("${item.content}");
	    </c:forEach>
    </c:if>
});
</script>	
</body>