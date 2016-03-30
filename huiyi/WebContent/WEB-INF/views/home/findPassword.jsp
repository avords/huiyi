<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title><jdf:message code="label_forgot_password"/></title>
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
				<form class="reg-page form-horizontal" action="${dynamicDomain}/home/login/reset" method="post" id="findForm" name="findForm" >

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
							class="text-danger">* </span><jdf:message code="company_email"/></label>
						<div class="col-lg-6">
							<input type="email"  id="loginName" name="loginName" 
								class="form-control">
						</div>
						<div class="col-lg-2">
							<button type="button" class="btn-u btn-u-blue" onclick="getValidateCode();"></span><jdf:message code="label_register_get_code"/></button>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label" for="s_randomCode"><span
							class="text-danger">* </span><jdf:message code="label_verification_code"/></label>
						<div class="col-lg-8">
							<input type="text" id="s_randomCode" name="s_randomCode" 
								class="form-control">
						</div>
					</div>
					
					<br>
						
					<div class="row">
						<div class="col-md-12 checkbox">
							<button class="btn-u btn-u-orange btn-block" type="button" onclick="checkCode();"></span><jdf:message code="label_findpassword_next"/></button>
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
		$("#findForm").validate({
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
				}
			},
			messages : {
				loginName : {
					required : '<jdf:message code="label_register_email_null"/>',
					remote : '<jdf:message code="label_sign_in_not_registered"/>'
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

	function getValidateCode() {
		var email = $("#loginName").val();
		if (email == null || email == "") {
			x.innerHTML = "<jdf:message code="label_register_email_enter"/>";
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
					x.innerHTML = "<jdf:message code="label_register_email_receive_code"/>";
				} else {
					$("#findForm").submit();
				}
			}
		});
	}
</script>
</body>
</html>