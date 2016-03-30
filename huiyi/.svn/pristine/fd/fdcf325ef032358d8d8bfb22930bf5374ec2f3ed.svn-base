<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="system.menu.dictionary"/></title>
</head>
<body>
	<div class="panel">
		<div class="panel-header">
			<i class="icon-edit"></i><jdf:message code="system.menu.dictionary"/>
		</div>
		<div class="panel-content">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/admin/dict/save?ajax=1" class="form-horizontal" id="editForm">
					<input type="hidden" name="objectId">
					<input type="hidden" name="sortId">
					<input type="hidden" name="type">
					<input type="hidden" name="parentId">	
					<div class="row-fluid">
						<div class="span12 alert alert-info" id="messageBox">
							${message}
						</div>
            			<div class="span6">
							<div class="control-group">
								<label class="control-label" for="dictionaryId"><jdf:message code="system.lable.dict.dictionary_id"/></label>
								<div class="controls">
									<input type="text" name="dictionaryId" id="dictionaryId" class="input-medium">
								</div>
							</div>
						</div>
						<div class="span6">
							<div class="control-group">
								<label class="control-label" for="name"><jdf:message code="system.lable.dict.name"/></label>
								<div class="controls">
									<input type="text" name="name" id="name" class="input-medium">
								</div>
							</div>
						</div>
						<div class="span6">
							<div class="control-group">
								<label class="control-label" for="value"><jdf:message code="system.lable.dict.value"/></label>
								<div class="controls">
									<input type="text" name="value" id="value" class="input-medium">
								</div>
							</div>
						</div>
						<div class="span6">
							<div class="control-group">
								<label class="control-label" for="order"><jdf:message code="system.lable.dict.order"/></label>
								<div class="controls">
									<input type="text" name="order" id="order" class="input-medium">
								</div>
							</div>
						</div>
						<div class="span6">
							<div class="control-group">
								<label class="control-label" for="status"><jdf:message code="common.lable.status"/></label>
								<div class="controls">
									<select name="status">
                                            <option value="">Select</option>
                                            <jdf:select dictionaryId="111"/>
                                        </select>
								</div>
							</div>
						</div>
            			<div class="span12">
							<div class="control-group">
								<label class="control-label" for="remark"><jdf:message code="system.lable.dict.remark"/></label>
								<div class="controls">
									<textarea rows="3" cols="80" name="remark"></textarea>
								</div>
							</div>
						</div>
						<div class="span12">
							<div class="btn-toolbar pull-right">
		                        <button type="submit" class="btn btn-primary"><i class="icon-save icon-white"></i><jdf:message code="common.button.save"/></button>
		                    </div>
		                </div>
					</div>
				</form>
			</jdf:form>
		</div>
	</div>
	<jdf:bootstrapDomainValidate domain="Dictionary"/>
</body>