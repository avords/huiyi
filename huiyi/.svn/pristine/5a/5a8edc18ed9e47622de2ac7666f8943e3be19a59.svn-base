//function range : judge the validity of must,number and email and checkbox最多能选几项以及至少得选一项
//how to use desc:1. to the 必填's text,add the attribute ---id="must" in the text
//2. to the 必数字项,add the attribute ---isnumb="true" in the text
//3. to if the email is valid,add the attribute ---isemail="true"
function checkform(form){
	var FormObj = form.elements;
	var iFlag=0;
	for(i=0;i<FormObj.length;i++){
		if(FormObj[i].className=="Error") FormObj[i].className="";
	}
	for(i=0;i<FormObj.length;i++){
	  //必填的文本框
	  if( FormObj[i].id == "must"){
		  if(FormObj[i].value == "")
	   	{
			FormObj[i].className="Error";
			iFlag++;
	   	}else{
			FormObj[i].className="ok";
		}
	  }
	 //必填的文本域的判断
	  if(FormObj[i].type == "textarea"&&FormObj[i].id == "must"){
		  if(FormObj[i].value == "")
	   	{	
//			FormObj[i].style.background="RED";
			iFlag++;
	   	}else{
//			FormObj[i].style.background="FFFFCC";
		}
	  }
	//必填的下拉框的判断
	  if(FormObj[i].type == "select-one" && FormObj[i].id == "select" ){
		  if(FormObj[i].value == "")
	   	{
			FormObj[i].className="Warning";
			iFlag++;
	   	}else{
			FormObj[i].className="ok";
		}
	  }
	 //必选的文件
	 if(FormObj[i].type == "file" && FormObj[i].mustfile == "must" ){
		  if(FormObj[i].value == "")
	   	{
			FormObj[i].className="Error";
			iFlag++;
	   	}else{
			FormObj[i].className="ok";
		}
	  }
 	 //hidden必须不为空 add by zcm 2004-5-11
	 if(FormObj[i].type == "hidden" && FormObj[i].musthid == "must" && FormObj[i].value == "")
		  	{
		  		FormObj[i].className="Error";
				iFlag++;
		  	}
	  if(FormObj[i].value !="" && FormObj[i].isnumb == "true"){
		  if(isNumberString(FormObj[i].value,"1234567890.")!=1)
	   	{
			FormObj[i].className="Error";
			iFlag++;
	   	}else{
			FormObj[i].className="ok";
		}
	  }
	  //必须大于几个字符
	  if(FormObj[i].value !="" && FormObj[i].value.length<FormObj[i].morethan){
		  if(FormObj[i].value.length<FormObj[i].morethan)
	   	{
			FormObj[i].className="Error";
			iFlag++;
	   	}else{
			FormObj[i].className="ok";
		}
	  }
	  //必须等于几个字符
	   if(FormObj[i].value !="" && FormObj[i].equal == "true" ){
		  if(FormObj[i].value.length!=FormObj[i].equalto)
	   	{
			FormObj[i].className="Error";
			iFlag++;
	   	}else{
			FormObj[i].className="ok";
		}
	  }
	  // if is the valid eamil	  	
	   if(FormObj[i].value !="" && FormObj[i].isemail == "true"){
	  	if(FormObj[i].value.indexOf("@") == -1 || FormObj[i].value.indexOf(".") == -1)
		  	{
		  		FormObj[i].className="Error";
				iFlag++;
		  	}else{
			FormObj[i].className="ok";
			continue;
		}
	   }
	
	}//end for
	return iFlag;
}
//if is the number
function isNumberString (InString,RefString) {
	if(InString.length==0) return (false);
	for (Count=0; Count < InString.length; Count++)  {
		TempChar= InString.substring (Count, Count+1);
		if (RefString.indexOf (TempChar, 0)==-1)  
		return (false);
	}
	return (true);
}
var submitcount = 0; //更新计数
//校验时间
function subform(isform) {
 //更新控制
  if(submitcount>0) {
    alert("当前界面内的数据已经提交，请等待服务器的处理和下一界面的出现。");
    return false;
  }
  submitcount++;
	if(checkform(isform)>0){
		submitcount = 0;
		alert("输入没有满足要求，请重新输入数据！");
		ProcessMsg(0);
	}else{
		ProcessMsg(1);
		isform.submit();
	}
}
function selectMove() {
	$(document).ready(function(){
		$('#leftToRight').click(function(){
			var $options = $('#selected option:selected');
			var $remove = $options.remove();
			$remove.appendTo('#unSelected');
		});

		$('#rightToLeft').click(function(){
			var $removeOptions = $('#unSelected option:selected');
			$removeOptions.appendTo('#selected');
		});

		$('#allLeftToRight').click(function(){
			var $options = $('#selected option');
			$options.appendTo('#unSelected');
		});

		$('#allRightToLeft').click(function(){
			var $options = $('#unSelected option');
			$options.appendTo('#selected');
		});

		$('#selected').dblclick(function(){
			var $options = $('option:selected', this);
			$options.appendTo('#unSelected');
		});

		$('#unSelected').dblclick(function(){
			$('#unSelected option:selected').appendTo('#selected');
		});
	});
}