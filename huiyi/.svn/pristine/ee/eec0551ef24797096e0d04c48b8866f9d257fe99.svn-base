// 顶栏下拉
jQuery("#headTop").slide({ 
	type:"menu",// 效果类型，针对菜单/导航而引入的参数（默认slide）
	titCell:".dropdown", //鼠标触发对象
	targetCell:".dropmenu", //titCell里面包含的要显示/消失的对象
	effect:"slideDown", //targetCell下拉效果
	delayTime:150 , //效果时间
	triggerTime:0, //鼠标延迟触发时间（默认150）
	returnDefault:false //鼠标移走后返回默认状态，例如默认频道是“预告片”，鼠标移走后会返回“预告片”（默认false）
});

// 搜索
jQuery("#headSearch").slide({ 
	type:"menu",
	titCell:".searchTag",
	targetCell:".sub",
	effect:"slideDown",
	delayTime:150 ,
	triggerTime:0,
	returnDefault:true 
});

$(function(){
	$('.searchTag li').click(function() {
		$('.sel').html($(this).text() + '<span class="arrow-down"></span>');
		$('.searchTag .sub').hide();
	});
});

// 导航
jQuery("#nav").slide({ 
	type:"menu",
	titCell:".nLi",
	targetCell:".sub",
	effect:"slideDown",
	delayTime:150 ,
	triggerTime:0,
	defaultPlay:false,
	returnDefault:false 
});

// 首页焦点图
jQuery(".slideBox").slide({mainCell:".bd ul",effect:"fold",autoPlay:true,delayTime:1000});
