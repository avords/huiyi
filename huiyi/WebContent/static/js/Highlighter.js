/**
* 关键词高亮动态解析
*
* @author Saturn
* @since  1.0.0
* @return void
*/
var Highlighter={
	highlight:
		function(b,a){
			b=b.replace(/(^\s*)|(\s*$)/g,"");
			if(!b||b.length==0){
				return;
			}
			var c=new RegExp("("+b.split(/\s+/).join("(?!;)|")+"(?!;))","ig");
			
			if("undefined"==typeof(a)){return;}
			console.log(c);
			for(i in a){
				
				if(a[i].innerHTML){a[i].innerHTML=a[i].innerHTML.replace(c,'<span style="color:#c00;font-size:1em;font-weight:inherit">$1</span>');}
				
			}
			
		}
};