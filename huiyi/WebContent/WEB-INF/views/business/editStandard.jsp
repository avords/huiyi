<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>

<jdf:themeFile file="css/select2.css" />
<jdf:themeFile file="select2.js"/>
<jdf:themeFile file="ckeditor/ckeditor.js" />
<jdf:themeFile file="ckeditor/config.js" />
<jdf:themeFile file="ajaxfileupload.js" />

<title>标准管理</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span> 标准管理
		</div>
		<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/admin/standard/save" class="form-horizontal" id="editForm">
					<input type="hidden" name="objectId">
					<div class="col-sm-12 alert alert-info" id="messageBox">${message}</div>

					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="status" class="col-sm-3 control-label">状态</label>
								<div class="col-sm-8">
									<select class="form-control {required:true}" name="status" id="status">
										<option value=""></option>
										<jdf:select dictionaryId="111" />
									</select>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
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
													<label for="nameZh" class="col-sm-2 control-label">标准名称</label>
													<div class="col-sm-10">
														<input type="text" class="form-control {required:true,maxlength : 64}" id="nameZh" name="nameZh">
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12 col-md-12">
												<div class="form-group">
													<label for="detailZh" class="col-sm-2 control-label">标准详情 </label>
													<div class="col-sm-10">
														<textarea name="detailZh" id="txtZh" rows="500"></textarea>
													</div>
													<script type="text/javascript">
					                                    CKEDITOR.replace( 'txtZh', {
					                                          language : 'zh-cn',
					                                          width:'100%', 
					                                          height:400,
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
									</div>

									<div id="editEn" class="tab-pane">
										<div class="row">
											<div class="col-sm-12 col-md-12">
												<div class="form-group">
													<label for="nameEn" class="col-sm-2 control-label">英文名称</label>
													<div class="col-sm-10">
														<input type="text" class="form-control {required:true,maxlength : 128}" id="nameEn" name="nameEn">
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12 col-md-12">
												<div class="form-group">
													<label for="detailEn" class="col-sm-2 control-label">英文详情 </label>
													<div class="col-sm-10">
														<textarea name="detailEn" id="txtEn" rows="500"></textarea>
													</div>
													<script type="text/javascript">
                                                        CKEDITOR.replace( 'txtEn', {
                                                              language : 'zh-cn',
                                                              width:'100%', 
                                                              height:400,
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
									</div>

								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-12 col-md-6">
							<div class="pull-right">
								<button type="submit" class="btn btn-primary" id="submitBtn">
									<span class="glyphicon glyphicon-ok"></span>
									<jdf:message code="common.button.save" />
								</button>
								<c:if test="${not empty message}">
									<button type="button" class="btn btn-primary" onclick="toUrl('${dynamicDomain}/admin/standard/page')">
										<span class="glyphicon glyphicon-chevron-left"></span>
										<jdf:message code="返回" />
									</button>
								</c:if>
							</div>
						</div>
					</div>

				</form>
			</jdf:form>
		</div>
	</div>
	<jdf:bootstrapDomainValidate domain="Standard" />
</body>