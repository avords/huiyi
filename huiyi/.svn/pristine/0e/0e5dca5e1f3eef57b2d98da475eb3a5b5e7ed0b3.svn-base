<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<jdf:themeFile file="css/bootstrap.css" />
<jdf:themeFile file="css/bootstrap-theme.css" />
<!-- start: JavaScript-->
<!--[if !IE]>-->
<jdf:themeFile file="jquery-2.0.3.min.js"/>
<!--<![endif]-->

<!--[if IE]>
	<jdf:themeFile file="jquery-1.10.2.min.js"/>
<![endif]-->
<style type="text/css">
/*
 * Glyphicons
 *
 * Special styles for displaying the icons and their classes in the docs.
 */

.bs-glyphicons {
  padding-left: 0;
  padding-bottom: 1px;
  margin-bottom: 20px;
  list-style: none;
  overflow: hidden;
}
.bs-glyphicons li {
  float: left;
  width: 5%;
  height: 40px;
  padding: 2px;
  margin: 0 -1px -1px 0;
  font-size: 12px;
  line-height: 1.4;
  text-align: center;
  border: 1px solid #ddd;
  cursor: pointer;
}
.bs-glyphicons .glyphicon {
  margin-top: 5px;
  margin-bottom: 5px;
  font-size: 24px;
}
.bs-glyphicons .glyphicon-class {
  display: block;
  text-align: center;
  word-wrap: break-word; /* Help out IE10+ with class names */
}
.bs-glyphicons li:hover {
  background-color: rgba(86,61,124,.1);
}

@media (min-width: 768px) {
  .bs-glyphicons li {
    width: 5%;
  }
}

    </style>
    <script type="text/javascript">
	    $(document).ready(function(){
	    	$("#icons li").click(function(){
	    		$("#icons li").removeClass("active");
	    		$("#icons li span").removeClass("icon-white");
	    		$("#icon").val($(this).children("span").attr('class'));
	    		$(this).addClass("active");
	    		$(this).children("span").addClass("icon-white");
	    	});
	    	$("#icons li").each(function(){
	    		if ($(this).text()=="fullscreen"){
	    			$(this).click();
	    		}
	    	});
	    	$("#icons li").dblclick(function(){
	    		var className =$("#icon").val();
	    		parent.$("#icon").val(className);
	    		parent.$("#iconSpan").attr('class', '').addClass(className);
	    		try{
	    			parent.jQuery.fn.colorbox.close();
	    		}catch(e){}
	    		try{
	    			parent.$("#selectIcon").dialog("close");
	    		}catch(e){}
	    	});
	    });
    </script>
</head>
<body>
	<input type="hidden" id="icon" value="fullscreen" />
    <ul class="bs-glyphicons" id="icons">
      <li>
        <span class="glyphicon glyphicon-adjust"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-align-center"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-align-justify"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-align-left"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-align-right"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-arrow-down"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-arrow-left"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-arrow-right"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-arrow-up"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-asterisk"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-backward"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-ban-circle"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-barcode"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-bell"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-bold"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-book"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-bookmark"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-briefcase"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-bullhorn"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-calendar"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-camera"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-certificate"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-check"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-chevron-down"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-chevron-left"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-chevron-right"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-chevron-up"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-circle-arrow-down"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-circle-arrow-left"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-circle-arrow-right"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-circle-arrow-up"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-cloud"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-cloud-download"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-cloud-upload"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-cog"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-collapse-down"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-collapse-up"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-comment"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-compressed"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-copyright-mark"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-credit-card"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-cutlery"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-dashboard"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-download"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-download-alt"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-earphone"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-edit"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-eject"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-envelope"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-euro"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-exclamation-sign"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-expand"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-export"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-eye-close"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-eye-open"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-facetime-video"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-fast-backward"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-fast-forward"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-file"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-film"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-filter"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-fire"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-flag"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-flash"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-floppy-disk"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-floppy-open"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-floppy-remove"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-floppy-save"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-floppy-saved"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-folder-close"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-folder-open"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-font"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-forward"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-fullscreen"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-gbp"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-gift"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-glass"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-globe"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-hand-down"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-hand-left"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-hand-right"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-hand-up"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-hd-video"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-hdd"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-header"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-headphones"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-heart"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-heart-empty"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-home"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-import"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-inbox"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-indent-left"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-indent-right"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-info-sign"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-italic"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-leaf"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-link"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-list"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-list-alt"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-lock"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-log-in"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-log-out"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-magnet"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-map-marker"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-minus"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-minus-sign"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-move"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-music"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-new-window"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-off"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-ok"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-ok-circle"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-ok-sign"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-open"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-paperclip"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-pause"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-pencil"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-phone"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-phone-alt"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-picture"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-plane"></span>
      <li>
        <span class="glyphicon glyphicon-play"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-play-circle"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-plus"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-plus-sign"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-print"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-pushpin"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-qrcode"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-question-sign"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-random"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-record"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-refresh"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-registration-mark"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-remove"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-remove-circle"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-remove-sign"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-repeat"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-resize-full"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-resize-horizontal"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-resize-small"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-resize-vertical"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-retweet"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-road"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-save"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-saved"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-screenshot"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-sd-video"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-search"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-send"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-share"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-share-alt"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-shopping-cart"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-signal"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-sort"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-sort-by-alphabet"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-sort-by-alphabet-alt"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-sort-by-attributes"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-sort-by-attributes-alt"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-sort-by-order"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-sort-by-order-alt"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-sound-5-1"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-sound-6-1"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-sound-7-1"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-sound-dolby"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-sound-stereo"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-star"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-star-empty"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-stats"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-step-backward"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-step-forward"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-stop"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-subtitles"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-tag"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-tags"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-tasks"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-text-height"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-text-width"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-th"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-th-large"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-th-list"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-thumbs-down"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-thumbs-up"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-time"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-tint"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-tower"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-transfer"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-trash"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-tree-conifer"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-tree-deciduous"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-unchecked"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-upload"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-usd"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-user"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-volume-down"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-volume-off"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-volume-up"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-warning-sign"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-wrench"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-zoom-in"></span>
      </li>
      <li>
        <span class="glyphicon glyphicon-zoom-out"></span>
      </li>
    </ul>
</body>
</html>