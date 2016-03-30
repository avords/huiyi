<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
	$(document).ready(function () {
		//获取企业所属产品的总分类
		/**$.ajax({
			url : "${dynamicDomain}/home/company/getProductsByCompanyId/${company.objectId}",
			type : 'post',
			dataType : 'json',
			success : function(json) {
				if(json.result){
					var temp = '';
					for(i=0;i<json.categories.length;i++){
						temp+='<li>'
						+'<a href="${dynamicDomain}/home/search?type=1&data-value=supplierId:${company.objectId}&data-value='+json.fieldName+':'+
						json.categories[i].nameZh+'">'
						+json.categories[i].nameZh
						+'</a></li>';
					}
					$("#productList").append(temp);
				}
			}
		});*/
		$('#detail1').hide();
		$('#detail2').hide();
		
		//企业描述的省略
	 	var text = document.getElementById('desc');
        str = text.innerHTML;
        
        textLeng = 130;
        if(str.length > textLeng ){
              text .innerHTML = str.substring(0,textLeng )+"...";
              $('#detail1').show();
        } 
       
        var text2 = $('#desc2');
        var temp = document.getElementById('desc2');
	    if(temp!=null){
	        str2 = temp.innerHTML;
        	if(str2.length > textLeng ){
        		temp .innerHTML = str2.substring(0,textLeng )+"...";
        		$('#detail2').show();
          	} 
        }
	});

	function detail1(){
		var text = document.getElementById('desc');
        text .innerHTML=str;
        $('#detail1').hide();
	}
	
	function detail2(){
		var text = document.getElementById('desc2');
        text .innerHTML=str;
        $('#detail2').hide();
	}
</script>
	<!--=== 企业header ===-->
    <div class="header_logo clearfix">
      <div class="news-pic"> <img src="${dynamicDomain }/${company.logoAddress}">
        <dl>
          <dt><huiyi:i18n name="name" object="${company}"/></dt>
          <dd><div id="desc">${company.txtDescription}</div><a href="javascript:void(0)" id="detail1" onclick="detail1();" class="color-red"><jdf:message code="company_description" /></a></dd>
        </dl>
      </div>
      <c:if test="${company.level==1}">
      <div class="group">
        <div class="group_img"> <img src="${dynamicDomain }/static/assets/img/group_img3.png"> </div>
        <div class="group_content">
          <p><strong style="line-height:37px;"><jdf:message code="company_ordinary" /></strong></p>
        </div>
      </div>
	  </c:if>
	  <c:if test="${company.level==2}">
      <div class="group">
        <div class="group_img"> <img src="${dynamicDomain }/static/assets/img/group_img1.png"> </div>
        <div class="group_content">
          <p><strong style="line-height:37px;"><jdf:message code="company_gold" /></strong></p>
        </div>
      </div>
	  </c:if>
	  <c:if test="${company.level==3}">
      <div class="group">
        <div class="group_img"> <img src="${dynamicDomain }/static/assets/img/group_img4.png"> </div>
        <div class="group_content">
          <p><strong style="line-height:37px;"><jdf:message code="company_vip" /></strong></p>
        </div>
      </div>
	  </c:if>
      <c:if test="${company.isCheck==1}">
      <div class="group">
        <div class="group_img"> <img src="${dynamicDomain }/static/assets/img/group_img2.png"> </div>
        <div class="group_content">
          <p><strong style="line-height:37px;"><jdf:message code="company_audited_supplier" /></strong></p>
        </div>
      </div>
      </c:if>
    </div>
    <!--=== End 企业header ===--> 
    
    <!--=== 主导航 ===-->
    <div class="navBg clearfix">
      <ul id="nav" class="nav clearfix">
        <li class="nLi on">
          <h3><a href="${dynamicDomain}/home/company/index/${company.objectId}"><jdf:message code="menu_home" /></a></h3>
        </li>
        <li class="nLi">
          <h3><a href="${dynamicDomain}/home/company/product/${company.objectId}"><jdf:message code="menu_supply_product" /></a></h3>
          <!-- <ul class="sub" id="productList">
          </ul> -->
        </li>
        <li class="nLi">
          <h3><a href="${dynamicDomain}/home/company/contact/${company.objectId}"><jdf:message code="contact_us" /></a></h3>
        </li>
        <li class="nLi">
          <h3><a href="${dynamicDomain}/home/company/certificates/${company.objectId}"><jdf:message code="company_show" /><i class="fa fa-sort-desc"></i></a></h3>
          <ul class="sub">
            <li><a href="${dynamicDomain}/home/company/certificates/${company.objectId}"><jdf:message code="company_certificate" /></a></li>
            <!-- li><a href="${dynamicDomain}/home/company/bulletin/${company.objectId}"><jdf:message code="company_public" /></a></li>
            <li><a href="${dynamicDomain}/home/company/video/${company.objectId}"><jdf:message code="company_video" /></a></li> -->
          </ul>
        </li>
        <li class="nLi">
          <h3><a href="${dynamicDomain}/home/company/exhibition/${company.objectId}"><jdf:message code="company_exhibition" /></a></h3>
        </li>
      </ul>
    </div>
    <!--=== End 主导航 ===--> 