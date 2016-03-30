<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>地区树</title>
<jdf:themeFile file="css/zTree.css" />
<jdf:themeFile file="jquery.hotkeys.js" />
<jdf:themeFile file="jquery.ztree.all-3.5.min.js" />
</head>
<body>
	<div class="row">
		<div class="col-sm-3 col-md-3">
			<ul id="topicTree" class="ztree"></ul>
		</div>
		<div class="col" style="display: none;" id="addArea">
			<form action="" id="areaForm" class="form-horizontal">
				<input type="hidden" name="parentId" id="area_parentId"/>
				<input type="hidden" name="code" id="area_code"/>
				<input type="hidden" name="level" id="area_level"/>
				<input type="hidden" name="objectId" id="area_objectId"/>
				<div class="row-fluid">
					<div class="span10">
						<div id="messageBox" class="alert alert-info" style="display:none">${message}</div>
					</div>
					<div class="span5">
						<div class="control-group">
							<label class="control-label" for="remark">名称</label>
							<div class="controls">
								<input type="text" name="name" id="area_name" class="form-control">
							</div>
						</div>
					</div>
					<div class="span5">
						<div class="control-group">
							<label class="control-label" for="status"><jdf:message code="common.lable.status"/></label>
							<div class="controls">
								<select name="status" id="area_status" class="myPrettySelect2" style="width:200px;">
								    <jdf:select dictionaryId="111"/>
								</select>
							</div>
						</div>
					</div>
					<div class="span10 pull-right">
						<div class="btn-toolbar pull-right" style="font-size: medium;">
	                		<button type="button" class="btn btn-primary" onclick="saveArea()">
	                			<i class="icon-save icon-white"></i><jdf:message code="common.button.save"/>
	                		</button>
	                	</div>
	                </div>
				</div>
			</form>
		</div>
	</div>
   <script type="text/javascript">
   		//涉及到权限的树不能移动。否则业务数据权限控制失效。
        var setting = {
            async: {
                enable: true,
                url:"${dynamicDomain}/home/area/getChildren?ajax=1",
                autoParam:["objectId", "name=n", "level=lv"]
            },
            view: {
            	expandSpeed:"",
                addHoverDom: addHoverDom,
                removeHoverDom: removeHoverDom,
                selectedMulti: false
            },
            edit: {
                enable: true,
                editNameSelectAll: true,
                showRenameBtn: false,
                showRemoveBtn:false
            },
            data: {
                simpleData: {
                    enable: true,
                    pIdKey: "parentId"
                }
            },
            callback: {  
                onClick: onClick
            }  
        };
   		
        function onClick(event, treeId, treeNode, clickFlag) { 
        }   

        function filter(treeId, parentNode, childNodes) {
            if (!childNodes) return null;
            for (var i=0, l=childNodes.length; i<l; i++) {
                childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
            }
            return childNodes;
        }
        
        function beforeRemove(treeId, treeNode) {
            var zTree = $.fn.zTree.getZTreeObj("topicTree");
            zTree.selectNode(treeNode);
            return confirm("Confirm delete Node  -- " + treeNode.name + " ？");
        }       
        
        function beforeRename(treeId, treeNode, newName) {
            if (newName.length == 0) {
                alert("Node Name can not be empty.");
                return false;
            }
            return true;
        }
		
        var newCount = 1;
        function addHoverDom(treeId, treeNode) {
            var sObj = $("#" + treeNode.tId + "_span");
            if ($("#addBtn_"+treeNode.objectId).length>0) return;
            var addStr = "<span class='button add' id='addBtn_" + treeNode.objectId + "' title='add node' onfocus='this.blur();'></span>";
            addStr += "<span class='button edit' id='editBtn_" + treeNode.objectId + "' title='edit node' onfocus='this.blur();'></span>";
            sObj.append(addStr);
            var btn = $("#addBtn_"+treeNode.objectId);
            if (btn) btn.bind("click", function(){
            	currentObjectId = "";
                $("#area_id").val("");
                $("#area_objectId").val("");
                $("#area_parentId").val(treeNode.objectId);
                $("#area_name").val("");
                $("#area_status").val("");
                $("#area_code").val("");
                $("#area_level").val("");
                currentNode = treeNode;
                $("#addArea").dialog({height: 250,width:300,resizable:false});
            });
            
            var btn2 = $("#editBtn_"+treeNode.objectId);
            if (btn2) btn2.bind("click", function(){
                currentObjectId = treeNode.objectId;
                $("#area_objectId").val(currentObjectId);
                $("#area_parentId").val(treeNode.parentId);
                currentNode = treeNode;
                $("#area_name").val(treeNode.name);
                $("#area_status").val(treeNode.status?1:0);
                $("#area_code").val(treeNode.code);
                $("#area_level").val(treeNode.level);
                $("#addArea").dialog({height: 250,width:300,resizable:false});
            });
        };
        
        function removeHoverDom(treeId, treeNode) {
            $("#addBtn_"+treeNode.objectId).unbind().remove();
            $("#editBtn_"+treeNode.objectId).unbind().remove();
        };
        
        var root = ${root};
        $(document).ready(function(){
            $.fn.zTree.init($("#topicTree"), setting);
        });
        
        var count=0; 
        var lastName; 
        function doSearch(){ 
        	if(count==0){ 
       			lastName=document.getElementById("search_str").value; 
        	} 
        	if(lastName!=document.getElementById("search_str").value){ 
       			count=0; 
        		lastName=document.getElementById("search_str").value; 
        	} 
        	var treeObj = $.fn.zTree.getZTreeObj("topicTree"); 
	        var nodes =   treeObj.transformToArray(treeObj.getNodesByParamFuzzy("name", lastName, null)); 
            for(i = count; i < nodes.length; i++) { 
        		count++; 
        		if(count>=nodes.length){ 
        			count=0; 
        		} 
        		if(nodes[i].name.indexOf(lastName)!=-1){ 
        			treeObj.selectNode(nodes[i]); 
        			//auto open
        			treeObj.expandNode(nodes[i], false,false , false); 
        			return false; 
        		} 
       		} 
        } 
       </script>
	<script>
		var currentNode;
		var tree;
		var needSave; 
		var currentObjectId;
		function saveArea(){
			var name = $("#area_name").val();
			if(isNull(name)){
				showMessage("名称不能为空");
				return;
			}
			var params = $("#areaForm").serialize();
   			$.ajax({
				url:"${dynamicDomain}/home/area/treeSave?ajax=1&" + params + "&timstamp=" + (new Date()).valueOf(),
				type:'post',
				dataType:'json',
				success:function(data){
					//if(msg.result) {
						var area = data;
						var zTree = $.fn.zTree.getZTreeObj("topicTree");
						//add
						if(currentObjectId==""){
			                zTree.addNodes(currentNode, {"objectId":area.objectId,"primaryKey":area.objectId,"parentId":area.parentId,
                                "name":area.name,"status":area.status,"code":area.code,"level":area.level});
						}else{
							//edit
							currentNode.name=area.name;
							currentNode.primaryKey=area.objectId;
							currentNode.status=area.status;
							currentNode.code=area.code;
							currentNode.level=area.level;
							currentNode.value=area.value;
							zTree.updateNode(currentNode);
						}
						showMessage("<jdf:message code="common.base.saveSuccess"/>",5000);
					//} else {
					//	showMessage("<jdf:message code="common.base.fail"/>",5000);
				  	//}
				  }
		     });
		}
	
		
	</script>
</body>
</html>