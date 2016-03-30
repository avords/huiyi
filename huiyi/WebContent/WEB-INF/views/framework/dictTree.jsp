<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="system.menu.dictionary"/></title>
<jdf:themeFile file="css/zTree.css" />
<jdf:themeFile file="jquery.hotkeys.js" />
<jdf:themeFile file="jquery.ztree.all-3.5.min.js" />
</head>
<body>
	<div class="panel">
		<div class="panel-header">
			<i class="icon-sitemap"></i><jdf:message code="system.menu.dictionary"/>
		</div>
		<div class="panel-content" style="min-height: 450px;">
			<ul id="topicTree" class="ztree"></ul>
			<input type="hidden" id="changed" name="changed" />
		</div>
	</div>
	<div id="addArea" style="display: none;"  class="panel">
		<div class="panel-content">
			<form action="" id="dictForm" class="form-horizontal">
				<input type="hidden" name="id" id="dict_id"/>
				<input type="hidden" name="parentId" id="dict_parentId"/>
				<input type="hidden" name="objectId" id="dict_objectId"/>
				<input type="hidden" name="sortId" id="dict_sortId"/>
				<input type="hidden" name="type" id="dict_type"/>
				<div class="row">
					<div class="col-sm-12 col-md-10">
						<div id="messageBox" class="alert alert-info" style="display:none">${message}</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12 col-md-10">
						<div class="form-group">
							<label class="col-sm-3 control-label" for="dictionaryId"><jdf:message code="system.lable.dict.dictionary_id"/></label>
							<div class="col-sm-8">
								<input type="text" name="dictionaryId" id="dict_dictionaryId" class="form-control">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12 col-md-10">
						<div class="form-group">
							<label class="col-sm-3 control-label" for="name"><jdf:message code="system.lable.dict.name"/></label>
							<div class="col-sm-8">
								<input type="text" name="name" id="dict_name" class="form-control">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12 col-md-10">
						<div class="form-group">
							<label class="col-sm-3 control-label" for="value"><jdf:message code="system.lable.dict.value"/></label>
							<div class="col-sm-8">
								<input type="text" name="value" id="dict_value" class="form-control">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12 col-md-10">
						<div class="form-group">
							<label class="col-sm-3 control-label" for="status"><jdf:message code="common.lable.status"/></label>
							<div class="col-sm-8">
								<select name="status" id="dict_status" value="1" class="form-control">
								    <option value=""></option>
								    <jdf:select dictionaryId="111"/>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12 col-md-10">
						<div class="form-group">
							<label class="col-sm-3 control-label" for="remark"><jdf:message code="system.lable.dict.remark"/></label>
							<div class="col-sm-8">
								<textarea rows="2" cols="80" name="remark" id="dict_remark" class="form-control"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12 col-md-10 pull-right">
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
        var setting = {
            async: {
                enable: true,
                url:"${dynamicDomain}/admin/dict/getChildren?ajax=1",
                autoParam:["id", "name=n", "level=lv"]
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
            }
        };

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
            if ($("#addBtn_"+treeNode.id).length>0) return;
            var addStr = "<span class='button add' id='addBtn_" + treeNode.id + "' title='add node' onfocus='this.blur();'></span>";
            addStr += "<span class='button edit' id='editBtn_" + treeNode.id + "' title='edit node' onfocus='this.blur();'></span>";
            sObj.append(addStr);
            var btn = $("#addBtn_"+treeNode.id);
            if (btn) btn.bind("click", function(){
            	currentObjectId = "";
                $("#dict_id").val("");
                $("#dict_objectId").val("");
                $("#dict_parentId").val(treeNode.id);
                $("#dict_name").val("");
                $("#dict_status").val("");
                $("#dict_sortId").val(1);
                $("#dict_remark").val("");
                $("#dict_dictionaryId").val("");
                $("#dict_type").val("2");
                $("#dict_value").val("");
                currentNode = treeNode;
                $("#addArea").dialog({height: 400,width:500,resizable:false});
            	
            });
            
            var btn2 = $("#editBtn_"+treeNode.id);
            if (btn2) btn2.bind("click", function(){
                currentObjectId = treeNode.id;
                 $("#dict_objectId").val(currentObjectId);
                $("#dict_parentId").val(treeNode.parentId);
                $("#dict_id").val(treeNode.primaryKey);
                currentNode = treeNode;
                $("#dict_name").val(treeNode.name);
                $("#dict_dictionaryId").val(treeNode.dictionaryId);
                $("#dict_value").val(treeNode.value);
                $("#dict_status").val(treeNode.status?1:0);
                $("#dict_remark").val(treeNode.remark);
                $("#dict_sortId").val(treeNode.sortId);
                $("#dict_type").val(treeNode.type); 
                $("#addArea").dialog({height: 400,width:500,resizable:false});
                
            });
            
        };
        
        function removeHoverDom(treeId, treeNode) {
            $("#addBtn_"+treeNode.id).unbind().remove();
            $("#editBtn_"+treeNode.id).unbind().remove();
        };
        
        var root = ${root};
        $(document).ready(function(){
            $.fn.zTree.init($("#topicTree"), setting, root);
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
			var dictionaryId = $("#dict_dictionaryId").val();
			var value = $("#dict_value").val();
			var status = $("#dict_status").val();
			var remark = $("#dict_remark").val();
			var sortId = $("#dict_sortId").val();
			if(dictionaryId=='null'){
				dictionaryId = '';
			}
			if(isNull(name)){
				showMessage("Name can not be empty");
				return;
			}
			if(!isInteger(value)){
				showMessage("Value should be Integer");
				return;
			}
			/* if(isNull(status)){
				showMessage("Status can not be empty");
                return;
			} */
			var params = $("#dictForm").serialize();
   			$.ajax({
				url:"${dynamicDomain}/admin/dict/treeSave?ajax=1&" + params + "&timstamp=" + (new Date()).valueOf(),
				type:'post',
				dataType:'json',
				success:function(msg){
					if(msg.result) {
						var dict = msg.entity;
						var zTree = $.fn.zTree.getZTreeObj("topicTree");
						//add
						if(currentObjectId==""){
			                zTree.addNodes(currentNode, {"id":dict.objectId,"primaryKey":dict.id,"rel":"file","parentId":dict.parentId,"dictionaryId":dict.dictionaryId,
                                "name":dict.name,"status":dict.status,"sortId":dict.sortId,"remark":dict.remark,"type":dict.type,"value":dict.value});
						}else{
							//edit
							currentNode.dictionaryId=dict.dictionaryId;
							currentNode.name=dict.name;
							currentNode.realName=dict.name;
							currentNode.primaryKey=dict.id;
							currentNode.status=dict.status;
							currentNode.remark=dict.remark;
							currentNode.value=dict.value;
							zTree.updateNode(currentNode);
						}
						showMessage("<jdf:message code="common.base.saveSuccess"/>",5000);
					} else {
						showMessage("<jdf:message code="common.base.fail"/>",5000);
				  	}
				  }
		     });
   			
   			 $("#addArea").dialog("close"); 
		}
	
		
		function saveOrder(){
		 	 var menu = $(tree).plugins.checkbox.get_checked();   
		    var ids="";   
		    for(i=0;i<menu.size();i++){   
		        ids += menu[i].id+";";   
		    }   
		    alert(ids);   
		}
	</script>

</body>
</html>