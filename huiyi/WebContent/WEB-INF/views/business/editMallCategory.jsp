<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<jdf:themeFile file="ajaxfileupload.js" />
<title>前台产品分类管理</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-th"></span> 前台产品分类管理
		</div>
		<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/admin/mallCategory/save?ajax=1" class="form-horizontal" id="editForm">
					<input type="hidden" name="objectId">
					<div class="col-sm-12 alert alert-info" id="messageBox">${message}</div>
					<div class="row">
					  	<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="image" class="col-sm-3 control-label">图片</label>
								<div class="col-sm-8">
									<input type="hidden" name="image" id="image" class="required">
									<c:choose>
										<c:when test="${not empty  entity.image}">
											<img id="imageTag" src="${dynamicDomain}${entity.image}" width="110" height="110">
										</c:when>
										<c:otherwise>
											<img id="imageTag" src="" width="110" height="110">
										</c:otherwise>
									</c:choose>
									<input type="file" name="uploadFile" id="uploadFile1" style="display: inline;">
                                    <input type="button" value="裁剪图片" onclick="ajaxFileUpload1();" id="uploadButton1">
                                    <input type="button" value="默认上传" onclick="ajaxFileUpload11();" id="uploadButton11">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="sortNo" class="col-sm-3 control-label">顺序</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="sortNo" name="sortNo">
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
													<label for="nameZh" class="col-sm-2 control-label">名称</label>
													<div class="col-sm-10">
														<input type="text" class="form-control {required:true,maxlength : 64}" id="nameZh" name="nameZh">
													</div>
												</div>
											</div>
										</div>
									</div>

									<div id="editEn" class="tab-pane">
										<div class="row">
											<div class="col-sm-12 col-md-12">
												<div class="form-group">
													<label for="nameEn" class="col-sm-2 control-label">名称</label>
													<div class="col-sm-10">
														<input type="text" class="form-control {required:true,maxlength : 128}" id="nameEn" name="nameEn">
													</div>
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
									<button type="button" class="btn btn-primary" onclick="toUrl('${dynamicDomain}/admin/mallCategory/page')">
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
	<jdf:bootstrapDomainValidate domain="MallCategory" />
	<script type="text/javascript">
	var cropWidth = 110;
	var cropHeight = 110;
	
	function ajaxFileUpload1() {  
        if($("#uploadFile1").val()==''){
            alert('请选择上传文件');
            return false;
        }
        $.ajaxFileUpload({  
            url: '${dynamicDomain}/admin/screenshot/uploadImage?ajax=1',  
            secureuri: false,  
            fileElementId: 'uploadFile1',  
            dataType: 'json',  
            success: function(json, status) {
                if(json.result=='true'){
                    var filePath = json.filePath;
                    var width = json.width;
                    var height = json.height;
                    var url = '${dynamicDomain}/admin/screenshot/imageCrop?ajax=1&filePath='+filePath+"&width="+width+"&height="+height+"&cropWidth="+cropWidth+"&cropHeight="+cropHeight;
                    $.colorbox({opacity:0.2,href:url,fixed:true,width:"65%", height:"85%", iframe:true,onClosed:function(){ if(false){location.reload(true);}},overlayClose:false});
                }else{
                    alert(json.message);
                }
            },error: function (data, status, e){
                alert(e);
            }
        });
     }  
	
	 function ajaxFileUpload11() {  
        if($("#uploadFile1").val()==''){
            alert('请选择上传文件');
            return false;
        }
        $.ajaxFileUpload({  
            url: '${dynamicDomain}/admin/screenshot/uploadImage?ajax=1',  
            secureuri: false,  
            fileElementId: 'uploadFile1',  
            dataType: 'json',  
            success: function(json, status) {
                if(json.result=='true'){
                    setImage(json.filePath);
                }else{
                    alert(json.message);
                }
            },error: function (data, status, e){
                alert(e);
            }
       }); 
	 }
	 
	 function setImage(path){
		 if(path){
			 $("#image").val(path);
			 $("#imageTag").attr("src",  "${dynamicDomain}" + path);
		 }
	 }
	</script>
</body>