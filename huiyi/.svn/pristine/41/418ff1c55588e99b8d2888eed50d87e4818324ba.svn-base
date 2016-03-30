<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<jdf:themeFile file="ajaxfileupload.js" />
<title>
	<c:if test="${1==sellOrBuy}">
			买家修改
	</c:if>
	<c:if test="${2==sellOrBuy}">
			卖家修改
	</c:if>
</title>
<script type="text/javascript">
$(function() {
 	$("#editForm").validate({
		rules : {
			phone : {
				required:true,
				number:true,
				maxlength:11,
				minlength:11
			},
			
			businessPhoneF : {
				required : true,
				number:true,
				maxlength:4,
				minlength:3
			},
			
			businessPhoneS : {
				required : true,
				number:true,
				maxlength:20,
				minlength:7
			},
			
			businessFaxF : {
				required : true,
				number:true,
				maxlength:4,
				minlength:3
			},
			
			businessFaxS : {
				required : true,
				number:true,
				maxlength:20,
				minlength:7
			},
			
		},
		
		messages : {
			phone : {
				required : '必填字段',
				number : '请输入数字',
				maxlength : '请输入11位数字',
				minlength : '请输入11位数字'
			},
			
			businessPhoneF : {
				required : '必填字段',
				number : '请输入数字',
				maxlength : '最多输入4位数字',
				minlength : '至少输入3位数字'
			},
			
			businessPhoneS : {
				required : '必填字段',
				number : '请输入数字',
				maxlength : '最多输入20位数字',
				minlength : '至少输入7位数字'
			},
			
			businessFaxF : {
				required : '必填字段',
				number : '请输入数字',
				maxlength : '最多输入4位数字',
				minlength : '至少输入3位数字'
			},
			
			businessFaxS : {
				required : '必填字段',
				number : '请输入数字',
				maxlength : '最多输入20位数字',
				minlength : '至少输入7位数字'
			},
			
			
		},
		highlight : function(element) {
			$(element).closest('.form-group').addClass('has-error');
		},
		unhighlight : function(element) {
			$(element).closest('.form-group').removeClass('has-error');
		},
		errorElement : 'span',
		errorClass : 'help-block',
		errorPlacement : function(error, element) {
			if (element.parent('.input-group').length) {
				error.insertAfter(element.parent());
			} else {
				error.insertAfter(element);
			}
		}
	});
	
});
 
 function checkEditZh(){
	 var nameZh=$('#nameZh').val();
	 var addressZh=$('#addressZh').val();
	 var descriptionZh=$('#descriptionZh').val();
	 var mainProductsZh=$('#mainProductsZh').val();
		if(nameZh.length>64||nameZh.length<1){
			alert("企业名称格式输入有误，请输入1-64位有效值！");
			return false;
		}else{
				if(addressZh.length>128||addressZh.length<6){
					alert("地址格式输入有误，请输入6-128位有效值！");
					return false;
				}else{
					if(descriptionZh.length>256||descriptionZh.length<1){
						alert("企业描述格式输入有误，请输入1-256位有效值！");
						return false;
					}else{
						if(mainProductsZh.length>128||mainProductsZh.length<2){
							alert("主营产品格式输入有误，请输入2-128位有效值！");
							return false;
						}
				}
			}
		}
		return true;
 }
 
 function checkEditEn(){
	 var nameEn=$('#nameEn').val();
	 var addressEn=$('#addressEn').val();
	 var descriptionEn=$('#descriptionEn').val();
	 var mainProductsEn=$('#mainProductsEn').val();
		if(nameEn.length>64||nameEn.length<1){
			alert("The format of Company Name is wrong,Please enter 1-64 valid values!");
			return false;
		}else{
				if(addressEn.length>128||addressEn.length<6){
					alert("The format of Detail Address is wrong,Please enter 6-128 valid values!");
					return false;
				}else{
					if(descriptionEn.length>256||descriptionEn.length<1){
						alert("The format of Description is wrong,Please enter 1-256 valid values!");
						return false;
					}else{
						if(mainProductsEn.length>128||mainProductsEn.length<2){
							alert("The format of Main Products is wrong,Please enter 2-128 valid values!");
							return false;
						}
				}
			}
		}
		return true;
 }
 
 function submitForm(){
	var name=document.getElementById("editZh").className;
	if(name=="tab-pane active"){
		var temp=checkEditZh();
		if(temp){
			$("#editForm").submit(); 
		} 
	}else{
		var temp2=checkEditEn();
		if(temp2){
			$("#editForm").submit(); 
		} 
	}
 }
 
	function butSubmit(){
		$("#status").val(2);
		$("#editForm").submit();
	}
  
</script>

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
			<span class="glyphicon glyphicon-pencil"></span>
				<c:if test="${1==sellOrBuy}">
						买家修改
				</c:if>
				<c:if test="${2==sellOrBuy}">
						卖家修改
				</c:if>
			<div class="pull-right" id="cd">
				 <a  href="${dynamicDomain}${cPath}/page"  class="btn btn-primary">
           			<span class="glyphicon glyphicon-th-list"></span><jdf:message code="返回列表"/>
           		 </a>
			</div>
		</div>
		<div class="panel-content">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}${cPath}/save?ajax=1" class="form-horizontal" id="editForm" enctype="multipart/form-data">
						<input type="hidden" name="objectId">
						<div class="span12 alert alert-info" id="messageBox">
							${message=="success"?"操作成功":""}
						</div><br>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="email" class="col-sm-4 control-label">联系邮箱<span class="red">*</span>:</label>
								<div class="col-sm-8">
									<input type="email" class="form-control" id="email" name="email" value="${entity.email }">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="phone" class="col-sm-4 control-label">手机:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="phone" name="phone">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="fax" class="col-sm-4 control-label">公司传真<span class="red">*</span>:</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="businessFaxF" name="businessFaxF" placeholder="区号">
								</div>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="businessFaxS" name="businessFaxS" >
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="" class="col-sm-4 control-label">公司电话<span class="red">*</span>:</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="businessPhoneF" name="businessPhoneF" placeholder="区号">
								</div>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="businessPhoneS" name="businessPhoneS" >
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="website" class="col-sm-4 control-label">企业网址:</label>
									<div class="col-sm-8">
										<input type="url" class="form-control" id="website" name="website">
									</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="registerDate" class="col-sm-4 control-label" >注册时间:</label>
								<div class="col-sm-8">
									<input type="text" id="registerDate" name="registerDate" class="Wdate" style="width:343px"
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
								<div class="form-group">
									<label for="registCapital" class="col-sm-4 control-label">注册资本:</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="registCapital" name="registCapital">
									</div>
								</div>
							</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="registNumber" class="col-sm-4 control-label">工商注册号:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="registNumber" name="registNumber">
								</div>
							</div>
						</div>
					</div>
					
				    <div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="numEmployees" class="col-sm-4 control-label">企业规模:</label>
									<div class="col-sm-8">
										<select class="form-control" name="numEmployees" >
											<option value="">请选择</option>
												<jdf:select dictionaryId="1111" />
										</select>
									</div>
							</div>
						</div>
					</div>
					 <div class="row">
						<div class="col-sm-8 col-md-8">
							<div class="form-group">
								<label for="businessType" class="col-sm-3 control-label">商业类型:</label>
									<div class="col-sm-8">
										<c:forEach items="${businessTypes }" var="asl" >
											<%-- <c:forEach items="${businessTypeSelect }" var="abc" >
												<c:if test="${asl.value==abc.businessType}">
													<label class="checkbox-inline"><input type="checkbox" name="businessType" checked="checked" value="${asl.value}">${asl.name}</label>
												</c:if>
												<c:if test="${asl.value!=abc.businessType}">
													<label class="checkbox-inline"><input type="checkbox" name="businessType" value="${asl.value}">${asl.name}</label>
												</c:if>
									    	</c:forEach> --%>
									    	<label class="checkbox-inline"><input type="checkbox" name="businessType" value="${asl.value}">${asl.name}</label>
									    </c:forEach>
									</div>
							</div>
						</div> 
					</div>
				 
					 <div class="row">
	                     <div class="col-sm-8 col-md-8">
	                         <div class="form-group">
	                             <label for="mainPicture" class="col-sm-3 control-label">企业 LOGO</label>
	                             <div class="col-sm-8">
	                             <input name="logoAddress" type="hidden" id="mainPicture">
	                             <div id="mainImg" style="width:200px;">
	                             <c:if test="${entity.objectId != null&& entity.logoAddress!=null }">
	                                   <img id="preview" alt="" src="${dynamicDomain}${entity.logoAddress}" style="width:500px;">
	                             </c:if>
	                             </div><br>
	                             <input type="file" name="uploadFile" id="uploadFile1" style="display: inline;" accept="image/*" onchange="javascript:setImagePreview();">
	                             <button type="button" onclick="ajaxFileUpload1();" id="uploadButton1"><span class="glyphicon glyphicon-picture"></span><jdf:message code="裁剪图片"/></button>
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
										<div class="col-sm-6 col-md-6">
											<div class="form-group">
												<label for="nameZh" class="col-sm-4 control-label">企业名称<span class="red">*</span>:</label>
													<div class="col-sm-8">
														<input type="text" class="form-control" id="nameZh" name="nameZh">
													</div>
											</div>
										</div>
										<div class="col-sm-6 col-md-6">
											<div class="form-group">
												<label for="areaCode" class="col-sm-3 control-label">
													<jdf:message code="所在地"/>
												</label>
												<div class="col-sm-6">
													 <select  name="search_EQS_areaCode"  id="search_EQS_areaCode" style="width: 240px;">
				                                            <option value="">全部</option>
				                                            <jdf:selectCollection items="countries" optionValue="areaCode" optionText="nameZh" />
				                                    </select>
												</div>
											</div>
										</div> 
									</div>
									
									<div class="row">
										<div class="col-sm-6 ">
											<div class="form-group">
												<label for="addressZh" class="col-sm-4 control-label">详细地址<span class="red">*</span>:</label>
													<div class="col-sm-8">
														<input type="text" style="width:590px" class="form-control" id="addressZh" name="addressZh">
													</div>
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label for="descriptionZh" class="col-sm-4 control-label">企业描述<span class="red">*</span>:</label>
													<div class="col-sm-8">
														<textarea class="form-control" style="height:80px;width: 590px" id="descriptionZh" name="descriptionZh"></textarea>
													</div>
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label for="mainProductsZh" class="col-sm-4 control-label">主营产品<span class="red">*</span>:</label>
													<div class="col-sm-8">
														<textarea class="form-control" placeholder="请输入关键字，关键字用英文逗号（，）隔开!" style="height:80px;width: 590px" id="mainProductsZh" name="mainProductsZh"></textarea>
													</div>
											</div>
										</div>
									</div>
									
								</div>
								
								<div id="editEn" class="tab-pane">
									<div class="row" >
										<div class="col-sm-6 col-md-8">
											<div class="form-group">
												<label for="nameEn" class="col-sm-6 control-label">Company Name<span class="red">*</span>:</label>
													<div class="col-sm-6">
														<input type="text" class="form-control" id="nameEn" name="nameEn">
													</div>
											</div>
										</div>
										<div class="col-sm-6 col-md-6">
											<div class="form-group">
												<label for="areaCode" class="col-sm-3 control-label">
													<jdf:message code="country"/>
												</label>
												<div class="col-sm-6">
													 <select  name="search_EQS_areaCode"  id="search_EQS_areaCode" style="width: 240px;">
				                                            <option value="">全部</option>
				                                            <jdf:selectCollection items="countries" optionValue="areaCode" optionText="nameEn" />
				                                    </select>
												</div>
											</div>
										</div> 
									</div>
									
									<div class="row">
										<div class="col-sm-9">
											<div class="form-group">
												<label for="addressEn" class="col-sm-4 control-label">Detail Address<span class="red">*</span>:</label>
													<div class="col-sm-8">
														<input type="text" class="form-control" style="width: 525px" id="addressEn" name="addressEn">
													</div>
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-sm-9">
											<div class="form-group">
												<label for="descriptionEn" class="col-sm-4 control-label">Description<span class="red">*</span>:</label>
													<div class="col-sm-8">
														<textarea class="form-control" style="height:80px;width: 525px" id="descriptionEn" name="descriptionEn"></textarea>
													</div>
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-sm-9">
											<div class="form-group">
												<label for="mainProductsEn" class="col-sm-4 control-label">Main Products<span class="red">*</span>:</label>
													<div class="col-sm-8">
														<textarea class="form-control" style="height:80px;width: 525px" id="mainProductsEn" name="mainProductsEn"></textarea>
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
	            
	            <hr style="border:none;border-top:1px dashed #0066CC;">    
	            <div class="buyer">
					<span>企业证照</span>
				</div>
				<input type="hidden" id="status"  name="status" value="${entity.status}">
				<c:if test="${message!='success'}">
	                  <div class="row">
							<div class="col-sm-12 col-md-12">
								<div class="pull-right">
								<c:if test="${entity.status==1||entity.status==null}">
		                                    <button  type="button" onclick="butSubmit()" class="btn btn-info">
												<span class="glyphicon glyphicon-saved"></span>提交
											</button>
		                        </c:if>
									<button  type="submit" class="btn btn-success">
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
<script type="text/javascript">
function ajaxFileUpload1() {
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
                $.colorbox({opacity: 0.5,href:url,fixed:true,width:"60%", height:"80%", iframe:true,onClosed:function(){ if(false){location.reload(true);}},overlayClose:false});
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
			imgObjPreview.style.width = '200px';
			imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
			}
}
</script>	
</body>