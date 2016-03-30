$(function(){
	$(".close").live('click',function () {
		
				$(this).parent().fadeTo(400, 0, function () { // Links with the class "close" will close parent
					$(this).slideUp(400,function(){
						$('.notification ').remove();
					});
					
				});
				
				return false;
			}
		);
//	setInterval(function(){
//		$(".close").trigger('click');
//	},3000);
   
    // Alternating table rows:
		
	$('tbody tr:even').addClass("alt-row"); // Add class "alt-row" to even table rows
	//其他经验提交
	
	$('.side-tabs li').bind('click',function(){
		$('.side-tabs li a').removeClass('active');
		$(this).children('a').addClass('active');
		$('.tab-content').removeClass('active');
		var tabName=$(this).children('a').attr('href');
		$(tabName).addClass('active');	
	});
	//$('.side-tabs').tabs();
	$('.action-delete').live('click',function(){
		var trid = $(this).parent('td').parent('tr').attr('id');
		var delurl = $(this).attr('href');
		
		$( "#dialog-confirm" ).dialog({
            resizable: false,
            height:170,
            modal: true,
            buttons: {
                "确定": function() {
                	$.ajax({
            			url:delurl,
            			type:'POST',
            			success:function(data){
           				 	$('#'+trid).hide("slow", function(){ $(this).remove(); });
            			}
            		})
                   
                    $( this ).dialog( "close" );
                },
                "取消": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
		return false;
	});
	


	 function log( message ) {
		$( "<li>" ).html( message ).prependTo( "#user_category_tag_list" );
	 }

	$( "#user_category" ).autocomplete({
		source: function( request, response ) {
			$.ajax({
				url: "<?php echo site_url().'/user/getTags';?>",
				dataType: "json",
				data: {
					featureClass: "P",
					style: "full",
					maxRows: 12,
					name_startsWith: request.term
				},
				success: function( data ) {
					response( $.map( data, function( item ) {
						return {
							label: item,
							value: item
						}
					}));
				}
			});
		}, 
		//source: availableTags,
		minLength: 1,//表示输入多少个字才出现自动补全框    
		select: function( event, ui ) {
			log( ui.item ?
				'<a href="#">' + ui.item.label +'</a>'  :
				"Nothing selected, input was " + this.value);
		},
		open: function() {
			$( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
		},
		close: function() {
			$( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
		}
	});
	
	 $(document).tooltip({
         track: true
     });
})
