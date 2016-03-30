$(function(){
	 //置顶标签
	$(window).scroll(function(){
		TopNum = $(this).scrollTop();
		if ( TopNum > 0) {
	      $('#topimg').show('slow').attr('title', '点此回到顶部');
	      $('#topimg').css({'position':'fixed', 'bottom':20, 'right':'10px' });
			// $('#topimg').css({'position':'fixed', 'bottom':120, 'left':($(this).width() - $('div.main').width())/2 + $('div.main').width()});
		}else{
			$('#topimg').hide('slow');
		}
	 });
	 $('#topimg').click(function(){
		if ( !Bigns ) {
		 $(this).attr('title', '再点此停止回到顶部');
		 Bigns = true;
		 GoTop();
		}else{
		 $(this).attr('title', '点此回到顶部');
		 Bigns = false;
		 clearTimeout(GoTopTimeOut);
		}
	 });
});


function GoTop(){
	$(window).scrollTop(TopNum-=10);
	GoTopTimeOut = setTimeout('GoTop()', 5);
	if ( TopNum <= 0 ){
		clearTimeout(GoTopTimeOut);
		Bigns = false;
	}
}