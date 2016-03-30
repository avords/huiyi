<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<%@page import="com.mvc.framework.util.DomainUtils"%>
<html>
<head>
<link rel="stylesheet" href="${dynamicDomain}/static/assets/css/member.css">
<jdf:themeFile file="jquery.min.js"/>
<jdf:themeFile file="jquery.validate.min.js" />
<jdf:themeFile file="additional-methods_zh.js" />
<jdf:themeFile file="common.js" />
<jdf:themeFile file="jquery.SuperSlide.2.1.1.js" />
<jdf:themeFile file="jquery.validate_zh.js" />
<jdf:themeFile file="jquery.validate_en.js" />
<jdf:themeFile file="ajaxfileupload.js" />
<title><jdf:message code="menu_member_account" /></title>
</head>
<body>
<div class="container member">
	<%@ include file="common/member_left.jsp"%>
   <div class="merberBody">
      <div class="tag-box tag-box-v3 form-page" style="min-height:485px;"> 
        <!--Inputs-->
        <div class="headline">
          <h3><jdf:message code="label_account_modifyPassword" /></h3>
        </div>
        <div class="row margin-bottom-40">
         <form method="post" action="${dynamicDomain}/member/savePassword?ajax=1" class="form-horizontal" id="editForm">
          <div class="col-md-12">
              <div class="form-group">
                <label for="newPassword" class="col-md-2 control-label"><jdf:message code="menu_member_new_password" /></label>
                <div class="col-md-4">
                  <input type="password" class="form-control" name="newPassword" id="newPassword" >
                </div>
              </div>
          </div>
          <div class="col-md-12">
              <div class="form-group">
                <label for="confirmPassword" class="col-md-2 control-label"><jdf:message code="menu_member_confirm_password" /></label>
                <div class="col-md-4">
                  <input type="password" name="confirmPassword" id="confirmPassword" class="form-control">
                </div>
              </div>
          </div>
          <div class="col-md-6" style="text-align:right;"> 
            <button class="btn-u btn-u-blue btn-u-sm" type="button" onclick="info()"><jdf:message code="label_inquiry_submit" /></button>
            </div>
         </form>
        </div>
        
        <div class="headline">
          <h3><jdf:message code="label_account_modifyEmail" /></h3>
        </div>
        
        <div class="row margin-bottom-40">
        <form id="vForm" name="vForm" action="${dynamicDomain}/member/saveEmail?ajax=1" class="form-horizontal">
         <div class="col-md-12">
              <div class="form-group">
                <div class="col-md-4 col-md-offset-2">
                  <input type="email" id="email" name="email" placeholder="<jdf:message code="label_account_email_new" />"  class="form-control">
                </div>
                <div class="col-md-2" >
                  <button class="btn btn-success btn-sm" type="button" title="<jdf:message code="label_register_get_code"/>" onclick="getValidateCode(this)" style="width:100px"><jdf:message code="label_register_get_code"/></button>
                   </div>
                <span id="msg" style="color:red;font-size:14px;position: relative;top:5px;left:10px;width: 50px;">${message }</span>    
              </div>
          </div>
          <div class="col-md-12">
              <div class="form-group">
                <div class="col-md-4 col-md-offset-2">
                  <input type="text" class="form-control" placeholder="<jdf:message code="label_account_code" />"  id="tempCode" name="tempCode" >
                </div>
                <div class="col-md-2"> 
                  <button class="btn btn-warning btn-sm" id="save" type="button" onclick="submitForm()" style="width:100px;"><jdf:message code="label_inquiry_submit" /></button>
                  </div>
              </div>
          </div>
         </form>
        </div>
      </div>
    </div>
 </div>
	<script type="text/javascript">
	$(document).ready(function(){
		$('#modifyAccount').addClass("active");
		$("#editForm").validate({
			rules:{
				newPassword:{required:true,maxlength:64},
				confirmPassword:{required:true,equalTo:'#newPassword'}
			},
			
		messages : {
			newpassword : {
				required : '<jdf:message code="label_register_email_null"/>'
			},
			confirmPassword: {
				required : '<jdf:message code="label_register_email_null"/>',
				equalTo : '<jdf:message code="label_register_password"/>'
			},
		},
		
		});
		refreshParentPage(false);
	});
	
	function info(){
		if ($("#newPassword").val() =='') {
			alert("<jdf:message code="label_account_p_new" />");
			return false;
		} 
		if ($("#confirmPassword").val() =='') {
			alert("<jdf:message code="label_account_p_new" />");
			return false;
		}
		$("#editForm").submit();
		alert("<jdf:message code="label_account_info" />");
		
	}
	
	 /*验证码 */
		var countdown =60;
		function settime(obj) {
			if (countdown == 0) {
				obj.removeAttribute("disabled");
				document.getElementById("msg").innerHTML = "";
				obj.innerHTML = "<jdf:message code="label_register_get_code"/>";
				countdown =60;
				return;
			} else {
				obj.setAttribute("disabled", true);
				obj.innerHTML = "<jdf:message code="label_account_count"/>(" + countdown + ")";
				countdown--;
			}
			setTimeout(function() {
				settime(obj)
			}, 1000)
		}
		
		var tempCode;
		var reg=/[\w\d]@[\w\.\d]/;
		function getValidateCode(obj) {
			var email = $("#email").val();
			if (email != ""&&reg.test(email)) {
				$.ajax({
					url : "${dynamicDomain}/home/register/sendEmailTo",
					type : 'post',
					dataType : 'json',
					data : {
						'email' : email
					},
					success : function(json) {
						if (json.flag) {
							tempCode = json.tempCode;
							var temp = json.message;
							var x = document.getElementById("msg");
							x.innerHTML = temp;
							settime(obj);
						} else {
							var temp = json.message;
							alert(temp);
						}
					}
				});
			}else {
				alert("<jdf:message code="label_account_right"/>");
				return false;
			}
		}

		function submitForm() {
			var tempCodeOfForm = $("#tempCode").val();
			if (tempCode == tempCodeOfForm && tempCodeOfForm != "") {
				$("#vForm").submit();
				alert("<jdf:message code="label_account_info2" />");
			} else {
				alert("<jdf:message code="label_account_right2" />");
				return;
			}
		}
	</script>
</body>
</html>