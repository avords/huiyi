<%@page import="com.mvc.security.model.Menu"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="system.menu.menu"/></title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span>
			<jdf:message code="system.menu.menu"/>
		</div>
	  	<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/admin/menu/save?ajax=1" class="form-horizontal" id="editForm">
					<input type="hidden" name="objectId">	
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="type" class="col-sm-3 control-label">
									<jdf:message code="system.lable.menu.type"/>
								</label>
								<div class="col-sm-8">
									<select name="type" id="type" class="form-control">
										<jdf:select dictionaryId="106"/>
									</select>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="name" class="col-sm-3 control-label">
									<jdf:message code="system.lable.menu.name"/>
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="name" name="name">
								</div>
							 </div>
						</div>
					 </div> 
					 
					 <div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="parentId" class="col-sm-3 control-label">
									<jdf:message code="system.lable.menu.parent"/>
								</label>
								<div class="col-sm-8">
									<select name="parentId" style="width: 200px"  class="form-control" >
										<option value="0">--</option>
										<jdf:selectCollection items="pathes" optionValue="objectId" optionText="path"/>
									</select>
								</div>
							 </div>
						</div>
					  	<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="status" class="col-sm-3 control-label">
									<jdf:message code="common.lable.status"/>
								</label>
								<div class="col-sm-8">
									 <select name="status" class="form-control" >
										<option value=""></option>
										<jdf:select dictionaryId="103"/>
									</select>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="orderId" class="col-sm-3 control-label">
									<jdf:message code="system.lable.menu.order"/>
								</label>
								<div class="col-sm-8">
									 <input type="text" class="form-control" id="orderId" name="orderId">
								</div>
							 </div>
						</div>
					
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="serverId" class="col-sm-3 control-label">
									<jdf:message code="system.lable.menu.server"/>
								</label>
								<div class="col-sm-8">
									<select name="serverId" class="form-control">
										<jdf:selectCollection items="servers" optionValue="objectId" optionText="name"/>
									</select>
								</div>
							</div>
						</div>
					</div>
					   
					 <div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="displayPosition" class="col-sm-3 control-label">
									<jdf:message code="system.lable.menu.location"/>
								</label>
								<div class="col-sm-8">
									<select name="displayPosition" class="form-control">
										<jdf:select dictionaryId="124"/>
									</select>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="url" class="col-sm-3 control-label">
									URL
								</label>
								<div class="col-sm-8">
									 <input type="text" class="form-control" id="url" name="url">
								</div>
							 </div>
						</div>
					 </div> 
					 
					 <div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="crud" class="col-sm-3 control-label">
									CRUD
								</label>
								<div class="col-sm-8">
									<label class="radio-inline"><input type="radio" name="crud" id="crud1" value="true">是</label>
									<label class="radio-inline"><input type="radio" name="crud" id="crud2" value="false">否</label>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="icon" class="col-sm-3 control-label">
									<jdf:message code="system.lable.menu.icon"/>
								</label>
								<div class="col-sm-8">
									<span id="iconSpan" class="${entity.icon}"></span>&nbsp;&nbsp;
									<input id="icon" name="icon" type="hidden"/><a href="#" onclick="selectIcon()" class="btn">选择</a>&nbsp;&nbsp;
								</div>
							 </div>
						</div>
					 </div> 
					
					<div class="row">
						<div class="col-sm-12 col-md-6">
							<div class="pull-right">
								<button type="submit" class="btn btn-primary">
									<span class="glyphicon glyphicon-ok"></span><jdf:message code="common.button.save"/>
								</button>
								<c:if test="${not empty message}">
									<button type="button"  class="btn btn-primary" onclick="toUrl('${dynamicDomain}/admin/menu/create?ajax=1')">
										<jdf:message code="common.button.goonAdd"/><i class="icon-double-angle-right icon-white"></i>
									</button>
								</c:if>
							</div>
						</div>
					</div>
				 </form>
			</jdf:form>
		</div>
	</div>
	<div style="display: none" id="selectIcon">
		<iframe src="${dynamicDomain}/admin/selectIcon?ajax=1"  width="100%" height="400px" frameborder=0 scrolling=no></iframe>
	</div>
	<jdf:bootstrapDomainValidate domain="Menu"/>
	<script type="text/javascript">
		function typeChange(){
			if($("#type").val()=="<%=Menu.TYPE_FOLDER%>"){
				$(".menuContent").hide();
				$("#orderId").attr("colspan",3);
			}else{
				$("#orderId").attr("colspan",1);
				$(".menuContent").show();
			}
		}
		$(document).ready(function(){
			$("#type").change(function(){
				typeChange();
			});
		});
		typeChange();
		function selectIcon(){
			 $("#selectIcon").dialog({height: 400,width:700,resizable:false,draggable:false,overlay:{overflow:"hidden"}});
		}
	</script>
</body>
