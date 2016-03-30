<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="图片截图" /></title>
<jdf:themeFile file="jquery.cropzoom.js" />
</head>
<body>
     <div class="crop"> 
        <div class="page_btn"> 
            <input type="button" class="btn" id="crop" value="剪切照片" /> 
            <input type="button" class="btn" id="restore" value="照片复位" /> 
        </div> 
        <div id="cropzoom_container"></div> 
<%--         <div id="preview"><img id="generated" src="${dynamicDomain}${filePath}"  /></div>  --%>
        <div class="clear"></div> 
     </div> 
     <script type="text/javascript">  
     $(function() {
    	 var width=700;
    	 var height=700;
    	 if(${cropWidth}>900||${cropHeight}>900){
    		 width = 1.3*${cropWidth};
    		 height = 1.3*${cropHeight};
    	 }
          var cropzoom = $('#cropzoom_container').cropzoom({
//                width: '600',//DIV层宽度
//                height: '${600*scale}',//DIV层高度
               width: width,//DIV层宽度
               height: height,//DIV层高度
               bgColor: '#ccc',//DIV层背景颜色
               enableRotation: false,//是否允许旋转图片true false
               enableZoom: true,//是否允许放大缩小
               enableResize: false,//是否允许改变裁剪框大小
               selector: {
                    w:'${cropWidth}',//选择器宽度
                    h:'${cropHeight}',//旋转高度
                    showPositionsOnDrag:true,//是否显示拖拽的位置洗洗脑
                    showDimetionsOnDrag:false,
                    aspectRatio:true,
                    centered: true,//居中
                    bgInfoLayer:'#fff',
                    borderColor: 'blue',//选择区域边框样式
                    animated: false,
                    maxWidth:'${1.1*cropWidth}',//最大宽度
                    maxHeight:'${1.1*cropHeight}',//最大高度
                    borderColorHover: 'yellow'//鼠标放到选择器的边框颜色
                },
                image: {
                    source: '${dynamicDomain}${filePath}',
                    width: '${width}',//图片宽度
                    height: '${height}',//图片高度
                    minZoom: 30,//最小放大比例
                    maxZoom: 450//最大放大比例
                 }
           });
          $("#crop").click(function(){//裁剪提交
               cropzoom.send('${dynamicDomain}/admin/screenshot/saveCrop', 'POST', {'srcFilePath':'${filePath}'}, function(imgRet) {
                   var filePath = '${dynamicDomain}'+imgRet.filePath;
                   var img = '<a style="float: right;cursor: pointer;" id="mainDelete" data-path="'+imgRet.filePath+'">删除</a>'+
                	   '<img alt="" src="'+filePath+'" width="200px">';
                   $("#mainPicture",window.parent.document).val(imgRet.filePath);
                   $("#mainImg",window.parent.document).html(img);
                   //执行父窗口的js
                   try{
                	   parent.setImage(imgRet.filePath);
                   }catch(e){
                   }
                   try{
                	   parent.bindPictureDelete();
                   }catch(e){
                   }
                   
                   alert('截图成功!可以关闭窗口查看了！');
                   parent.$.colorbox.close();
               });             
          });
          $("#restore").click(function(){//显示初始状态照片
               $("#generated").attr("src", "${dynamicDomain}${filePath}");
               cropzoom.restore();                    
          });
     });
     </script>
</body>
</html>