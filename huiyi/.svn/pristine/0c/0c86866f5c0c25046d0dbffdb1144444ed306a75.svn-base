<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="com.mvc.cms.model.Content"%>
<%@ include file="../common/header.jsp"%>
<jdf:themeFile file="css/select2.css" />
<jdf:themeFile file="select2.js" />
<jdf:themeFile file="ckeditor/ckeditor.js" />
<jdf:themeFile file="ckeditor/config.js" />
<jdf:themeFile file="FilterMultSelect.js" />
<jdf:themeFile file="ajaxfileupload.js" />
</head>
<title>文章新增</title>
<body>
	<div class="box border">
		<div class="box-title">
			<h4>
				<span class="glyphicon glyphicon-edit"></span>文章新增
			</h4>
		</div>
		<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/admin/content/save?ajax=1" class="form-horizontal" name="RoleMenu" id="RoleMenu">
					<input type="hidden" name="objectId" id="objectId">
					<input type="hidden" name="status" id="status">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">${message}</div>
					</div>
					<div class="row">
						<div class="col-sm-4 col-sm-offset-6">
							<div class="form-group">
								<input type="text" id="rightInput" name="rightInput" />
								<button type="button" class="btn" id="rightFilter" onclick="filterUnselected();">
									<jdf:message code="common.lable.filter" />
								</button>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-6 col-md-6">已选</div>
						<div class="col-sm-6 col-md-6">未选</div>
					</div>

					<div class="row">
						<div class="col-sm-5">
							<div class="form-group">
								<select title="已选择栏目" name="menuId" id="selected" multiple="multiple" size="20" style="width: 80%; height: 160px;">
									<jdf:selectCollection items="haveChannels" optionValue="objectId" optionText="fullName" />
								</select>
							</div>
						</div>
						<div class="col-sm-1">
							<div class="form-group">
								<br><br><img title="添加选中" src="<jdf:theme/>img/oneLeft.gif" id="rightToLeft" class="contentMoveButton">
								<br><br><img title="删除选中" src="<jdf:theme/>img/oneRight.gif" id="leftToRight" class="contentMoveButton">
							</div>
						</div>
						<div class="col-sm-5">
							<div class="form-group">
								<select title="待选择栏目" name="unSelected" id="unSelected" multiple="multiple" size="20" style="width: 80%; height: 160px;">
									<jdf:selectCollection items="notHaveChannels" optionValue="objectId" optionText="fullName" />
								</select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="beginDate" class="col-sm-3 control-label">有效期</label>
								<div class="col-sm-8">
									<div class="input-append date" id="beginDate">
										<input class="input-medium" size="14" type="text" name="beginDate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})">
										-<input class="input-medium" size="14" type="text" name="endDate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="priority"> <jdf:message code="优先级 " /></label>
								<div class="col-sm-8">
									<input type="text" name="priority" id="priority" class="form-control">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="priority"> <jdf:message code="图片 " /></label>
								<div class="col-sm-8">
									<input name="picPath" type="hidden" id="picPath">
                                    <div id="mainImg" style="width: 100px;">
                                    <c:if test="${entity.objectId != null&& entity.picPath!=null }">
                                          <a style="float: right;cursor: pointer;" class="mainDelete" data-path="${entity.picPath }">删除</a>
                                          <img alt="" src="${dynamicDomain}${entity.picPath}" width="100px" height="100px;">
                                    </c:if>
                                    </div>
                                    <input type="file" name="uploadFile" id="uploadFile1" style="display: inline;">
                                    <input type="button" value="上传" onclick="ajaxFileUpload1();" id="uploadButton11">
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
													<label class="col-sm-2 control-label" for="nameZh">标题 
													</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" id="nameZh" name="nameZh">
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12 col-md-12">
												<div class="form-group">
													<label class="col-sm-2 control-label" for="summaryZh">摘要
													</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" id="summaryZh" name="summaryZh">
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12 col-md-12">
												<div class="form-group">
													<label for="txtZh" class="col-sm-2 control-label">内容
													</label>
													<div class="col-sm-10">
														<textarea name="txtZh" id="txtZh" rows="500"></textarea>
													</div>
													<script type="text/javascript">
					                                    var editorZh=CKEDITOR.replace( 'txtZh', {
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
													<label class="col-sm-2 control-label" for="nameEn">标题</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" id="nameEn" name="nameEn">
													</div>
												</div>
											</div>

										</div>
										<div class="row">
											<div class="col-sm-12 col-md-12">
												<div class="form-group">
													<label class="col-sm-2 control-label" for="summaryEn">摘要</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" id="summaryEn" name="summaryEn">
													</div>
												</div>
											</div>

										</div>
										<div class="row">
											<div class="col-sm-12 col-md-12">
												<div class="form-group">
													<label for="txtEn" class="col-sm-2 control-label">内容</label>
													<div class="col-sm-10">
														<textarea name="txtEn" id="txtEn" rows="500"></textarea>
													</div>
													<script type="text/javascript">
													var editorEn=CKEDITOR.replace( 'txtEn', {
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
						<div class="col-sm-12 col-md-12">
							<div class="center">
								<c:if test="${entity.status==null}">
									<button onclick="saveAndUp(0)" class="btn btn-primary">
										<span class="glyphicon glyphicon-ok"></span> 保存草稿
									</button>
								</c:if>
								<c:if test="${entity.status==0}">
									<button onclick="saveAndUp(${entity.status}+1)"
										class="btn btn-primary">
										<span class="glyphicon glyphicon-ok"></span> 提交审核
									</button>
								</c:if>
								<c:if test="${entity.status==1}">
									<button onclick="saveAndUp(${entity.status}+2)"
										class="btn btn-primary">
										<span class="glyphicon glyphicon-ok"></span> 审核通过
									</button>
									<button onclick="saveAndBack(${entity.status}+1)"
										class="btn btn-primary">
										<span class="glyphicon glyphicon-ok"></span> 审核不通过
									</button>
								</c:if>

								<c:if test="${entity.status==2}">
									<button onclick="saveAndUp(${entity.status}-1)"
										class="btn btn-primary">
										<span class="glyphicon glyphicon-ok"></span> 重新审核
									</button>
									<button onclick="saveAndUp(${entity.status}-2)"
										class="btn btn-primary">
										<span class="glyphicon glyphicon-ok"></span> 重新保存草稿
									</button>
								</c:if>
								<c:if test="${entity.status==3}">
									<button onclick="saveAndUp(${entity.status}+1)"
										class="btn btn-primary">
										<span class="glyphicon glyphicon-ok"></span> 发布
									</button>
								</c:if>
								<c:if test="${entity.status==4}">
									<button onclick="saveAndUp(${entity.status}+1)"
										class="btn btn-primary">
										<span class="glyphicon glyphicon-ok"></span> 撤销发布
									</button>
								</c:if>
								<c:if test="${entity.status==5}">
									<button onclick="saveAndUp(${entity.status}-1)"
										class="btn btn-primary">
										<span class="glyphicon glyphicon-ok"></span> 重新发布
									</button>
									<button onclick="saveAndUp(${entity.status}-5)"
										class="btn btn-primary">
										<span class="glyphicon glyphicon-ok"></span> 重新保存草稿
									</button>
								</c:if>
								<c:if test="${entity.status==6}">
									<button onclick="saveAndUp(${entity.status}-6)"
										class="btn btn-primary">
										<span class="glyphicon glyphicon-ok"></span> 重新保存草稿
									</button>
								</c:if>
								<button type="button" class="btn btn-primary"
									onclick="window.location='<%=dynamicDomain%>/admin/content/page';">
									<span class="glyphicon glyphicon-chevron-left"></span>
									<jdf:message code="返回" />
								</button>
							</div>
						</div>
					</div>
				</form>
			</jdf:form>
		</div>
	</div>
	<jdf:bootstrapDomainValidate domain="Content" />
	<script type="text/javascript">
		
	$(document).ready(function() {
		selectMove("selected","unSelected","rightToLeft","leftToRight","rightInput");
		refreshParentPage(false);
		$("#RoleMenu").validate({
			rules : {
				summary : {
					maxlength:512,
				}
			},
			messages : {
				summary : {
					maxlength : "文章摘要最大长度为512"
				}
			}
			});
  	 });
	
	function ajaxFileUpload1() {  
        if($("#uploadFile1").val()==''){
            alert('请选择上传文件');
            return false;
        }
        $.ajaxFileUpload({  
            url: '${dynamicDomain}/admin/content/uploadContentPic?ajax=1',  
            secureuri: false,  
            fileElementId: 'uploadFile1',  
            dataType: 'json',  
            success: function(json, status) {
                if(json.result=='true'){
                    var filePath = json.filePath;
                    var img = '<a style="float: right;cursor: pointer;" class="mainDelete" data-path="'+filePath+'">删除</a>'+
                    '<img alt="" src="${dynamicDomain}'+filePath+'" width="100px" height="100px;">';
                    $("#picPath").val(filePath);
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
        //删除
        $('.mainDelete').click(function(){
            var mainPicture = $(this).data('path');
            var obj = $(this);
            $.ajax({
                url:"${dynamicDomain}/admin/content/deleteContentPic",
                type : 'post',
                dataType : 'json',
                data:{'filePath':mainPicture},
                success : function(json) {
                        obj.parent().html('');
                         $('#picPath').val('');
                }
            });
            
        });
	}
		function selectMove(left,right,toLeft,toRight,rightFilterInput){
			init(left,right);
			$("#" + toLeft).bind("click",function(){moveIt(document.getElementById(right),document.getElementById(left),2);});					//左边到右边
			$("#" + toRight).bind("click",function(){moveIt(document.getElementById(left),document.getElementById(right),1);});					//右边到左边
			$("#" + left).bind("dblclick",function(){moveIt(document.getElementById(left),document.getElementById(right),1);});		//left中数据到right中的双击事件
			$("#" + right).bind("dblclick",function(){moveIt(document.getElementById(right),document.getElementById(left),2);});		//right中到left中的双击事件unauthorized
			
			$("#" + rightFilterInput).bind("keypress",function(event){
				event = event ? event :(window.event ? window.event : null);
				if(event.keyCode==13){
					event.keyCode=9; 
					doMyFilter($(this).val(),document.getElementById(right),2);
					return false;
				}
			});
		}
		
		function filterUnselected(){
			var rightInput=$('#rightInput').val();
			var right=document.getElementById('unSelected');
			doMyFilter(rightInput,right,2);
		}
		function prepare() {
			var theform = document.RoleMenu;
			var userIdSelected = theform.selected;
			for(var i = userIdSelected.options.length-1; i >= 0; i--){
				userIdSelected.options[i].selected = true;
			}
			if(userIdSelected.options.length<1){
				alert("请至少选择一个栏目")
				return false;
			}
			
			return true;
		}
		
		function saveAndUp(sta){
			var txtZh=editorZh.document.getBody().getText(); 
			var txtEn=editorEn.document.getBody().getText(); 
			if($('#summaryZh').val()==""){
				if(txtZh.length>=64){
					$('#summaryZh').val(txtZh.substring(0,60)+'...');
				}else{
					$('#summaryZh').val(txtZh);
				}
					
			}
			if($('#summaryEn').val()==""){
				if(txtEn.length>=64){
					$('#summaryEn').val(txtEn.substring(0,60)+'...');
				}else{
					$('#summaryEn').val(txtEn);
				}
					
			}
			var temp=prepare();
			if(temp){
				$("#status").val(sta);
				$("#RoleMenu").submit();
			}
		};
		
	</script>
</body>