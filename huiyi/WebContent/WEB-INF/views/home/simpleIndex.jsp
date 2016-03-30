<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<html>
<head>
<title>首页</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- CSS Global Compulsory -->
<link rel="stylesheet" href="${staticDomain}assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${staticDomain}assets/css/style.css">

<!-- CSS Header and Footer -->
<link rel="stylesheet" href="${staticDomain}assets/css/header-v4.css">
<link rel="stylesheet" href="${staticDomain}assets/css/footer-v1.css">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="${staticDomain}assets/plugins/animate.css">
<link rel="stylesheet" href="${staticDomain}assets/plugins/line-icons/line-icons.css">
<link rel="stylesheet" href="${staticDomain}assets/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${staticDomain}assets/plugins/skyforms/css/sky-forms.css">
<link rel="stylesheet" href="${staticDomain}assets/plugins/skyforms/custom/custom-sky-forms.css">

<!-- CSS Theme -->
<link rel="stylesheet" href="${staticDomain}assets/css/theme-colors/default.css">
<link rel="stylesheet" href="${staticDomain}assets/css/theme-colors/dark-blue.css">

<!-- CSS Customization -->
<link rel="stylesheet" href="${staticDomain}assets/css/custom.css">
<link rel="stylesheet" href="${staticDomain}assets/css/index.css">
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-75235264-1', 'auto');
  ga('send', 'pageview');

</script>
<style>
.header-v4 {
	border: 0;
}

.minlogo {
	width: 1170px;
	text-align: center;
	margin: 100px 0 50px;
}

.form-control {
	height: 45px;
	font-size: 15px;
}

.footer-v1 {
	margin-top: 160px;
}

.min-nav {
	width: 800px;
	margin: 0 auto;
	padding-top: 40px;
}

.min-nav li {
	float: left;
	width: 145px;
	line-height: 18px;
	border-right: none !important;
	font-size: 16px;
	color: #3773b5;
}

.min-nav li a {
	color: #3773b5;
}

.min-nav li a:hover {
	color: #f30;
}
</style>
</head>

<body>
	<div class="wrapper">
		<!--=== Header v4 ===-->
		<div class="header-v4">
			<%@ include file="common/header.jsp"%>
			<!-- Navbar -->
			<div class="navbar navbar-default mega-menu">
				<div class="container">
					<div class="navbar-header">
						<div class="row">
							<div class="minlogo">
								<a href="#"><img src="${staticDomain}assets/img/logo.png"></a>
							</div>
							<div class="rightSearch">
								<div class="row">
									<div style="width: 800px; margin: 0 auto;">
										<form style="border: 2px solid #6499d2; width: 820px; clear: both; overflow: hidden;" action="${dynamicDomain}/home/search" method="post" id="searchForm" onsubmit="return validQuery();">
											<div class="form-group">
												<select class="form-control" name="type">
													<option value="1"><jdf:message code="label_product"/></option>
													<option value="2"><jdf:message code="label_supplier"/></option>
												</select>
											</div>
											<div class="form-group">
												<label class="sr-only">搜索条件</label> <input style="width: 600px;" name="queryWords" type="text" class="form-control" placeholder="<jdf:message code='lable_home_look_for'/>">
											</div>
											<button id="searchButton" class="btn-u btn-u-dark-blue pull-right" type="submit" style="width: 100px; height: 45px; font-size: 16px;"><jdf:message code="btn_search"/></button>
										</form>
									</div>
								</div>
							</div>
							<div class="min-nav">
								<ul>
									<li><a href="${dynamicDomain}/home/products"><jdf:message code="menu_product_directory"/></a></li>
									<li><a href="${dynamicDomain}/home/productServices"><jdf:message code="menu_service_directory"/> </a></li>
									<li><a href="${dynamicDomain}/home/inquireList"><jdf:message code="menu_inquiry_list"/> </a></li>
									<li><a href="${dynamicDomain}/home/services"><jdf:message code="menu_platform_service"/><i class="nav-hy"></i></a></li>
									<li><a href="${dynamicDomain}/home/article/jszs"><jdf:message code="menu_technique_article"/> </a></li>
									<%-- <li><a href="${dynamicDomain}/home/articleList?channelCode=ZHANHUI"> 展会 </a></li> --%>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End Navbar -->
		</div>
		<!--=== End Header v4 ===-->

		<!--=== Footer Version 1 ===-->
		<%@ include file="common/footer.jsp"%>
		<!--=== End Footer Version 1 ===-->
	</div>

	<!-- JS Global Compulsory -->
	<script type="text/javascript"
		src="${staticDomain}assets/js/jquery.min.js"></script>
	<script type="text/javascript" src="${staticDomain}assets/js/jquery-migrate.min.js"></script>
	<script type="text/javascript" src="${staticDomain}assets/plugins/bootstrap/js/bootstrap.min.js"></script>

	<!-- JS Implementing Plugins -->
	<script type="text/javascript" src="${staticDomain}assets/plugins/back-to-top.js"></script>
	<script type="text/javascript" src="${staticDomain}assets/plugins/smoothScroll.js"></script>
	<script type="text/javascript" src="${staticDomain}assets/plugins/jquery.parallax.js"></script>

	<!-- 新增插件 SuperSlide -->
	<script type="text/javascript" src="${staticDomain}assets/js/jquery.SuperSlide.2.1.1.js"></script>

	<!-- JS Customization -->
	<script type="text/javascript" src="${staticDomain}js/jquery.cookie.js"></script>
	<script type="text/javascript" src="${staticDomain}js/common.js"></script>

	<!-- JS Page Level -->
	<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->
   <script type="text/javascript">
   function validQuery(){
       var word = $('input[name="queryWords"]').val();
       if(word.trim()==''){
           alert('<jdf:message code="label_queryWord" />');
           return false;
       }
       return true;
   }
   </script>
</body>
</html>