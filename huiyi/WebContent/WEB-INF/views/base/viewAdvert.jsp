<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="广告查看"/></title>
</head>
<body>
<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-fullscreen"></span><jdf:message code="广告查看"/>
		</div>
	  	<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/advert/save?ajax=1" class="form-horizontal" id="editForm">
					<input type="hidden" name="objectId">
			 		<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="positionCode" class="col-sm-3 control-label"><jdf:message code="广告位置" /></label>
                                <div class="col-sm-5">
                                    <select  name="positionCode" id="positionCode"  style="width: 240px;" onchange="select();" disabled="disabled">
                                            <option value="">请选择</option>
                                            <jdf:selectCollection items="positions" optionValue="positionCode"  optionText="positionName" />
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="advertName" class="col-sm-3 control-label"><jdf:message code="广告名" /></label>
                                <div class="col-sm-8">
                                	<input type="text" readonly="readonly" name="advertName"  style="width: 240px;" >
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="userName" class="col-sm-3 control-label"><jdf:message code="上传人" /></label>
                                    <div class="col-sm-8">
                                   <input type="text" readonly="readonly" name="userName" value=${modifier.userName }   style="width: 240px;">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="uploadDate" class="col-sm-3 control-label"><jdf:message code="上传时间" /></label>
                                    <div class="col-sm-8">
                                   <input type="text" id="uploadDate" name="uploadDate" readonly="readonly" cell="date" format="yyyy-MM-dd HH:mm:ss"  style="width: 240px;">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="url" class="col-sm-3 control-label"><jdf:message code="链接地址" /></label>
                                <div class="col-sm-5">
                                	 <input type="text" readonly="readonly"  name="url"  style="width: 240px;">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="dispalyOrder" class="col-sm-3 control-label"><jdf:message code="显示顺序" /></label>
                                <div class="col-sm-5">
                                	<input type="text" readonly="readonly" name="dispalyOrder"  style="width: 240px;">
                                </div>
                            </div>
                        </div>
                    </div> 
                   <div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="pictureWidth">
                                <jdf:message code="图片宽度" />
                                </label>
                                <div class="col-sm-4">
                                    <input type="text" name="pictureWidth" id="pictureWidth" readonly="readonly" class="form-control"  style="width: 240px;">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="pictureHeight">
                                <jdf:message code="图片高度" />
                                </label>
                                <div class="col-sm-4">
                                    <input type="text" name="pictureHeight" readonly="readonly" id="pictureHeight" class="form-control"  style="width: 240px;">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group" >
                                <label for="advertFileViewPath" class="col-sm-3 control-label"><jdf:message code="图片" /></label>
                                <div id="mainImg" style="width:500px;margin-left: 100px;">
                                    <c:if test="${entity.objectId != null&& entity.pictureAddress!=null }">
                                          <img alt="" src="${dynamicDomain}${entity.pictureAddress}" width="500px">
                                    </c:if>
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
			var positionCode=$("#positionCode").val();
			$.ajax({
				type:'post',
				url:'<%=dynamicDomain%>/admin/advert/selectAdvertPosition/'+positionCode,
				dataType:'json',
	            data:"{'positionCode':'value'}",
	            success:function(msg){
		        	if(msg.result){
		        		$("#pictureWidth").val(msg.advertPosition.width);
						$("#pictureHeight").val(msg.advertPosition.height);
		        	}
			     }
	        });
			
		});
</script>		
</body>
</html>