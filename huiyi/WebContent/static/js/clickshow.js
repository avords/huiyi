$(document).ready(function(){
	$("#flower ul li input").click(function() {
		$("#flower ul li span").hide();
		$(this).parent("li").children("span").show();
	});
	$("#li_1 span").click(function() {
		var score = $(this).attr('class').substr(8,1);
		$('#li_1 .opinion strong').text(score+'分');
		$("input[name='comment_score']").val(score);
		$("#li_1 span").removeClass('star_img');
		for(var i=1;i<=score;i++){
			$("#li_1 .star_img"+i).addClass('star_img');
		}
	});
	$("#li_2 span").click(function() {
		var score = $(this).attr('class').substr(8,1);
		$('#li_2 .opinion strong').text(score+'分');
		$("input[name='comment_service']").val(score);
		$("#li_2 span").removeClass('star_img');
		for(var i=1;i<=score;i++){
			$("#li_2 .star_img"+i).addClass('star_img');
		}
	});
	$('.b_details_about').each(function(){
		$('.b_details_about:odd').removeClass('b_bg_color');
	})
	$(".user_photo").mouseenter(function() {  
		$(this).parent(".user_info_sty").children(".popup_inf").css("display","block"); 
	});
	$(".user_photo").mouseleave(function() {   
		$(this).parent(".user_info_sty").children(".popup_inf").css("display","none");
	});
	
	$(".popup_inf").mouseenter(function() {
		$(this).css("display","block");
	});
	$(".popup_inf").mouseleave(function() {
		$(this).css("display","none");
	});
	/*行业问答，tag滑动显示*/
	$(".tags_popup").mouseenter(function() {
		$(this).children(".pop_up").show();
		$(this).siblings(".tags_popup").children(".pop_up").hide();
	});
	$(".tags_popup").mouseleave(function() {
		$(this).children(".pop_up").hide();
	});
	
	$("#logonSpan").mouseenter(function() {
		$(this).children(".login_dropdown").show();
		$(this).siblings("#logonSpan").children(".login_dropdown").hide();
	});
	$("#logonSpan").mouseleave(function() {
		$(this).children(".login_dropdown").hide();
	});
	/*搜索下拉菜单*/
	$('.package_type_btn').click(function(){
		$('.package_type_menu').show();
	})
	$('.package_type_menu li').click(function(){
		var text = $(this).text();
		var val = $(this).attr('data-type');
		$("input[name='userType']").attr('value',val);
		$('.package_type_btn').text(text);
		$('.package_type_menu').hide();
	})
	/*头部登陆进去的下拉菜单*/
	$("#users_name").mouseenter(function(){
		$('.category_list').slideDown();
	})
	$("#users_name").mouseleave(function(){
		$('.category_list').hide();
	})
	$('.category_list').mouseenter(function(){
		$(this).show();
	})
	$('.category_list').mouseleave(function(){
		$(this).hide();
	})
	/*我的好友分组*/
	$('.ct-navi-line ul li a').mouseover(function(){
		$(this).children('.delete_button').show();
	})
	$('.delete_button').mouseover(function(){
		$(this).css("color","#F57008");
	})
	$('.ct-navi-line ul li a').mouseout(function(){
		$(this).children('.delete_button').hide();
	})
	$('.delete_button').mouseout(function(){
		$(this).css("color","#999");
	})
	
	/*------------------------左资源分类start------------------------------------*/
	$('#b_resource_sort dd strong').click(function(){
		if(!($(this).hasClass("b_vartags")))
		{
			$(this).addClass("b_vartags");
			$(this).children('span').children('b').remove();
			$(this).children('span').append("<b>-</b>");
			$(this).siblings('ul').slideDown('slow');
		}
		else
		{
			$(this).removeClass("b_vartags");
			$(this).children('span').children('b').remove();
			$(this).children('span').append("<b>+</b>");
			$(this).siblings('ul').slideUp('slow');
		}
	})
	var idd2=window.location.href.split("-");
	var idd;
	if(idd2.length>1)
	{
		idd=idd2[1];
		if($('#b_resource_sort dd ul li a').length>0)
		{
			if($('#b_resource_sort dd ul li a').has(idd))
			{
				$('#'+idd).parent('li').parent('ul').siblings('strong').addClass("b_vartags");
				$('#'+idd).parent('li').parent('ul').siblings('strong').children('span').children('b').remove();
				$('#'+idd).parent('li').parent('ul').siblings('strong').children('span').append("<b>-</b>");
				$('#'+idd).parent('li').parent('ul').show();
				$('#'+idd).addClass('b_active');
			}
		}
	}
	/*------------------------左资源分类end------------------------------------*/
	
	/*==============================排序方式start=============================*/
	$('#b_order_way span').click(function(){
		$(this).siblings('dl').slideDown('slow');
	})
	$('#b_order_way').mouseleave(function(){
		$(this).children('dl').slideUp('slow');
	})
	$('#b_order_way dl').mouseenter(function(){
		$(this).show();
	})
	$('#b_order_way dl dd a').click(function(){
		$(this).parent('dd').parent('dl').slideUp('slow');
		var text = $(this).text();
		$('#b_order_way span').text(text);
	})
	var hrefstr=window.location.href;
	if(hrefstr.indexOf("ASC")!=-1 && $('div').has('b_order_way'))
	{
		$('#b_order_way span').text("按照时间升序");
	}
	else if(hrefstr.indexOf("DESC")!=-1 && $('div').has('b_order_way'))
	{
		$('#b_order_way span').text("按照时间降序");
	}
	/*==============================排序方式end=============================*/
	
	/*==============================搜索详细块start=============================*/
	$('.b_details_about').mouseenter(function(){
		$(this).addClass('b_bg_color2');
	})
	$('.b_details_about').mouseleave(function(){
		$(this).removeClass('b_bg_color2');
	})
	/*==============================搜索详细块end=============================*/
	
	/*==============================搜索块右部小头像start=============================*/
	$('.b_mysmallphoto img').live('click',function(){		
		$(this).siblings('dl').slideDown('slow');
	})
	$('.b_mysmallphoto').mouseleave(function(){
		$(this).children('dl').slideUp('slow');
	})	
	$('.b_mysmallphoto dl').mouseenter(function(){
		$(this).show();
	})
	$('.b_mysmallphoto dl dd a').click(function(){
		$(this).parent('dd').parent('dl').slideUp('slow');
	})
	/*==============================搜索块右部小头像end=============================*/
	/*个人档案完成进度*/
	$('#arrow_down').click(function(){
		$(this).parent().siblings('dl').slideToggle("slow");
	})
	/*对网站头部登录名的长度限制*/
	/*===================start==============*/
	if($('#users_name a span').length>0)
	{
		if($('#users_name a span').text().length>5)
		{
			var userName=$('#users_name a span').text().substr(0,5);
			$('#users_name a span').text(userName+'...');
		}
	}
	/*===================end==============*/
	
	/*网站首页头部banner图片切换*/
	/*===================start==============*/
	//function showHide()
//	{
//		if($('.c_image1').is(":visible"))
//		{
//			$('.c_image1').fadeOut(2000).css('display','none');
//			$('.c_image2').fadeIn(2000).css('display','block');
//		}
//		else if($('.c_image2').is(":visible"))
//		{
//			$('.c_image2').fadeOut(2000).css('display','none');
//			$('.c_image1').fadeIn(2000).css('display','block');
//		}
//	}
//	var time=setInterval(showHide,5000);
//	if($('.c_image1').is(":visible"))
//	{
//		$('.c_image1').mouseenter(function(){
//			$(this).show();
//			clearInterval(time);
//		});	
//		$('.c_image1').mouseleave(function(){
//			$(this).show();
//			time=setInterval(showHide,5000);
//		});
//	}
//
//	$('.c_image2').mouseenter(function(){
//		$(this).show();
//		clearInterval(time);
//	});	
//	$('.c_image2').mouseleave(function(){
//		if($('.c_rule_popup').is(":hidden"))
//		{
//			$(this).show();
//			time=setInterval(showHide,5000);
//		}
//	});
	if($("#c_text").length>0)
	{
		$("#c_text").click(function(){
			$('.c_rule_popup').fadeIn(600);
			$('.c_rule_popup').animate({opacity:"0.93"})
			/*clearInterval(time);*/
		});	
		$("#c_close").click(function(){
			$('.c_rule_popup').hide();
		});	
	}

	/*===================end==============*/
	
	/*memberlist添加的地区选择*/
	/*===================start==============*/
	if($("#c_area").length>0){
		
		$(".c_popup_area").find('dd').mouseover(function(){
			$(this).css('background-color','orange');
			$(this).css('cursor','pointer');
			$(this).css('color','white');
		});	
		$(".c_popup_area").find('dd').mouseout(function(){
			$(this).css('background','none');
			$(this).css('color','black');
		});	
		$(".c_popup_area").find('dd').click(function(){
			$(this).css('background','none');
			$(this).css('color','black');
			$("#c_area").colorbox.close();
			$("#c_area").val($(this).text());
			
		});
		$("#all_area").click(function(){
			$("#c_area").colorbox.close();
			$("#c_area").val('地区');
			
		});
	}
	/*===================end==============*/
	/*网站首页头部右下角最新工作职位图片切换*/
	/*===================start==============*/
	function newestJob()
	{
		if($('#c_newest_jobs li').eq(0).is(":visible"))
		{
			$('#c_newest_jobs li').eq(0).fadeOut(2000).css('display','none');
			$('#c_newest_jobs li').eq(1).fadeIn(2000).css('display','block');
		}
		else if($('#c_newest_jobs li').eq(1).is(":visible"))
		{
			$('#c_newest_jobs li').eq(1).fadeOut(2000).css('display','none');
			$('#c_newest_jobs li').eq(2).fadeIn(2000).css('display','block');
		}
		else if($('#c_newest_jobs li').eq(2).is(":visible"))
		{
			$('#c_newest_jobs li').eq(2).fadeOut(2000).css('display','none');
			$('#c_newest_jobs li').eq(3).fadeIn(2000).css('display','block');
		}
		else if($('#c_newest_jobs li').eq(3).is(":visible"))
		{
			$('#c_newest_jobs li').eq(3).fadeOut(2000).css('display','none');
			$('#c_newest_jobs li').eq(4).fadeIn(2000).css('display','block');
		}
		else if($('#c_newest_jobs li').eq(4).is(":visible"))
		{
			$('#c_newest_jobs li').eq(4).fadeOut(2000).css('display','none');
			$('#c_newest_jobs li').eq(5).fadeIn(2000).css('display','block');
		}
		else if($('#c_newest_jobs li').eq(5).is(":visible"))
		{
			$('#c_newest_jobs li').eq(5).fadeOut(2000).css('display','none');
			$('#c_newest_jobs li').eq(6).fadeIn(2000).css('display','block');
		}
		else if($('#c_newest_jobs li').eq(6).is(":visible"))
		{
			$('#c_newest_jobs li').eq(6).fadeOut(2000).css('display','none');
			$('#c_newest_jobs li').eq(7).fadeIn(2000).css('display','block');
		}
		else if($('#c_newest_jobs li').eq(7).is(":visible"))
		{
			$('#c_newest_jobs li').eq(7).fadeOut(2000).css('display','none');
			$('#c_newest_jobs li').eq(8).fadeIn(2000).css('display','block');
		}
		else if($('#c_newest_jobs li').eq(8).is(":visible"))
		{
			$('#c_newest_jobs li').eq(8).fadeOut(2000).css('display','none');
			$('#c_newest_jobs li').eq(9).fadeIn(2000).css('display','block');
		}
		else if($('#c_newest_jobs li').eq(9).is(":visible"))
		{
			$('#c_newest_jobs li').eq(9).fadeOut(2000).css('display','none');
			$('#c_newest_jobs li').eq(0).fadeIn(2000).css('display','block');
		}
	}
	var time2=setInterval(newestJob,3000);
	/*===================end==============*/
});

