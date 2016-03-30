<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<jdf:themeFile file="ajaxfileupload.js" />
<title><jdf:message code="广告编辑"/></title>
</head>
<body>
<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-pencil"></span><jdf:message code="广告编辑"/>
			<div class="pull-right" id="cd">
				 <a  href="${dynamicDomain}/admin/advert/page"  class="btn btn-primary">
           			<span class="glyphicon glyphicon-th-list"></span><jdf:message code="返回列表"/>
           		 </a>
			</div>
		</div>
	  	<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/admin/advert/save?ajax=1" class="form-horizontal" id="editForm" enctype="multipart/form-data">
					<input type="hidden" name="objectId">
			 		<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message=="success"?"操作成功":""}
						</div>
					</div>
					<div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="positionCode" class="col-sm-3 control-label"><jdf:message code="广告位置" /></label>
                                <div class="col-sm-5">
                                    <select  name="positionCode" id="positionCode"  style="width: 240px;" onchange="select();">
                                            <option value="">请选择</option>
                                            <jdf:selectCollection items="positions" optionValue="positionCode"  optionText="positionName" />
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="advertName" class="col-sm-3 control-label"><jdf:message code="广告名" /></label>
                                <div class="col-sm-5">
                                	<input type="text" name="advertName" maxlength="25" style="width: 240px;" onkeyup="replaceSpace(this)" onkeydown="replaceSpace(this)">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="dispalyOrder" class="col-sm-3 control-label"><jdf:message code="显示顺序" /></label>
                                <div class="col-sm-5">
                                	<input type="tel" name="dispalyOrder" min="1" style="width: 240px;" value="${entity.dispalyOrder }">
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="url" class="col-sm-3 control-label"><jdf:message code="跳转地址" /></label>
                                <div class="col-sm-5">
                                	 <input type="url" name="url" maxlength="250"  value="${entity.url }" style="width: 240px;">
                                </div>
                            </div>
                        </div>
                     </div>    
                      <input type="hidden" id="advertStatus"  name="advertStatus" value="${entity.advertStatus}">
                  	 <div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="pictureWidth">
                                <jdf:message code="图片宽度" />
                                </label>
                                <div class="col-sm-4">
                                    <input type="text" name="pictureWidth" id="pictureWidth" readonly="readonly" class="form-control" style="width: 240px;">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="pictureHeight">
                                <jdf:message code="图片高度" />
                                </label>
                                <div class="col-sm-4">
                                    <input type="text" name="pictureHeight" readonly="readonly" id="pictureHeight" class="form-control" style="width: 240px;">
                                </div>
                            </div>
                        </div>
                    </div>
					<div class="row">
                            <div class="col-sm-6 col-md-6">
                                <div class="form-group">
                                    <label for="mainPicture"  class="col-sm-3 control-label">图片</label>
                                    <div class="col-sm-8">
                                    <input name="pictureAddress" type="hidden" id="mainPicture" >
                                    <div id="mainImg" style="width:500px;">
                                    <c:if test="${entity.objectId != null&& entity.pictureAddress!=null }">
                                          <img id="preview" alt="" src="${dynamicDomain}${entity.pictureAddress}" style="width:500px;">
                                    </c:if>
                                    </div><br>
                                    <input type="file" name="uploadFile" id="uploadFile1" style="display: inline;" accept="image/*" onchange="javascript:setImagePreview();">
                                    <button type="button" onclick="ajaxFileUpload1();" id="uploadButton1"><span class="glyphicon glyphicon-picture"></span><jdf:message code="裁剪图片"/></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                  <c:if test="${message!='success'}">
	                  <div class="row">
							<div class="col-sm-12 col-md-12">
								<div class="pull-right">
								<c:if test="${entity.advertStatus==1||entity.advertStatus==null}">
		                                    <button  type="button" onclick="butSubmit()" class="btn btn-info">
												<span class="glyphicon glyphicon-saved"></span>提交
											</button>
		                        </c:if>
									<button  type="button" class="btn btn-success" onclick="butSave()">
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
	<jdf:bootstrapDomainValidate domain="Advert"/>
<script type="text/javascript">
		$(function(){
			select();
		})
		function select() {
			var positionCode=$("#positionCode").val();
				$.ajax({
					type:'post',
					url:'<%=dynamicDomain%>/admin/advert/selectAdvertPosition/'+positionCode,
					dataType:'json',
		            success:function(msg){
			        	if(msg.result){
			        		$("#pictureWidth").val(msg.advertPosition.width);
							$("#pictureHeight").val(msg.advertPosition.height);
			        	}
				     }
		        });
				
			}
		
		function butSubmit(){
			var pictureAddress=$("#mainPicture").val();
			if(pictureAddress==''){
				alert("请选择上传的图片！");
				return false;
			}
				$("#advertStatus").val(2);
				$("#editForm").submit();
		}
		
		function butSave(){
			var pictureAddress=$("#mainPicture").val();
			if(pictureAddress==''){
				alert("请选择上传的图片！");
				return false;
			}
			$("#editForm").submit();
		}

		function ajaxFileUpload1() {
			if($("#pictureWidth").val()==''){
                alert('请选择广告位置');
                return false;
            }
			if($("#pictureHeight").val()==''){
                alert('请选择广告位置');
                return false;
            }
	        if($("#uploadFile1").val()==''){
	            alert('请选择上传文件');
	            return false;
	        }
	        var cropWidth = $("#pictureWidth").val();
	        var cropHeight = $("#pictureHeight").val();
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
	                    $.colorbox({opacity: 0.5,href:url,fixed:true,width:"90%", height:"90%", iframe:true,onClosed:function(){ if(false){location.reload(true);}},overlayClose:false});
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
	    
	    function setImagePreview(avalue) {
	    	var docObj=document.getElementById("uploadFile1");
	    	var imgObjPreview=document.getElementById("preview");
	    	if(docObj.files &&docObj.files[0])
	    			{
	    			imgObjPreview.style.display = 'block';
	    			imgObjPreview.style.width = '500px';
	    			imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
	    			}
	    }
	    
	    function replaceSpace(obj){
	    	   obj.value = obj.value.replace("%","")
	    	 }
		</script>
</body>
</html>