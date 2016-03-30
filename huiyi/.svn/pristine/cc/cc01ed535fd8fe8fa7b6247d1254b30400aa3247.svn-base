<%@page import="com.mvc.framework.util.DomainUtils"%>
<%@page import="com.mvc.framework.config.GlobalConfig"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<%
	String dynamicDomain = DomainUtils.getDynamicDomain();
	request.setAttribute("dynamicDomain", dynamicDomain);
%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
<jdf:themeFile file="css/bootstrap.min.css" />
<jdf:themeFile file="css/font-awesome.min.css" />
<jdf:themeFile file="css/ace.min.css" />
<!--[if lte IE 9]>
<link rel="stylesheet" href="assets/css/ace-part2.min.css" />
<jdf:themeFile file="css/ace-part2.min.css" />
<![endif]-->
<jdf:themeFile file="css/ace-rtl.min.css" />
<!--[if lte IE 9]>
<jdf:themeFile file="css/ace-ie.min.css" />
<![endif]-->
<jdf:themeFile file="css/login.css" />
<!-- start: JavaScript-->
<!--[if !IE]>-->
<jdf:themeFile file="jquery.min.js" />
<!--<![endif]-->

<!--[if IE]>
	<jdf:themeFile file="jquery-1.10.2.min.js"/>
<![endif]-->
<jdf:themeFile file="jquery-migrate-1.2.1.min.js" />
<jdf:themeFile file="jquery.metadata.js" />
<jdf:themeFile file="jquery.validate.min.js" />
<jdf:themeFile file="additional-methods.min.js" />
<jdf:themeFile file="jquery.validate_zh.js" />
<!--[if lt IE 9]>
<jdf:themeFile file="html5.js"/>
<jdf:themeFile file="respond.min.js"/>
<![endif]-->
<title><jdf:message code="${systemName}" /></title>
<script type="text/javascript">
	var processMessage = "";
	$(function() {
		$('#kaptchaImage').click(
				function() {
					$(this).attr('src','../validate.code?'+ Math.floor(Math.random() * 100));
				});
		$("#loginForm").validate({
			rules : {
				loginName : {
					required : true
				},
				password : {
					required : true
				},
				s_randomCode : {
					required : true,
					remote : '${dynamicDomain}/public/checkConfirmCode'
				}
			},
			messages: { 
				loginName: { 
					required : '用户名不能为空'
				}, 
				password : {
                    required : '密码不能为空'
                },
                s_randomCode : {
                    required : '验证码不能为空',
                    remote : '验证码错误'
                }
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
		$("#loginName").focus();
		
	});

	jQuery(function($) {
		 $(document).on('click', '.toolbar a[data-target]', function(e) {
			e.preventDefault();
			var target = $(this).data('target');
			$('.widget-box.visible').removeClass('visible');//hide others
			$(target).addClass('visible');//show target
		 });
	});

	function autoResizeImage(maxWidth, maxHeight, objImg) {
		var img = new Image();
		img.src = objImg.src;
		var hRatio;
		var wRatio;
		var Ratio = 1;
		wRatio = maxWidth / img.width;
		hRatio = maxHeight / img.height;
		if (maxWidth == 0 && maxHeight == 0) {
			Ratio = 1;
		} else if (maxWidth == 0) {
			if (hRatio < 1)
				Ratio = hRatio;
		} else if (maxHeight == 0) {
			if (wRatio < 1)
				Ratio = wRatio;
		} else if (wRatio < 1 || hRatio < 1) {
			Ratio = (wRatio <= hRatio ? wRatio : hRatio);
		}
		if (Ratio < 1) {
			img.width = img.width * Ratio;
			img.height = img.height * Ratio;
		}
		objImg.height = img.height;
		objImg.width = img.width;
	}
</script>
</head>
<body class="login-layout">
	<div class="main-container">
		<div class="main-content">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="login-container">
						<div class="center">
							<h1>
								<span class="text">汇医网网站后台</span>
							</h1>
						</div>
						<div class="space-6"></div>
					
						<div class="position-relative">
							<div id="login-box"
								class="login-box visible widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header blue lighter bigger">
											<i class="ace-icon fa fa-coffee green"></i> 请输入您的登录信息
										</h4>
										<div class="alert alert-danger" id="messageBox">${message }</div>
										<div class="space-6"></div>
										<form  action="${dynamicDomain}/login/in" id="loginForm" method="post">
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right">
													 <input type="text" class="form-control" name="loginName" id="loginName" placeholder="用户名" />
													<i class="ace-icon fa fa-user"></i>
												</span>
												</label> 
												<label class="block clearfix">
												 <span class="block input-icon input-icon-right">
												 <input type="password" class="form-control" name="password" placeholder="密码" /> 
												 	<i class="ace-icon fa fa-lock"></i>
												</span>
												</label>
												<label class="block clearfix">
													 <span class="block input-icon input-icon-right">
														<img src="../validate.code" style="height:34px;width:100px;vertical-align: middle;" id="kaptchaImage" >
														<input type="text"  id="s_randomCode" name="s_randomCode" style="vertical-align: middle;height: 34px;width: 183px;"   placeholder="<jdf:message code="common.login.randomCode"/>"/>
													</span>
												</label>
												<div class="clearfix">
													<button type="submit"
														class="width-35 pull-right btn btn-sm btn-primary">
														<i class="ace-icon fa fa-key"></i> <span
															class="bigger-110">登录</span>
													</button>
												</div>

												<div class="space-4"></div>
											</fieldset>
										</form>
									</div>
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.login-box -->
						</div>
						<!-- /.position-relative -->

						<div class="navbar-fixed-top align-right">
						</div>
					</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->
</body>
<jdf:themeFile file="admin.js" />
</html>