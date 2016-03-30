function CkeckPageNum(page){
	var reg=/^[0-9]*$/;
	if(reg.test(page)==false||page<1){
		alert("你输入的页码不规范");
		$("#page").val(document.forms.ec.ec_p.value);
		$("#page").focus();
		return false;
	}else{
		return true;
	}
}
function toPage(type){
	if(type=="next"){
		var currentPage = parseInt(document.forms.ec.ec_p.value)+1;
		if(currentPage <= maxPage){
			document.forms.ec.ec_eti.value="";
			document.forms.ec.ec_p.value = currentPage;
			document.forms.ec.page.value = currentPage;
		}
	}else if(type=="last"){
		document.forms.ec.ec_eti.value="";
		document.forms.ec.ec_p.value=maxPage;
		document.forms.ec.page.value =maxPage;
	}else if(type=="prev"){
		var currentPage = parseInt(document.forms.ec.ec_p.value)-1;
		if(currentPage > 0){
			document.forms.ec.ec_eti.value="";
			document.forms.ec.ec_p.value=currentPage;
			document.forms.ec.page.value = currentPage;
		}
	}else if(type=="first"){
		document.forms.ec.ec_eti.value="";
		document.forms.ec.ec_p.value=1;
		document.forms.ec.page.value = 1;
	}else{
		if(CkeckPageNum(type)){
			if(eval(type)>eval(maxPage)){
				alert("你输入的页码过大");
				$("#page").val(document.forms.ec.ec_p.value);
				return;
			}else{
				document.forms.ec.ec_eti.value="";
				document.forms.ec.ec_p.value = type;
				document.forms.ec.page.value = type;
			}
		}else{
			return;
		}
	}
//	document.forms.ec.setAttribute('action','page?ajax=1&siteId='+$(#siteId).val());
	document.forms.ec.setAttribute('method','post');
	document.forms.ec.submit();
}
var imgUrl = appRoot + "/static/theme/d/img/table";
if(maxPage == 1){
	$("#first").replaceWith("<img id='first' src='"+ imgUrl +"/firstPage.gif' style='border: 0' title='第一页' />");
	$("#prev").replaceWith("<img id='prev' src='"+ imgUrl +"/prevPage.gif' style='border: 0' title='上一页'/>");
	$("#next").replaceWith("<img id='next' src='"+ imgUrl +"/nextPage.gif' style='border: 0' title='下一页'/>");
	$("#last").replaceWith("<img id='last' src='"+ imgUrl +"/lastPage.gif' style='border: 0' title='最后页'/>");
}else if(currentPage == maxPage && maxPage!=1){
	$("#first").replaceWith("<img id='first' src='"+ imgUrl +"/firstPage11.gif' onclick='javascript:toPage(\"first\");' style='CURSOR: hand; border: 0' title='第一页' />");
	$("#prev").replaceWith("<img id='prev' src='"+ imgUrl +"/prevPage11.gif' onclick='javascript:toPage(\"prev\");' style='CURSOR: hand; border: 0' title='上一页'/>");
	$("#next").replaceWith("<img id='next' src='"+ imgUrl +"/nextPage.gif' style='border: 0' title='下一页'/>");
	$("#last").replaceWith("<img id='last' src='"+ imgUrl +"/lastPage.gif' style='border: 0' title='最后页'/>");
}else if(currentPage > 1 && parseInt(currentPage) < parseInt(maxPage)){
	$("#first").replaceWith("<img id='first' src='"+ imgUrl +"/firstPage11.gif' onclick='javascript:toPage(\"first\");' style='border: 0' title='第一页' />");
	$("#prev").replaceWith("<img id='prev' src='"+ imgUrl +"/prevPage11.gif' onclick='javascript:toPage(\"prev\");' style='border: 0' title='上一页'/>");
	$("#next").replaceWith("<img id='next' src='"+ imgUrl +"/nextPage11.gif' onclick='javascript:toPage(\"next\");' style='CURSOR: hand; border: 0' title='下一页'/>");
	$("#last").replaceWith("<img id='last' src='"+ imgUrl +"/lastPage11.gif' onclick='javascript:toPage(\"last\");' style='CURSOR: hand; border: 0' title='最后页'/>");
}else if(parseInt(currentPage) < parseInt(maxPage)){
	$("#first").replaceWith("<img id='first' src='"+ imgUrl +"/firstPage.gif' style='border: 0' title='第一页' />");
	$("#prev").replaceWith("<img id='prev' src='"+ imgUrl +"/prevPage.gif' style='border: 0' title='上一页'/>");
	$("#next").replaceWith("<img id='next' src='"+ imgUrl +"/nextPage11.gif' onclick='javascript:toPage(\"next\");' style='CURSOR: hand; border: 0' title='下一页'/>");
	$("#last").replaceWith("<img id='last' src='"+ imgUrl +"/lastPage11.gif' onclick='javascript:toPage(\"last\");' style='CURSOR: hand; border: 0' title='最后页'/>");
}
$(document).ready(function(){
	$("#submitForm").click(function() { 
		document.forms.ec.ec_eti.value="";
		document.forms.ec.ec_p.value=1;
		document.forms.ec.page.value = 1;
		$("#ec").submit(); 
	}); 
});