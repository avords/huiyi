<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>重置密码</title>
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
				<form class="reg-page form-horizontal" action="${dynamicDomain}/home/login/update" method="post" id="resetForm" name="resetForm" >
					<input type="hidden" id="loginName" name="loginName" value="${loginName }">
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
						<label class="col-lg-3 control-label" for="password"><span
							class="text-danger">* </span>密码</label>
						<div class="col-lg-8">
							<input type="password" placeholder="输入密码" id="password" name="password" 
								class="form-control">
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
					
					<br>
						
					<div class="row">
						<div class="col-md-12 checkbox">
							<button class="btn-u btn-u-orange btn-block" type="submit">下一步</button>
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
		$("#resetForm").validate({
			onfocusout: function(element){ $(element).valid(); },
		
			rules : {
				password : {
					required : true
				},
				inputPassword2 : {
					required : true,
					equalTo : '#password'
				}
			},
			messages : {
				password : {
					required : '密码不能为空'
				},
				inputPassword2 : {
					required : '确认密码不能为空',
					equalTo : '确认密码和密码不一致'
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
</script>
</body>
</html>