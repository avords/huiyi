<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title><jdf:message code="btn_main_register"/></title>
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
		<div class="row">
			<div class="col-md-8 col-md-offset-2 col-sm-6 col-sm-offset-3">
				<form class="reg-page form-horizontal" action="${dynamicDomain}/home/register/save" method="post" id="registForm" name="registForm" >
					<input type="hidden" id="validateId" name="validateId">
					<div class="reg-header">
						<h2>
							<span><jdf:message code="label_register_account"/><a href="${dynamicDomain}/home/login"><jdf:message code="btn_main_login"/></a></span><jdf:message code="btn_main_register"/>
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
					<br>

					<div class="form-group">
						<label class="col-lg-3 control-label" for="loginName"><span
							class="text-danger">* </span><jdf:message code="company_email"/></label>
						<div class="col-lg-6">
							<input type="email" id="loginName" name="loginName" 
								class="form-control">
						</div>
						<div class="col-lg-2">
							<button type="button" class="btn-u btn-u-blue" onclick="getValidateCode();"><jdf:message code="label_register_get_code"/></button>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label" for="s_randomCode"><span
							class="text-danger">* </span></span><jdf:message code="label_verification_code"/></label>
						<div class="col-lg-8">
							<input type="text"  id="s_randomCode" name="s_randomCode" 
								class="form-control">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-lg-3 control-label" for="password"><span
							class="text-danger">* </span><jdf:message code="label_password"/></label>
						<div class="col-lg-8">
							<input type="password"  id="password" name="password" 
								class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label" for="inputPassword2"><span
							class="text-danger">* </span><jdf:message code="menu_member_confirm_password"/></label>
						<div class="col-lg-8">
							<input type="password"  id="inputPassword2" name="inputPassword2"
								class="form-control">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-lg-3 control-label" for="userName">
						<span class="text-danger">* </span><jdf:message code="label_register_nichen"/></label>
						<div class="col-lg-6">
							<input type="text" id="userName" name="userName" maxlength="32" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label" for="mobile"><jdf:message code="company_telphone"/></label>
						<div class="col-lg-6">
							<input type="text" id="mobile" name="mobile" class="form-control {phone:true}">
						</div>
					</div>
					
					<br>
					<div class="form-group">
						<label class="col-lg-3 control-label" for="country"></label>
						<div class="col-lg-8">
							<div class="checkbox">
								<label> 
									<input type="checkbox" id="agreeMent" name="agreeMent"> 
									<a href="javascript:openProtocol();"><jdf:message code="label_inquiry_accept_all_clause"/></a>
								</label>
							</div>
						</div>
					</div>
					
					<div id="win" style="display: none; POSITION: fixed; left: 280px; top: 170px; width: 50%; background-color: white; padding: 7px; z-index: 100; opacity: 1; border: 10px solid gray;">
							<div>
								<br>
								<span><h4><jdf:message code="label_register_clause_1"/></h4></span>
							</div>
							<h4><jdf:message code="label_register_clause_2"/></h4>
							<p><jdf:message code="label_register_clause_3"/></p>
							<h4><jdf:message code="label_register_clause_4"/></h4>
							<p><jdf:message code="label_register_clause_5"/></p>
							<h4><jdf:message code="label_register_clause_6"/></h4>
							<p><jdf:message code="label_register_clause_7"/></p>
							<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="javascript:closeProtocol();"><jdf:message code="label_register_close_clause"/></a>
							<br>
						</div>
						
					<div class="row">
						<div class="col-md-12 checkbox">
							<button class="btn-u btn-u-orange btn-block" type="button" onclick="checkCode();"><jdf:message code="label_join_us"/></button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file="common/footer.jsp"%>
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
				},
				agreeMent : {
					required : true
				}
			},
			messages : {
				loginName : {
					required : '<jdf:message code="label_register_email_null"/>',
					remote : '<jdf:message code="label_register_email_haved"/>'
				},
				s_randomCode : {
					required : '<jdf:message code="label_register_email_null"/>',
					remote : '<jdf:message code="label_register_error"/>'
				},
				password : {
					required : '<jdf:message code="label_register_email_null"/>'
				},
				inputPassword2 : {
					required : '<jdf:message code="label_register_email_null"/>',
					equalTo : '<jdf:message code="label_register_password"/>'
				},
				userName : {
					required : '<jdf:message code="label_register_email_null"/>'
				},
				agreeMent : {
					required : '<jdf:message code="label_register_check_clause"/>'
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
		$("#loginName").focus();
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
            		var temp = json.message;
    				var x = document.getElementById("msg");
    				x.innerHTML = temp;
				}
				else{
    				return;
				}
			}
		});
	}
	
	function openProtocol() {
		document.getElementById("win").style.display = "";
	}

	function closeProtocol() {
		document.getElementById("win").style.display = "none";
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
					$("#registForm").submit();
				}
			}
		});
	}
</script>
</body>
</html>