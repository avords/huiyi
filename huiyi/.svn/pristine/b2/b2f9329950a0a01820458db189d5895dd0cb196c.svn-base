function scroll(obj) {
	var tmp = (obj.scrollLeft)++;
	if (obj.scrollLeft==tmp) obj.innerHTML += obj.innerHTML;
	if (obj.scrollLeft>=obj.firstChild.offsetWidth) obj.scrollLeft=0;
}
function aa(){
	clearInterval(a);
}
function b(){
	a=setInterval("scroll(document.getElementById('scrollobj'))",20);
}
if(!/^\s*$/.test($('#scrollobj').html())){
 var a = setInterval("scroll(document.getElementById('scrollobj'))",20);
}