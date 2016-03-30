<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<html>
<head>
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
<!-- JS Global Compulsory -->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-75235264-1', 'auto');
  ga('send', 'pageview');

</script>
<script type="text/javascript" src="${staticDomain}assets/js/jquery.min.js"></script>
<script type="text/javascript" src="${staticDomain}assets/js/jquery-migrate.min.js"></script>
<script type="text/javascript" src="${staticDomain}assets/plugins/bootstrap/js/bootstrap.min.js"></script>

<!-- JS Implementing Plugins -->
<script type="text/javascript" src="${staticDomain}assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="${staticDomain}assets/plugins/smoothScroll.js"></script>
<script type="text/javascript" src="${staticDomain}assets/plugins/jquery.parallax.js"></script>

<jdf:themeFile file="jquery.validate.min.js" />
<jdf:themeFile file="jquery.validate_zh.js" />

<!-- 新增插件 SuperSlide -->
<script type="text/javascript" src="${staticDomain}assets/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript">
	var processMessage = "<jdf:message code="system.lable.process"/>";
	var sureToDelete="<jdf:message code="common.js.sureToDelete"/>";
	var appRoot = "${dynamicDomain}";
</script>
<!-- colorbox -->
<jdf:themeFile file="css/colorbox.css" />
<jdf:themeFile file="jquery.colorbox.min.js" />

<title><decorator:title default="Welcome!" /></title>
<decorator:head />
</head>
<body>
<div class="wrapper"> 
  <!--=== Header v4 ===-->
  <div class="header-v4"> 
    <%@ include file="common/header.jsp"%>
    <!-- End Navbar --> 
    <!-- Navbar -->
	<div class="navbar navbar-default mega-menu">
		<div class="container">
			<div class="navbar-header">
				<div class="row">
					<div class="col-xs-3"> <a class="navbar-brand logo" href="${dynamicDomain}/home"></a> </div>
					<div class="col-xs-9">
						<div class="rightSearch">
							<div class="row">
								<div class="col-xs-10">
									<form style="border: 2px solid #6499d2;lear: both; overflow: hidden;" action="${dynamicDomain}/home/search" method="post" id="searchForm" onsubmit="return validQuery();">
										<div class="form-group">
											<select class="form-control" name="type">
												<option value="1"><jdf:message code="label_product"/></option>
												<option value="2"><jdf:message code="label_supplier"/></option>
											</select>
										</div>
										<div class="form-group">
											<label class="sr-only"></label><input type="text" name="queryWords" class="form-control" placeholder="<jdf:message code='lable_home_look_for'/>" size="66" value="${page.queryWord }">
										</div>
										<button class="btn-u btn-u-dark-blue pull-right" type="submit" id="searchButton"><jdf:message code="btn_search"/></button>
									</form>
									<p><span class="tag"><jdf:message code="label_index_search_words"/>:</span>
										<c:forEach items="${searchKeyWord}" var="item">
										<c:if test="${item.nameZh != null}">
											 <a href="${dynamicDomain}/home/search?queryWords=${item.nameZh}&type=1">${item.nameZh}</a>
										</c:if>
										</c:forEach>
										<span class="yh"><a href="${dynamicDomain}/home/servicesList/1?ajax=1" class="colorbox-large"><jdf:message code="label_service_for_buyer"/></a><a href="${dynamicDomain}/home/servicesList/2?ajax=1" class="colorbox-large"><jdf:message code="label_service_for_supplier"/></a></span>
									</p>
								</div>
								<div class="col-xs-2">
									<a href="#myModal" onclick="pageInit();" data-toggle="modal" data-target="#myModal" class="btn-u btn-brd btn-u-orange pull-right">
										<i class="fa fa-file-text-o color-orange"></i> <span class="color-orange"><jdf:message code="btn_inquiry"/></span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="collapse navbar-collapse">
			<div class="container">
				<ul class="nav navbar-nav" id="navbar">
					<li role="home"><a href="${dynamicDomain}/home"><jdf:message code="menu_home"/></a></li>
					<li role="products"><a href="${dynamicDomain}/home/products"><jdf:message code="menu_product_directory"/></a></li>
					<li role="productServices"><a href="${dynamicDomain}/home/productServices"><jdf:message code="menu_service_directory"/></a></li>
					<li role="inquireList"><a href="${dynamicDomain}/home/inquireList"><jdf:message code="menu_inquiry_list"/></a></li>
					<li role="services"><a href="${dynamicDomain}/home/services"><jdf:message code="menu_platform_service"/></a></li>
					<li role="jszs"><a href="${dynamicDomain}/home/article/jszs"><jdf:message code="menu_technique_article"/></a></li>
				</ul>
			</div>
		</div>
	</div>
  	<!-- End Navbar --> 
  </div>
  <!--=== End Header v4 ===-->
  <decorator:body/>
  <%@ include file="common/footer.jsp"%>
</div>
<jdf:form bean="entity" scope="request">
<form id="inquiry" method="post" action="${dynamicDomain}/member/releaseInquiry" class="form-horizontal" >
<input type="hidden" name="productId" value="0">
<!-- 发布询盘弹窗 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><jdf:message code="btn_inquiry"/></h4>
      </div>
      <div class="modal-body" id="modal-body">
        <div class="form-group">
            <label class="col-lg-3 control-label"><span class="red">* </span><jdf:message code="label_inquiry_fromCompany"/></label>
            <div class="col-lg-8">
              <input type="text" class="form-control" name="companyName" value="${companyName}" readonly="readonly">
            </div>
        </div>
          <div id="inquireList">
		         
		  </div>      
         <div class="form-group">
            <label class="col-lg-3 control-label"></label>
            <div class="col-lg-4">
              <button type="button" onclick="addProductInquire();" class="btn btn-success"><jdf:message code="label_inquiry_add_more"/></button>
            </div>
          </div>
          <!--  
          <div class="form-group">
            <label for="country" class="col-lg-3 control-label"></label>
            <div class="col-lg-8">
              <div class="checkbox">
                <label>
                  <input type="checkbox"><jdf:message code="label_inquiry_accept_all_clause"/>
				</label>
              </div>
            </div>
          </div>
          -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><jdf:message code="label_inquiry_cancel"/></button>
        <button type="submit" class="btn btn-primary"><jdf:message code="label_inquiry_submit"/></button>
      </div>
    </div>
  </div>
</div>
</form>
</jdf:form>
<div id="template" style="display: none;">
		<div class="form-group">
            <label class="col-lg-3 control-label"><span class="red">* <jdf:message code="label_inquiry_product_name"/></span></label>
            <div class="col-lg-8">
              <input type="text" class="required form-control" name="productName">
            </div>
        </div>
		<div class="form-group">
            <label class="col-lg-3 control-label"><span class="red">* </span><jdf:message code="label_inquiry_description"/></label>
            <div class="col-lg-8">
              	<textarea class="required form-control" rows="3" name="description" maxlength="2000"></textarea><br>
        	</div>
        </div>
        <div class="form-group">
            <label  class="col-lg-3 control-label"><span class="red">* </span><jdf:message code="label_inquiry_type"/></label>
            <div class="col-lg-4">
              <select class="required form-control"  name="categoryId" id="categorys_0" onchange="categorySelect(this);">
              	<option value="">-<jdf:message code="label_inquiry_choose"/>-</option>
                <jdf:selectCollection items="menuProduct" optionValue="objectId"  optionText="nameZh" />
              </select>
            </div>
            <div class="col-lg-4">
              <select class="required form-control"  name="secondCategoryId" id="secondCategoryIds_0">
              	<option value="">--</option>
              </select>
            </div>
         </div>
         <div class="form-group">
            <label class="col-lg-3 control-label"><span class="red">* <jdf:message code="label_inquiry_quantity"/></span></label>
            <div class="col-lg-4">
              <input type="text" class="required form-control" placeholder="<jdf:message code="label_inquiry_quantity"/>" name="quantity">
            </div>
            <div class="col-lg-2">
              <select class="required form-control" name="unit">
					<jdf:select dictionaryId="1503"  />
              </select>
            </div>
          </div>
 </div>         
<!-- 发布询盘弹窗 end -->
<!-- JS Customization -->
<script type="text/javascript" src="${staticDomain}assets/js/custom.js"></script>
<script type="text/javascript" src="${staticDomain}assets/js/jquery.jqzoom.js"></script>

<!-- JS Page Level -->
<script type="text/javascript" src="${staticDomain}js/jquery.cookie.js"></script>
<script type="text/javascript" src="${staticDomain}js/common.js"></script>

<script type="text/javascript">
function validQuery(){
   
    return true;
}
	var i = 0;
	jQuery(document).ready(function() {
		$(".colorbox-large").colorbox({ width: "80%", height:"80%", close: "关闭", overlayClose: false});
	 
   		$('#inquiry').validate();
     	//App.init();
     	url = window.location.pathname;
 	    var navs = $("#navbar li");
 	    for(i=navs.length-1;i>=0;i--){
 	    	var menu = $(navs[i]);
 	    	 if(url.endsWith(menu.attr("role"))>0){
 	    		menu.addClass("active");
 	    		break;
 	        }
 	    }
 	    $('select[name="type"]').val(${param.type});
  	    
    });
  //产品目录下拉联动产品下拉
  function categorySelect(object){
	  var categoryId = object.value;
	  var id = object.id;
	  id = id.substr(id.indexOf("_"),id.length);
        //清除二级下拉列表
        	$("#secondCategoryIds"+id).empty();
        	$("#secondCategoryIds"+id).append("<option value=''>--</option>");
        //要请求的二级下拉JSON获取页面
            	$.ajax({
            			url: "${dynamicDomain}/home/getSecondCategoryByFisrt?categoryId="+categoryId,
            			type : 'post',
            			dataType : 'json',
            			success :function (data) {
            			 //对请求返回的JSON格式进行分解加载
            			  for(var i=0;i<data.categories.length;i++){
                          	$("#secondCategoryIds"+id).append("<option value='" +data.categories[i].objectId + "'>" + data.categories[i].nameZh+"</option>");
            			  }
            			}
   	 			});
    }
    
    function pageInit(){
    	i = 0;
    	var template = $("#template").html();
    	$("#inquireList").html(template);
    }
    function addProductInquire(){
    	i=i+1;
    	$("#template").find('select[name="categoryId"]').attr("id","categorys_"+i);
    	$("#template").find('select[name="secondCategoryId"]').attr("id","secondCategoryIds_"+i);
    	var template = $("#template").html();
    	$("#inquireList").append(template);
    }
</script>
</script>
<!--[if lt IE 9]>
    <script src="${staticDomain}assets/plugins/respond.js"></script>
    <script src="${staticDomain}assets/plugins/html5shiv.js"></script>
    <script src="${staticDomain}assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>