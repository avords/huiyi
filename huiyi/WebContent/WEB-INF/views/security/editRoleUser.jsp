<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<jdf:themeFile file="FilterMultSelect.js" />
<title><jdf:message code="system.lable.role.config_user"/></title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-edit"></span><jdf:message code="system.lable.role.config_user"/>(${role.name})
		</div>
		<div class="panel-body">
			<form action="${dynamicDomain}/admin/role/saveRoleUser?ajax=1" method="post" name="UserRole" id="UserRole"  class="form-horizontal" onsubmit="prepare();">
				<input type="hidden" name="roleId" value="${role.objectId}">
				<div class="row">
					<div class="col-sm-12 alert alert-info" id="messageBox">
						${message}
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-md-6">
						<div class="form-group">
							<jdf:message code="common.lable.selected"/>
							<input class="input-mini" type="text" name="leftInput" id="leftInput"/> 
							<button type="button" class="btn"  id="leftFilter"><jdf:message code="common.lable.filter"/></button>
						</div>
					</div>
					<div class="col-sm-6 col-md-6">
						<div class="form-group">
							<jdf:message code="common.lable.unselected"/>
							<input class="input-mini" type="text" name="rightInput" id="rightInput"/> 
							<button type="button" class="btn"  id="rightFilter"><jdf:message code="common.lable.filter"/></button>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-5 col-md-5">
						<div class="form-group">
							<label for="name" class="col-sm-6 control-label">
								<select name="menuId" id="selected" multiple="multiple" style="width: 300px;" size="15">
									<jdf:selectCollection items="haveMenus" optionValue="objectId" optionText="fullName"/>
								</select>
							</label>
						</div>
					</div>
					<div class="col-sm-2 col-md-2">
						<div class="span2" style="line-height: 300px;vertical-align:middle;text-align: center;margin: 0 auto;">
							<img title="Add Select" src="<jdf:theme/>img/oneLeft.gif" id="rightToLeft" class="moveButton">
							<img title="Delete Select" src="<jdf:theme/>img/oneRight.gif" id="leftToRight" class="moveButton">
						</div>
					</div>
					<div class="col-sm-5 col-md-5">
						<div class="form-group">
							<label for="name" class="col-sm-6 control-label">
								<select name="unSelected" id="unSelected" multiple="multiple" style="width: 300px;" size="15">
									<jdf:selectCollection items="notHaveMenus" optionValue="objectId" optionText="fullName"/>
								</select>
							</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="pull-right">
							<button type="submit" class="btn btn-primary">
								<span class="glyphicon glyphicon-ok"></span><jdf:message code="common.button.save"/>
							</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
	function prepare() {
		var theform = document.UserRole;
		var userIdSelected = theform.selected;
		for(var i = userIdSelected.options.length-1; i >= 0; i--){
			userIdSelected.options[i].selected = true;
		}

		//$("#unSelected").empty();
	}
	$(document).ready(function() {
		filterMultSelect("selected","unSelected","rightToLeft","leftToRight","leftInput","rightInput","leftFilter","rightFilter");
		refreshParentPage(false);
	});
	</script>
</body>
</html>