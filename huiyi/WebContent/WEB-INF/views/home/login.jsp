<%@page import="com.mvc.framework.util.DomainUtils"%>
<%@page import="com.mvc.framework.config.GlobalConfig"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title><jdf:message code="label_login_to_huiyi" /></title>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-75235264-1', 'auto');
  ga('send', 'pageview');

</script>
<jdf:themeFile file="jquery.min.js"/>
<jdf:themeFile file="jquery.validate.min.js" />
<jdf:themeFile file="additional-methods_zh.js" />
<jdf:themeFile file="jquery.validate_zh.js" />
<jdf:themeFile file="common.js" />

<jdf:themeFile file="jquery.SuperSlide.2.1.1.js" />
<jdf:themeFile file="jquery.cookie.js" />

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
   	 <%@ include file="common/header.jsp"%>
   	 <div class="navbar navbar-default mega-menu" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <div class="row">
            <div class="col-md-3"> <a class="navbar-brand logo" href="${dynamicDomain}/home"></a> </div>
          </div>
        </div>
      </div>
    </div>
   	<!-- End Navbar -->
   	 <div class="container content login_bg">
    <div class="row" >
      <div class="col-md-4 col-md-offset-7 col-sm-6 col-sm-offset-3">
      <form class="reg-page form-horizontal" action="${dynamicDomain}/home/login" method="post" id="loginForm" name="loginForm" >
          <div class="reg-header">
            <h2>
				<span><jdf:message code="label_new_user" />？<a href="${dynamicDomain}/home/register"><jdf:message code="label_join_us" /></a></span><jdf:message code="label_login_to_huiyi" />
			</h2>
          </div>
          <div class="contex-bg">

			<c:if test="${not empty message }">
				<p class="bg-danger" id="show">
					<i class="fa fa-exclamation-triangle"></i> 
					<span id="errorShow">${message }</span>							
				</p>
			</c:if>
			<span id="msg" style="color:#a94442;font-size:14px;"></span>
		  </div>
          <div class="input-group margin-bottom-20"> <span class="input-group-addon"><i class="fa fa-user"></i></span>
            	<input type="text" placeholder="<jdf:message code='label_email_address' />" class="form-control" id="loginName" name="loginName">
          </div>
          <div class="input-group margin-bottom-20"> <span class="input-group-addon"><i class="fa fa-lock"></i></span>
           		<input type="password" placeholder="<jdf:message code='label_password' />" class="form-control" id="password" name="password">
          </div>
          <div class="input-group margin-bottom-20">
            <input type="text" placeholder="<jdf:message code='label_verification_code' />" class="form-control" id="s_randomCode" name="s_randomCode">
				<span class="input-group-addon yz">
					<img src="../validate.code" id="kaptchaImage">
				</span>
		  </div>
          <div class="row margin-bottom-20">
	            <div class="col-md-6 checkbox">
		             <label> <input type="checkbox" id="remember" name="remember"> <jdf:message code='label_remember_login_name' />
					 </label>
	            </div>
            <div class="col-md-6 text-right"> 
            	<a href="${dynamicDomain}/home/login/findPassword"><jdf:message code='label_forgot_password' />？</a> 
            </div>
          </div>
          <div class="row">
            <div class="col-md-12 checkbox">
              <button class="btn-u btn-u-orange btn-block" type="submit" onclick="saveLogin()"><jdf:message code='btn_main_login' /></button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<%@ include file="common/footer.jsp"%>
</div>

<script type="text/javascript">

	//记住用户名密码
	function saveLogin() {
		if ($('input[name="remember"]').prop("checked")) {
			var str_username = $("#loginName").val();
			$.cookie("remember", "true", { expires : 7 }); //存储一个带7天期限的cookie
			$.cookie("loginName", str_username, { expires : 7 });
		} else {
			$.cookie("remember", null);
			$.cookie("loginName", null);
		}
	};

	$(document).ready(function () {
		if ($.cookie("remember") == "true") {
			$("#loginName").val($.cookie("loginName"));
			$("#remember").attr("checked", "checked");//根据cookied，判断是否选上
		} else {
			$("#loginName").val("");
		}
		
		$('#kaptchaImage').click(
			function() {
				$(this).attr('src','../validate.code?'+ Math.floor(Math.random() * 100));
			}
		);
		
		$("#loginForm").validate({
			onfocusout: function(element){ $(element).valid(); },
		
			rules : {
				loginName : {
					required : true,
					remote : {
						url : "${dynamicDomain}/home/login/checkMemberName",
						type : "post",
						data : {
							value : function() {
								return $('#loginName').val();
							}
						},
						dataType : "json"
					}
				},
				password : {
					required : true
				},
				s_randomCode : {
					required : true,
					remote : '${dynamicDomain}/public/checkConfirmCode'
				}
			},
			messages : {
				loginName : {
					required : '<jdf:message code="label_register_email_null"/>',
					remote : '<jdf:message code="label_sign_in_not_registered"/>'
				},
				password : {
					required : '<jdf:message code="label_register_email_null"/>'
				},
				s_randomCode : {
					required : '<jdf:message code="label_register_email_null"/>',
					remote : '<jdf:message code="label_register_error"/>'
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