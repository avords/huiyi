var inProcess;
if(!processMessage){
	var inProcess = "...";
}else{
	inProcess = processMessage;
}

//The flag to control the list page refresh event after the pop up page closed.
var reloadParent = true;
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
	
    //setup ajax error handling
    $.ajaxSetup({
        error: function (x, status, error) {
            if (x.status == 403) {
            	showMessage("You are unauthorized to access this page");
            } else {
            	console.log("An error occurred: " + status + "\nError: " + error);
            }
            //ignore the error
            return "true";
        }
    });
	
	try{
		//alert-info alert-success alert-error alert-block
		var messageBox = $('#messageBox');
		if(messageBox.text().trim()!=""){
			messageBox.show();
		}else{
			messageBox.hide();
		}
		$(":submit").not(".noProgress").click(function(event){
			event.preventDefault();
			var form = $(this).closest("form");
			//Jquery form validate
			if(form.valid()){
				refreshParentPage(true);
				var old = $(this).html();
				$(this).attr("disabled", true).html(old + inProcess);
				form.submit();
			}else{
				refreshParentPage(false);
			}
		});

		//The specific progress button
		var progressBtn = $("#progressBtn");
		if(!progressBtn.val()){
			progressBtn = $(".progressBtn");
		}
		progressBtn.click(function(){ 
			var old = $(this).html();
			$(this).attr("disabled", true).html(old + inProcess);
		});
	}catch (e) {
	}
});

function refreshParentPage(bool){
	try{
		parent.reloadParent = bool;
	}catch(e){
	}
}

function clearForm(ele){
	$(ele).closest("form").find(':input').each(function() {
        switch(this.type) {
            case 'password':
            case 'select-multiple':
            case 'select-one':
            case 'text':
            case 'textarea':
                $(this).val('');
                break;
            case 'checkbox':
            case 'radio':
                this.checked = false;
        }
    });
}

function autoGrow(textarea){
    var adjustedHeight=textarea.clientHeight;
    adjustedHeight=Math.max(textarea.scrollHeight,adjustedHeight);
    if (adjustedHeight>textarea.clientHeight){
        textarea.style.height=adjustedHeight+'px';
    }
}

function autoResizeImage(maxWidth,maxHeight,objImg){
   	var img = new Image();
   	img.src = objImg.src;
   	var hRatio;
   	var wRatio;
		var Ratio = 1;
		wRatio = maxWidth /img.width;
		hRatio = maxHeight /img.height;
  	if (maxWidth ==0 && maxHeight==0){
	    	Ratio = 1;
	  	}else if (maxWidth==0){
	     	if (hRatio<1) Ratio = hRatio;
	    }else if (maxHeight==0){
	      	if (wRatio<1) Ratio = wRatio;
	    }else if (wRatio<1 || hRatio<1){
	    	Ratio = (wRatio<=hRatio?wRatio:hRatio);
		}
		if (Ratio<1){
   		img.width = img.width * Ratio;
   		img.height = img.height * Ratio;
   	}
  	objImg.height =img.height;
  	objImg.width = img.width;
}