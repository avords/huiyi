jQuery(document).ready(function($) {
    "use strict";
    /*PrettyPhoto */
    $('a.prettyphoto').prettyPhoto({social_tools:"",allow_expand:true});

  
    //sticky menu
    $('#sticky-navigation').append('<div class="container"><ul class="navigation">' + $('.navigation').html() + '</ul></div>');


    /* Mobile Nav */
    $('.header .mobile-nav ').append($('.navigation').html());
    $('.header .mobile-nav li').bind('click', function(e) {
        var $this = $(this);
        var $ulKid = $this.find('>ul');
        var $ulKidA = $this.find('>a');

        if ($ulKid.length === 0 && $ulKidA[0].nodeName.toLowerCase() === 'a') {
            window.location.href = $ulKidA.attr('href');
        }
        else {
            $ulKid.toggle(0, function() {
                if ($(this).css('display') === 'block') {
                    $ulKidA.find('.icon-chevron-down').removeClass('icon-chevron-down').addClass('icon-chevron-up');
                }
                else {
                    $ulKidA.find('.icon-chevron-up').removeClass('icon-chevron-up').addClass('icon-chevron-down');
                }
            });
        }
        e.stopPropagation();
        return false;
    });

    $('.mobile-menu-button').click(function() {
        $('.mobile-nav').toggle();
    });

    $('.header .mobile-nav .icon-chevron-right').each(function() {
        $(this).removeClass('icon-chevron-right').addClass('icon-chevron-down');
    });

    /* to top button */
    $('body').append('<div id="to-top-button"> <i class="fa fa-angle-up"></i></div>');


    $('#to-top-button').click(function() {
        $('body,html').animate({
            scrollTop: 0
        });
    });


    stickyMenu();

    $(window).resize(function() {
        stickyMenu();
        centeringBullets();
    });

});


/* Sticky Menu */
function stickyMenu() {
    if ($(window).width() < 980) {
        $('.sticky-navigation,#to-top-button').hide();
    }
    else {
        $(window).scroll(function() {
            if ($(window).scrollTop() > 35) {
                $('#header').addClass('sticky-header');
                $('.sticky-navigation,#to-top-button').fadeIn();
            }
            else {
                $('#header').removeClass('sticky-header');
                $('.sticky-navigation,#to-top-button').fadeOut();
            }
        });
    }
}

/* Centering Bullets */
function centeringBullets() {
    //Bullets center fixing in revolution slide
    $('.simplebullets,.slider-fixed-frame .home-bullets').each(function() {
        var $this = $(this), w = $this.width();
        $this.css('margin-left', -(w / 2) + 'px');
    });
}

function changeLanguage(lang){
	$.cookie("locale",lang,{path:"/"});
	window.location.reload(true);
}