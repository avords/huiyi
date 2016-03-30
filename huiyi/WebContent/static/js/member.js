$(function() {
	try{
		$(".colorbox-full").colorbox({width:"98%", height:"98%", fixed: true, iframe:true,onClosed:function(){ if(reloadParent){location.search=location.search.replace(/message.*&/,"");}},overlayClose:false});
		$(".colorbox-large").colorbox({innerWidth:"65%", innerHeight:"70%",fixed: true,iframe:true,onClosed:function(){ if(reloadParent){location.search=location.search.replace(/message.*&/,"");}},overlayClose:false});
		$(".colorbox").colorbox({width:"55%", height:"75%", fixed: true, iframe:true,onClosed:function(){ if(reloadParent){location.search=location.search.replace(/message.*&/,"");}},overlayClose:false});
		$(".colorbox-big").colorbox({width:"65%", height:"85%", fixed: true, iframe:true,onClosed:function(){ if(reloadParent){location.search=location.search.replace(/message.*&/,"");}},overlayClose:false});
		$(".colorbox-mini").colorbox({width:"40%", height:"50%", fixed: true, iframe:true,onClosed:function(){if(reloadParent){location.search=location.search.replace(/message.*&/,"");}},overlayClose:false});
		$('.tooltip').tooltipster({
			tooltipTheme: '.tooltipster-smoke'
		});
	}catch(e){
	}
	
	var messageBox = $('#messageBox');
	if(messageBox){
		if(messageBox.text().trim()!=""){
			messageBox.show();
		}else{
			messageBox.hide();
		}
	}
	
    //setup ajax error handling
    $.ajaxSetup({
        error: function (x, status, error) {
            if (x.status == 403) {
            	showMessage("You are unauthorized to access this page");
            } else {
            	showMessage("An error occurred: " + status + "\nError: " + error);
            }
            //ignore the error
            return "true";
        }
    });
	
});
