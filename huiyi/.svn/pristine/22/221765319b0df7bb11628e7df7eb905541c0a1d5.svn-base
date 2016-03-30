<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="站内信查看"/></title>
</head>
<body>
<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-fullscreen"></span><jdf:message code="站内信查看"/>
		</div>
	  	<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/message/save?ajax=1" class="form-horizontal" id="editForm">
					<input type="hidden" name="objectId">
			 		<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="fromUser" class="col-sm-3 control-label"><jdf:message code="发送人" /></label>
                                <div class="col-sm-5">
                                    <select  name="fromUser" id="fromUser"  style="width: 240px;" onchange="select();" disabled="disabled">
                                            <option value="">请选择</option>
                                            <jdf:selectCollection items="members" optionValue="objectId"  optionText="userName" />
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="fromCompany" class="col-sm-3 control-label"><jdf:message code="发送企业" /></label>
                                <div class="col-sm-5">
                                    <select  name="fromCompany" id="fromCompany"  style="width: 240px;" onchange="select();" disabled="disabled">
                                            <option value="">请选择</option>
                                            <jdf:selectCollection items="companys" optionValue="objectId"  optionText="nameZh" />
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="toCompany" class="col-sm-3 control-label"><jdf:message code="接收企业" /></label>
                                <div class="col-sm-5">
                                    <select  name="toCompany" id="toCompany"  style="width: 240px;" onchange="select();" disabled="disabled">
                                            <option value="">请选择</option>
                                            <jdf:selectCollection items="companys" optionValue="objectId"  optionText="nameZh" />
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="sendDate" class="col-sm-3 control-label"><jdf:message code="发送时间" /></label>
                                    <div class="col-sm-8">
                                   <input type="text" id="sendDate" name="sendDate" readonly="readonly" cell="date" format="yyyy-MM-dd HH:mm:ss"  style="width: 240px;">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <div class="form-group">
                                <label for="title" class="col-sm-2 control-label"><jdf:message code="标题" /></label>
                                <div class="col-sm-9">
                                	 <input type="text" readonly="readonly"  class="form-control" name="title" >
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <div class="form-group">
                                <label for="content" class="col-sm-2 control-label"><jdf:message code="内容" /></label>
                                <div class="col-sm-9">
                                	<textarea   name="content" class="form-control" disabled="disabled"></textarea>
                                </div>
                            </div>
                        </div>
                    </div> 
			</form>
		</jdf:form>
		</div>
	</div>
<script type="text/javascript">
		reloadParent=false;
		$(document).ready(function() {
		});
</script>		
</body>
</html>