<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="system.menu.dictionary"/></title>
<jdf:themeFile file="css/zTree.css" />
<jdf:themeFile file="jquery.hotkeys.js" />
<jdf:themeFile file="jquery.ztree.all-3.5.min.js" />
</head>
<body>
	<div class="row">
		<div class="col-sm-3 col-md-3">
			<ul id="topicTree" class="ztree"></ul>
		</div>
		<div class="col-sm-9 col-md-9">
			<iframe id="userFrame" name="userFrame" src="" style="overflow: visible; height: 550px;width: 100%" scrolling="auto" frameborder="no"></iframe>
		</div>
		<div class="col" style="display: none;" id="addArea">
			<form action="" id="dictForm" class="form-horizontal">
				<input type="hidden" name="parentId" id="dict_parentId"/>
				<input type="hidden" name="objectId" id="dict_objectId"/>
				<div class="row-fluid">
					<div class="span10">
						<div id="messageBox" class="alert alert-info" style="display:none">${message}</div>
					</div>
					<div class="span5">
						<div class="control-group">
							<label class="control-label" for="name"><jdf:message code="system.lable.name"/></label>
							<div class="controls">
								<input type="text" name="name" id="dict_name" class="input-small">
							</div>
						</div>
					</div>
					<div class="span5">
						<div class="control-group">
							<label class="control-label" for="status"><jdf:message code="common.lable.status"/></label>
							<div class="controls">
								<select name="status" id="dict_status">
								    <jdf:select dictionaryId="111"/>
								</select>
							</div>
						</div>
					</div>
					<div class="span5">
						<div class="control-group">
							<label class="control-label" for="remark">备注</label>
							<div class="controls">
								<input type="text" name="code" id="dict_code" class="input-small">
							</div>
						</div>
					</div>
					<div class="span10 pull-right">
						<div class="btn-toolbar pull-right" style="font-size: medium;">
	                		<button type="button" class="btn btn-primary" onclick="saveDict()">
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
                url:"${dynamicDomain}/admin/department/getChildren?ajax=1",
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
            $("#userFrame").attr("src","${dynamicDomain}/admin/user/page?ajax=1&search_EQL_departmentId=" + treeNode.objectId);
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
                $("#dict_id").val("");
                $("#dict_objectId").val("");
                $("#dict_parentId").val(treeNode.objectId);
                $("#dict_name").val("");
                $("#dict_status").val("");
                $("#dict_code").val("");
                $("#icon").val("");
                $("#iconSpan").attr('class', '');
                currentNode = treeNode;
                $("#addArea").dialog({height: 350,width:660,resizable:false});
            });
            
            var btn2 = $("#editBtn_"+treeNode.objectId);
            if (btn2) btn2.bind("click", function(){
                currentObjectId = treeNode.objectId;
                $("#dict_objectId").val(currentObjectId);
                $("#dict_parentId").val(treeNode.parentId);
                currentNode = treeNode;
                $("#dict_name").val(treeNode.name);
                $("#dict_status").val(treeNode.status?1:0);
                $("#dict_code").val(treeNode.code);
                $("#dict_sortId").val(treeNode.sortId);
                $("#icon").val(treeNode.icon);
                $("#iconSpan").attr('class', '').addClass(treeNode.icon);
                $("#addArea").dialog({height: 350,width:660,resizable:false});
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
		function saveDict(){
			var name = $("#dict_name").val();
			if(isNull(name)){
				showMessage("名称不能为空");
				return;
			}
			var params = $("#dictForm").serialize();
   			$.ajax({
				url:"${dynamicDomain}/admin/department/treeSave?ajax=1&" + params + "&timstamp=" + (new Date()).valueOf(),
				type:'post',
				dataType:'json',
				success:function(msg){
					if(msg.result) {
						var dict = msg.entity;
						var zTree = $.fn.zTree.getZTreeObj("topicTree");
						//add
						if(currentObjectId==""){
			                zTree.addNodes(currentNode, {"objectId":dict.objectId,"primaryKey":dict.objectId,"parentId":dict.parentId,
                                "name":dict.name,"status":dict.status,"sortId":dict.sortId,"code":dict.code,"icon":dict.icon});
						}else{
							//edit
							currentNode.name=dict.name;
							currentNode.primaryKey=dict.objectId;
							currentNode.status=dict.status;
							currentNode.code=dict.code;
							currentNode.value=dict.value;
							currentNode.icon = dict.icon;
							zTree.updateNode(currentNode);
						}
						showMessage("<jdf:message code="common.base.saveSuccess"/>",5000);
					} else {
						showMessage("<jdf:message code="common.base.fail"/>",5000);
				  	}
				  }
		     });
		}
	
		
		function saveOrder(){
		 	 var menu = $(tree).plugins.checkbox.get_checked();   
		    var ids="";   
		    for(i=0;i<menu.size();i++){   
		        ids += menu[i].id+";";   
		    }   
		    alert(ids);   
		}
		var iconButtonBox = $("#iconButton").colorbox({iframe:true, width:"80%", height:"80%",close: "关闭", overlayClose: false});
		
	</script>

</body>
</html>