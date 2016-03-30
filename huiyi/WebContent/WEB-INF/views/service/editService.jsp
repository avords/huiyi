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
<script type="text/javascript">
		function ajaxFileUpload1() {
		    if($("#uploadFile1").val()==''){
		        alert('请选择上传文件');
		        return false;
		    }
		    var cropWidth = 200;
		    var cropHeight = 100;
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
		                $.colorbox({opacity: 0.5,href:url,fixed:true,width:"65%", height:"85%", iframe:true,onClosed:function(){ if(false){location.reload(true);}},overlayClose:false});
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
		
		function ajaxFileUpload2() {  
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
		                $('#mainPicture').attr("value",filePath);
		                $('#preview').attr("src",'${dynamicDomain}'+filePath);
		                var temp='${dynamicDomain}'+filePath;
		                var img = '<a style="float: right;cursor: pointer;" id="mainDelete" data-path="'+filePath+'">删除</a>'+
		                '<img alt="" src="'+temp+'"  width="200px";height="160px;">';
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
	    
		function bindPictureDelete(){
		    $('#mainDelete').click(function(){
		        var mainPicture = $(this).data('path');
		        var obj = $(this);
		        $.ajax({
		            url:"${dynamicDomain}/admin/screenshot/deleteImage",
		            type : 'post',
		            dataType : 'json',
		            data:{'filePath':mainPicture},
		            success : function(json) {
		                    obj.parent().html('');
		                     $('#mainPicture').val('');
		            }
		        });
		        
		    });
		}
	    function validataValue(){
	    	var mainDiv=document.getElementById('mainImg');
	    	if(mainDiv.getElementsByTagName("img").length){
	    		$("#editForm").submit(); 
	    	}else {
	    		alert("请选择上传的图片！");
	    	}
	    }
</script>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="menu-icon glyphicon glyphicon-align-left icon-white"></span>
			<jdf:message code="服务管理"/>
			<div class="pull-right">
				<a href="${dynamicDomain}/admin/service/page" class="btn btn-primary"> <span class="glyphicon glyphicon-chevron-left"></span>
					<jdf:message code="返回列表" />
				</a>
			</div>
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
										<input value="<fmt:formatDate value="${entity.beginDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" type="text" style="width:180px;height:33px;" id="effectiveDate" name="beginDate" size="14" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d',maxDate:'#F{$dp.$D(\'expireDate\')}',readOnly:true})">
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
                                        <input value="<fmt:formatDate value="${entity.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" type="text" style="width:180px;height:33px;" id="expireDate" name="endDate" size="14" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'effectiveDate\')}',readOnly:true})">
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
									<select class="form-control" name="type">
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
                                    <input type="text" class="form-control" name="priority" id="priority" maxlength="6">
                                </div>
                            </div>
                        </div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="businessType" class="col-sm-3 control-label">业务类型</label>
								<div class="col-sm-8">
									<select class="form-control" name="businessType">
										<option value="">请选择</option>
										<jdf:select dictionaryId="1112" />
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
                            <div class="col-sm-6 col-md-6">
                                <div class="form-group">
                                    <label for="image"  class="col-sm-3 control-label">主图</label>
                                    <div class="col-sm-8">
                                    <input name="mainPicture" type="hidden" id="mainPicture">
                                    <div id="mainImg" style="width:200px;">
                                    <c:if test="${entity.objectId != null&& entity.mainPicture!=null }">
                                     <a style="float: right;cursor: pointer;" id="mainDelete" data-path="${dynamicDomain}${entity.mainPicture}">删除</a>
                                          <img id="preview" alt="" src="${dynamicDomain}${entity.mainPicture}" width="200px">
                                    </c:if>
                                    </div>
                                    <input type="file" name="uploadFile" id="uploadFile1" style="display: inline;" onchange="javascript:setImagePreview();">
                                    <input type="button" value="裁剪图片" onclick="ajaxFileUpload1();" id="uploadButton1">
                                    <input type="button" value="默认上传" onclick="ajaxFileUpload2();" id="uploadButton2">
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
                                                        <input type="text" class="form-control" id="nameZh" name="nameZh">
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
                                                        <textarea class="form-control" id="summaryZh" name="summaryZh" rows="5" cols=""></textarea>
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
					                                    <textarea name="detailZh" id="txtZh"  rows="500"></textarea> 
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
                                                        <input type="text" class="form-control" id="nameEn" name="nameEn">
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
                                                        <textarea class="form-control" id="summaryEn" name="summaryEn" rows="5" cols=""></textarea>
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
                                                        <textarea name="detailEn" id="txtEn"  rows="500"></textarea> 
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
								<button type="button" class="btn btn-primary" id="submitBtn" onclick="saveCheck()">
									<span class="glyphicon glyphicon-ok"></span><jdf:message code="common.button.save"/>
								</button>
								
								<button type="button" class="btn btn-primary" id="submitBtn1" onclick="submitForCheck()">
								<span class="glyphicon glyphicon-edit"></span><jdf:message code="提交"/>
								</button>
								
								<a href="${dynamicDomain}/admin/service/page" class="btn btn-primary btn-mini ">
									<span class="glyphicon glyphicon-edit"></span>
									<jdf:message code="取消"/>
								</a>
							</div>
						</div>
					</div>
				</form>
			</jdf:form>
		</div>
	</div>
	<jdf:bootstrapDomainValidate domain="Service" />
	<script type="text/javascript">
			
			function saveCheck(){
				
				if($("#mainPicture").val()==''){
			        alert('请上传服务主图！');
			        return false;
			    }
				else{
					$("#editForm").submit();
				}
			}
			
			function submitForCheck(){
				if($("#mainPicture").val()==''){
			        alert('请上传服务主图！');
			        return false;
			    }
				else{
					$("#status").val(2);
					$("#editForm").submit();
				}
			}
			
		$(document).ready(function() {
			bindPictureDelete();
			
			$("#beginDate").rules("add",{
				required:true,
				messages:{
					required:'不能为空',
		        }
			});
			
			
			$("#endDate").rules("add",{
				required:true,
				validateDate:true,
				messages:{
					required:'不能为空',
					validateDate:'请输入合法日期'
					
		        }
			});
			
			$("#priority").rules("add",{
				required:true,
				number: true,
				min:0,
				messages:{
					required:'不能为空',
		    		number:'请输入数字'
		        }
			});
			
			
			$("#mainPicture").rules("add",{
				required:true,
				messages:{
					required:'不能为空',
		        }
			});
			
			$("nameZh").rules("add",{
				required:true,
				maxlength:30,
				messages:{
					required:'不能为空',
		    		maxlength:'名称最大为30个字',
		        }
			});
			
			$("nameEn").rules("add",{
				required:true,
				maxlength:50,
				messages:{
					required:'不能为空',
		    		maxlength:'名称最大 为50个字符串',
		        }
			});
			
			$("#summaryZh").rules("add",{
				required:true,
				maxlength:512,
				messages:{
					required:'不能为空',
		    		maxlength:'最多输入512个字',
		        }
			});
			
			$("#summaryEn").rules("add",{
				required:true,
				maxlength:1024,
				messages:{
					required:'不能为空',
		    		maxlength:'名最多输入1024个字符串',
		        }
			});
			
			$("#detailZh").rules("add",{
			});
			
			$("#detailEn").rules("add",{
			});
		})	
	</script>
</body>