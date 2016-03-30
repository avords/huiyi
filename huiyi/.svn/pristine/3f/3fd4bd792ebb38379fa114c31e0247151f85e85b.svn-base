<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="com.mvc.security.SecurityConstants"%>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="栏目编辑" /></title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="menu-icon glyphicon glyphicon-align-left icon-white"></span><jdf:message code="栏目管理" />
			<div class="pull-right">
			<button type="button" class="btn btn-primary" onclick="window.location='${dynamicDomain}/admin/channel/page'">
					<span class="glyphicon glyphicon-chevron-left"></span><jdf:message code="返回" />
			</button>
			</div>
		</div>
		<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/admin/channel/save" class="form-horizontal" id="editForm" enctype="multipart/form-data">
					<input id="objectId" type="hidden" name="objectId">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}</div>
					</div>
					
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="nameZh">
								 <jdf:message code="栏目名称中文 " />
								  </label>
								<div class="col-sm-8">
									<input type="text" maxlength="32" placeholder="最多输入32字符" class="form-control" name="nameZh">
								</div>
							</div>
						</div>
						
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="nameEn">
								 <jdf:message code="栏目名称英文" />
								  </label>
								<div class="col-sm-8">
									<input type="text" maxlength="32" placeholder="最多输入32字符" class="form-control" name="nameEn">
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="parentId">
								<jdf:message code="父栏目" />
								</label>
								<div class="col-sm-8">
									<select id="parentId" name="parentId" class="js-example-placeholder-single" style="width: 100%;background-color: white;" id="parentId">
										<option value="-1">请选择</option>
										<jdf:selectCollection items="channels" optionValue="objectId" optionText="fullName" />
									</select>
								</div>
							</div>
						</div>
						
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="priority">
								<jdf:message code="顺序" />
								</label>
								<div class="col-sm-8">
									<input type="text" name="priority" id="priority" onchange="isGreaterThenZero(this)" class="form-control">
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="level">
								 <jdf:message code="级别 " />
								  </label>
								<div class="col-sm-8">
									<input type="text" disabled="disabled" class="form-control" id="level" name="level">
								</div>
							</div>
						</div>
						
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="status">
								<jdf:message code="状态 " />
								</label>
								<div class="col-sm-8">
								    <select id="status" name="status" class="form-control">
										<option>请选择</option>
										<jdf:select dictionaryId="111" valid="true" />
									</select>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
					  <div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="fullName">
								<jdf:message code="完整名称" />
								</label>
								<div class="col-sm-8">
									<input type="text" disabled="disabled" name="fullName" id="fullName" class="form-control">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="positionCode">
								<jdf:message code="父栏目位置 " />
								</label>
								<div class="col-sm-8">
									<input type="radio" name="location" value="1" >首页左下角
									<input type="radio" name="location" value="2" >页面页脚
									<input type="radio" name="location" value="3" >技术知识
									<input type="radio" name="location" value="4" checked="checked">其他父栏目
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
								<div class="form-group">
									<label class="col-sm-3 control-label" for="remark">
									<jdf:message code="备注" />
									</label>
									<div class="col-sm-8">
										<textarea maxlength="64" placeholder="最多输入64字符" name="remark" id="remark" class="form-control"></textarea>
									</div>
								</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="positionCode">
								<jdf:message code="栏目编码 " />
								</label>
								<div class="col-sm-8">
									<input type="text" onblur="isNewPositionCode(this)" maxlength="32" name="positionCode" id="positionCode"  class="form-control">
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-12 col-md-6">
							<div class="pull-right">
							<c:if test="${message!='操作成功'}">
								<button  onclick="validate()" class="btn btn-primary">
									<span class="glyphicon glyphicon-ok"></span>
									<jdf:message code="common.button.save" />
								</button>
								</c:if>
							</div>
						</div>
					</div>
				</form>
			</jdf:form>
		</div>
	</div>
	
	<script type="text/javascript">
	$(function() {
		function setCode(str,type){
			$("#positionCode").val(str);
			if(type==1){
			    $("#positionCode").attr("readOnly",true);
			    $("#positionCode").removeAttr("onblur");
			}else{
				$("#positionCode").attr("readOnly",false);
				$("#positionCode").attr("onblur","isNewPositionCode(this)");
			}
		}
		
		$("[name='location']").on("change",function (e) { 
			var val=$(e.target).val();
			switch(val)
			{
			case "1":
				setCode("NEWS",1);
			    break;
			case "2":
				setCode("PAGE_FOOTER",1);
			    break;
			case "3":
				setCode("jszs",1);
			    break;
			default:
				setCode("",2);
			}
		}); 
		
		
		$(".js-example-placeholder-single").select2();
		$("#editForm").validate({
			rules : {
				name : {
					required : true,
				},
				
				priority : {
					required : true,
					digits:true
				},
				
				positionCode : {
					required : true,
				},
				
				status : {
					required : true,
					number:true
				},
				
			},
			
			messages : {
				name : {
					required : '必填字段'
				},
				
				positionCode : {
					required : '请输入字母和数字组成的编码'
				},
				
				priority : {
					required : '必填字段',
					digits: '请输入整数顺序编码'
				},
				
				status : {
					required : '必填字段',
					number :'请点击选择是否有效'
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
	
	
		function isNewPositionCode(obj){
	    	var code=obj.value;
	    	var objId=$("#objectId").val();
	    	var dataModel={"positionCode":code,"objId":objId};
	    	$.ajax({
	            url:'${dynamicDomain}/admin/channel/isNewPositionCode',
	            type : 'post',
	            dataType: 'json', 
	            data:dataModel,
	            success:function(json) {
	            	if(!json.result){
	            		alert("该编号已存在,请重新改!");
	            		$("#"+obj.id).val("");
	            	}
	            },
	            error: function (data, status, e)//服务器响应失败处理函数
	            {
	                alert("服务器开小差了:"+e);
	            }
	        });
	    };
	</script>
	
</body>