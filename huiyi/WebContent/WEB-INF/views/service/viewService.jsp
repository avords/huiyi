<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<jdf:themeFile file="css/select2.css" />
<jdf:themeFile file="select2.js"/>
<jdf:themeFile file="ckeditor/ckeditor.js" />
<jdf:themeFile file="ckeditor/config.js" />
<jdf:themeFile file="ajaxfileupload.js" />
<title><jdf:message code="服务管理"/></title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="menu-icon glyphicon glyphicon-align-left icon-white"></span>
			<jdf:message code="服务管理"/>
		</div>
		<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/admin/service/save" class="form-horizontal" id="editForm" enctype="multipart/form-data">
					<input type="hidden" name="objectId">
					<input type="hidden" name="status" value="1" id="status">
					<div class="col-sm-12 alert alert-info" id="messageBox">
						${message}
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="beginDate" class="col-sm-3 control-label">有效期: 起</label>
								<div class="col-sm-8">
									<div class="input-append date" id="beginDate">
										<input class="input-medium" disabled="disabled" size="14" type="text"name="beginDate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" style="width: 100% ;">
										<span class="add-on"><i class="icon-calendar"></i></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="endDate" class="col-sm-2 control-label">至</label>
								<div class="col-sm-8">
									<div class="input-append date" id="endDate">
										<input class="input-medium" disabled="disabled" size="14" type="text"name="endDate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" style="width: 100% ;">
										<span class="add-on"><i class="icon-calendar"></i></span>
									</div>
								</div>
							</div>
						</div>
					</div>	
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="type" class="col-sm-3 control-label">服务种类</label>
								<div class="col-sm-8">
									<select class="form-control" name="type" disabled="disabled">
										<option value="">请选择</option>
										<jdf:select dictionaryId="1304" />
									</select>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="priority">
                                 <jdf:message code="优先级 " />
                                  </label>
                                <div class="col-sm-8">
                                    <input type="text" readonly="readonly" class="form-control" name="priority" id="priority">
                                </div>
                            </div>
                        </div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
                            <label class="col-sm-3 control-label" for="priority">
                                 <jdf:message code="服务分类 " />
                            </label>
                                <div class="col-sm-8">
								<c:forEach items="${serviceCategorys}" var="item">
									<c:if test="${item.selected==true}">
										<input type="checkbox" disabled="disabled" name="categorys" checked="checked" value="${item.objectId}" />${item.nameZh}
		                      	    </c:if>
		                      	    <c:if test="${item.selected!=true}">
										<input type="checkbox" disabled="disabled" name="categorys" value="${item.objectId}" />${item.nameZh}
		                      	    </c:if>
								</c:forEach>
								</div>
						   </div>
                        </div>
					</div>
					<div class="row">
                            <div class="col-sm-6 col-md-6">
                                <div class="form-group">
                                    <label for="image"  class="col-sm-3 control-label">主图</label>
                                    <div class="col-sm-8">
                                    <input name="image" type="hidden" id="image">
                                    <div id="mainImg" style="width:200px;">
                                    <c:if test="${entity.objectId != null&& entity.mainPicture!=null }">
                                          <img id="preview" alt="" src="${dynamicDomain}${entity.mainPicture}" width="200px">
                                    </c:if>
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
					<div class="row">
                        <div class="col-sm-12 col-md-12">
                            <div class="tabbable">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#editZh" data-toggle="tab">中文</a></li>
                                    <li><a href="#editEn" data-toggle="tab">English</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="editZh">
                                        <div class="row">
                                            <div class="col-sm-12 col-md-12">
                                                <div class="form-group">
                                                    <label for="nameZh" class="col-sm-2 control-label"><jdf:message code="服务名称" /></label>
                                                    <div class="col-sm-10">
                                                        <input type="text" readonly="readonly" class="form-control" id="nameZh" name="nameZh">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                        	<div class="col-sm-12 col-md-12">
                                                <div class="form-group">
                                                    <label for="summaryZh" class="col-sm-2 control-label">
                                                        <jdf:message code="服务简介" />
                                                    </label>
                                                    <div class="col-sm-10">
                                                        <textarea class="form-control" readonly="readonly" id="summaryZh" name="summaryZh" rows="5" cols=""></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>    
                                        <div class="row">
					                        <div class="col-sm-12 col-md-12">
					                            <div class="form-group">
					                                <label for="detailZh" class="col-sm-2 control-label">
                                                        <jdf:message code="服务详情" />
                                                    </label>
					                                <div class="col-sm-10">
					                                    <textarea name="detailZh" id="txtZh" disabled="disabled" rows="500"></textarea> 
					                                </div>
					                                <script type="text/javascript">
					                                    CKEDITOR.replace( 'txtZh', {
					                                          language : 'zh-cn',
					                                          width:'100%', 
					                                          height:400,
					                                          toolbarLocation:'top',
					                                          toolbarStartupExpanded :true,
					                                          toolbar: [
					                                                        ['Source','-','NewPage','Preview','-','Templates'],
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
                                                    <label for="nameEn" class="col-sm-2 control-label"><jdf:message code="Service Name" /></label>
                                                    <div class="col-sm-10">
                                                        <input type="text" readonly="readonly" class="form-control" id="nameEn" name="nameEn">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                        	<div class="col-sm-12 col-md-12">
                                                <div class="form-group">
                                                    <label for="summaryEn" class="col-sm-2 control-label">
                                                        <jdf:message code="Service Summary" />
                                                    </label>
                                                    <div class="col-sm-10">
                                                        <textarea class="form-control" readonly="readonly" id="summaryEn" name="summaryEn" rows="5" cols=""></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>    
                                        <div class="row">
                                            <div class="col-sm-12 col-md-12">
                                                <div class="form-group">
                                                    <label for="detailEn" class="col-sm-2 control-label">
                                                        <jdf:message code="Service Description" />
                                                    </label>
                                                    <div class="col-sm-10">
                                                        <textarea name="detailEn" disabled="disabled" id="txtEn"  rows="500"></textarea> 
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
				</form>
			</jdf:form>
		</div>
	</div>
</body>