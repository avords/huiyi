<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>汇医网-注册</title>
<jdf:themeFile file="jquery.min.js"/>
<jdf:themeFile file="jquery.validate.min.js" />
<jdf:themeFile file="additional-methods_zh.js" />
<jdf:themeFile file="jquery.validate_zh.js" />
<jdf:themeFile file="common.js" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- CSS Global Compulsory -->
<link rel="stylesheet" href="${dynamicDomain}/static/assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${dynamicDomain}/static/assets/css/style.css">

<!-- CSS Header and Footer -->
<link rel="stylesheet" href="${dynamicDomain}/static/assets/css/header-v4.css">
<link rel="stylesheet" href="${dynamicDomain}/static/assets/css/footer-v1.css">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="${dynamicDomain}/static/assets/plugins/animate.css">
<link rel="stylesheet" href="${dynamicDomain}/static/assets/plugins/line-icons/line-icons.css">
<link rel="stylesheet" href="${dynamicDomain}/static/assets/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${dynamicDomain}/static/assets/plugins/skyforms/css/sky-forms.css">
<link rel="stylesheet" href="${dynamicDomain}/static/assets/plugins/skyforms/custom/custom-sky-forms.css">



<!-- CSS Customization -->
<link rel="stylesheet" href="${dynamicDomain}/static/assets/css/pages/page_log_reg_v1.css">

<!-- CSS Theme -->
<link rel="stylesheet" href="${dynamicDomain}/static/assets/css/theme-colors/dark-blue.css">
<link rel="stylesheet" href="${dynamicDomain}/static/assets/css/custom.css">


<script type="text/javascript">
	var processMessage = "<jdf:message code="system.lable.process"/>";
	var sureToDelete="<jdf:message code="common.js.sureToDelete"/>";
	var appRoot = "${dynamicDomain}";
</script>
</head>
<body>
<div class="wrapper login"> 
  <!--=== Header v4 ===-->
  <div class="header-v4"> 
   	<!-- End Navbar --> 
	<div class="container content login_bg">
		<div class="row">
			<div class="col-md-8 col-md-offset-2 col-sm-6 col-sm-offset-3">
				<form class="reg-page form-horizontal" action="" method="post" id="registForm" name="registForm" >
					<input type="hidden" id="objectId" name="objectId" value="${member.getObjectId() }">
	
					<div class="contex-bg">

						<c:if test="${not empty message }">
						<p class="bg-danger" id="show">
							<i class="fa fa-exclamation-triangle"></i> 
							<span id="errorShow">${message }</span>							
						</p>
						</c:if>
						
						<span id="msg" style="color:#a94442;font-size:14px;"></span>
						
					</div>
					<br>

					<div class="form-group">
						<label class="col-lg-3 control-label" for="loginName"><span
							class="text-danger">* </span>登录邮箱</label>
						<div class="col-lg-6">
							<input type="email" placeholder="注册邮箱地址" id="loginName" name="loginName" 
								class="form-control" value="${member.getLoginName() }">
						</div>
						<div class="col-lg-2">
							<button type="button" class="btn-u btn-u-blue" onclick="getValidateCode();">发送验证码</button>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label" for="s_randomCode"><span
							class="text-danger">* </span>验证码</label>
						<div class="col-lg-8">
							<input type="text" placeholder="填写邮箱邮件中的验证码" id="s_randomCode" name="s_randomCode" 
								class="form-control">
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-12 checkbox">
						<a id="registForm1">
							<button class="btn-u btn-u-orange btn-block" type="button" onclick="checkCode();">更新登录邮箱</button></a>
						</div>
					</div>
					<br>
					
					<div class="form-group">
						<label class="col-lg-3 control-label" for="password"><span
							class="text-danger">* </span>密码</label>
						<div class="col-lg-8">
							<input type="password" placeholder="输入密码" id="password" name="password" 
								class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label" for="inputPassword2"><span
							class="text-danger">* </span>确认密码</label>
						<div class="col-lg-8">
							<input type="password" placeholder="再次输入密码" id="inputPassword2" name="inputPassword2"
								class="form-control">
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 checkbox">
						<a id="registForm2">
							<button class="btn-u btn-u-orange btn-block" type="button" onclick="update(2);">更新登录密码</button></a>
						</div>
					</div>
					<br>
					
					<div class="form-group">
						<label class="col-lg-3 control-label" for="userName">
						<span class="text-danger">* </span></span>昵称</label>
						<div class="col-lg-6">
							<input type="text" placeholder="昵称" id="userName" name="userName" class="form-control" value="${member.getUserName() }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label" for="mobile">手机号码</label>
						<div class="col-lg-6">
							<input type="text" placeholder="手机号码" id="mobile" name="mobile" class="form-control {phone:true}" value="${member.getMobile() }">
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 checkbox">
						<a id="registForm3">
							<button class="btn-u btn-u-orange btn-block" type="button" onclick="update(3);">更新昵称和手机</button></a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</div>
<!-- JS Page Level -->
<script type="text/javascript">
	$(document).ready(function () {
		$("#registForm").validate({
			onfocusout: function(element){ $(element).valid(); },
		
			rules : {
				loginName : {
					required : true,
					remote : {
						url : "${dynamicDomain}/home/register/checkMemberName",
						type : "post",
						data : {
							value : function() {
								return $('#loginName').val();
							}
						},
						dataType : "json"
					}
				},
				s_randomCode : {
					required : true,
					remote : {
	                    url : "${dynamicDomain}/home/register/checkValidateCode",
	                    type : "post",
	                    data : {
	                    	s_randomCode : function () { return $('#s_randomCode').val(); },
	                    	loginName : function () { return $('#loginName').val(); }
	                    },
	                    dataType : "json"
	                }
				},
				password : {
					required : true

				},
				inputPassword2 : {
					required : true,
					equalTo : '#password'
				},
				userName : {
					required : true
				}
			},
			messages : {
				loginName : {
					remote : '该邮箱已经注册'
				},
				s_randomCode : {
					required : '验证码不能为空',
					remote : '邮箱验证码错误'
				},
				password : {
					required : '密码不能为空'
				},
				inputPassword2 : {
					required : '确认密码不能为空',
					equalTo : '确认密码和密码不一致'
				},
				userName : {
					required : '昵称不能为空'
				}
			},
			highlight : function(element) {
				$(element).closest('.form-group').addClass('bg-danger');
			},
			unhighlight : function(element) {
				$(element).closest('.form-group').removeClass('bg-danger');
			},
			errorPlacement : function(error, element) {
				error.appendTo(element.parent());
			}
		});
	});

	function getValidateCode() {
		var email = $("#loginName").val();
		if (email == null || email == "") {
			x.innerHTML = "请输入登录邮箱账号";
			return;
		}
		$.ajax({
			url : "${dynamicDomain}/home/register/sendEmail",
			type : 'post',
			dataType : 'json',
			data : {
				'loginName' : email
			},
			success : function(json) {
				if(json.flag){
            		$("#validateId").attr("value",json.validateId);
				}
				var temp = json.message;
				var x = document.getElementById("msg");
				x.innerHTML = temp;
			}
		});
	}
	
	function checkCode() {
		$.ajax({
			url : "${dynamicDomain}/home/register/checkValidateCode",
			type : 'post',
			dataType : 'json',
			data : {
            	s_randomCode : function () { return $('#s_randomCode').val(); },
            	loginName : function () { return $('#loginName').val(); }
            },
			success : function(json) {
				if (!json) {
					var x = document.getElementById("msg");
					x.innerHTML = "登录邮箱和接收验证码邮箱不匹配";
				} else {
					update(1);					
				}
			}
		});
	}
	
	function update(type) {
		var objectId = $("#objectId").val();

		if (type == 1) {
			var loginName = $("#loginName").val();
			$("#registForm1").attr("href","${dynamicDomain}/home/register/update/"+objectId+"/"+type+"/"+loginName + "/null");
			$("#registForm1").click();
		} else if (type == 2) {
			var password = $("#password").val();
			$("#registForm2").attr("href","${dynamicDomain}/home/register/update/"+objectId+"/"+type+"/"+password + "/null");
			$("#registForm2").click();
		} else if (type == 3) {
			var userName = $("#userName").val();
			var mobile = $("#mobile").val();
			$("#registForm3").attr("href","${dynamicDomain}/home/register/update/"+objectId+"/"+type+"/"+userName + "/" + mobile);
			$("#registForm3").click();
		}
	}
</script>
</body>
</html>