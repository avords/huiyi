<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<html>
<head>
<title>企业首页</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${dynamicDomain}/static/assets/css/company.css">
<link rel="stylesheet" href="${dynamicDomain}/static/assets/css/company-colorbox.css">
<link rel="stylesheet" href="${dynamicDomain}/static/assets/css/prettyPhoto.css">
<jdf:themeFile file="jquery.validate.min.js" />
<jdf:themeFile file="additional-methods_zh.js" />
<jdf:themeFile file="jquery.validate_zh.js" />
<jdf:themeFile file="jquery.prettyPhoto.js" />
<jdf:themeFile file="cfam.js" />
</head>

<body>
<div class="wrapper"> 
  
  <!--=== 企业首页 ===-->
  <div class="container companyIndex"> 
  	<%@ include file="common/companyHeader.jsp"%>
  
    <div class="Introduce clearfix"> 
      <!--=== 公司简介 ===-->
      <div class="news" style="width:350px;">
        <div class="title">
          <h3>荣誉证书</h3>
        </div>
        <div class="news-pic" style="padding:35px;"> <img src="${dynamicDomain}/static/assets/img/rongyuzhengshu.jpg" style="height:330px;">
          <div class="clearfix"></div>
        </div>
      </div>
      <!--=== End 公司简介 ===--> 
      
      <!--=== 公司概况 ===-->
      <div class="brand" style="width:818px;min-height:500px;">
      		<div class="page-content">
			<div class="row">
			<c:forEach items="${certificateFiles }" var="certificateFile" varStatus="status">
				<div class="col-xs-6 col-sm-4 col-md-3 image-gallery image-gallery">
					<a class="prettyphoto info-thumbnail-link" rel="prettyPhoto[gallery]" href="${dynamicDomain}/${certificateFile.filePath}">
						<div class="thumbnail info-thumbnail background-clouds color-text">
							<div class="service">
								<div class="service-name">
									<h3>
										<span class="glyphicon glyphicon-picture"></span><br> 
										<span style="font-size: 15px;"></span>
									</h3>
								</div>
							</div>
							<div>
								<img class="img-responsive img-thumbnail" style="height: 135px;width: 190px;" src="${dynamicDomain}/${certificateFile.filePath}" alt="">
							</div>
						</div>
					</a>
				</div>
			</c:forEach>	
			</div>
			<!--//page-row-->
		</div>
      </div>
      <!--=== End 公司概况 ===--> 
    </div>
    
    
  </div>
  <!--=== End 企业首页 ===--> 
  
<!-- 新增插件 SuperSlide --> 
<script type="text/javascript" src="${dynamicDomain}/static/assets/js/jquery.jqzoom.js"></script>
<script type="text/javascript">
    // 导航
    jQuery("#nav").slide({ 
        type:"menu",
        titCell:".nLi",
        targetCell:".sub",
        effect:"slideDown",
        delayTime:150 ,
        triggerTime:0,
        returnDefault:true 
    });
    jQuery(".picFocus").slide({ mainCell:".bd ul",effect:"left",autoPlay:true });
    
   	function sendMessage() {
   		$("#msg").text("");
   		var flag = $("#sendForm").valid();
   		if(!flag){
   			return false;
   		}
        var params = $("#sendForm").serialize();
		$.ajax({
			url : "${dynamicDomain}/home/company/saveCompanyMessage",
			type : 'post',
			dataType : 'json',
			data : params,
			success : function(json) {
				if(json.result){
					$("#title").val("");
					$("#content").val("");
					var temp = '发送成功';
					var x = document.getElementById("msg");
					x.innerHTML = temp;
				}
			}
		});
   	}
    
</script> 

</body>
</html>