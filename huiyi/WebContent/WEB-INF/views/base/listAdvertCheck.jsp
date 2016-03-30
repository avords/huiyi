<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>广告审核</title>
</head>
<body>
	 <div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-cog"></span>广告审核
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}${searchPath}" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<input type="hidden" class="form-control"  id="advertStatus" name="advertStatus" value="${advertStatus }">
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQS_positonCode" class="col-sm-2 control-label">
									<jdf:message code="广告位置"/>
								</label>
								<div class="col-sm-8">
									 <select  name="search_EQS_positionCode"  id="positionCode"  style="width: 240px;">
                                            <option value="">全部</option>
                                            <jdf:selectCollection items="positions" optionValue="positionCode" optionText="positionName" />
                                    </select>
								</div>
							 </div>
						</div>	
					
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_advertName" class="col-sm-2 control-label">
									<jdf:message code="广告名称"/>
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" style="width: 240px;" id="search_LIKES_advertName" name="search_LIKES_advertName" onkeyup="replaceSpace(this)" onkeydown="replaceSpace(this)">
								</div>
							</div>
					</div>
					</div>	
					 <div class="row">
						<div class="col-sm-12  col-md-12">
							<div class="pull-right">
								<button type="button" class="btn" onclick="clearForm(this)">
									<span class="glyphicon glyphicon-remove"></span>
									<jdf:message code="common.button.clear" />
								</button>
								<button type="submit" class="btn btn-primary">
									<span class="glyphicon glyphicon-search"></span>
									<jdf:message code="common.button.query" />
								</button>
							</div>
						</div>
					 </div>
				 </form>
			</jdf:form>
			<div id="tableDiv" class="row">
				<div class="col-sm-12 col-md-12">
					<jdf:table items="items" var="currentRowObject" retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit" action="page">
						<jdf:export view="csv" fileName="advert.csv" tooltip="Export CSV" imageName="csv" />
						<jdf:export view="xls" fileName="advert.xls" tooltip="Export EXCEL" imageName="xls" />
						<jdf:row>
							<jdf:column property="advertName" title="广告名称" style="width: 10%" />
							<jdf:column property="positionCode" title="广告位置" style="width: 10%" >
								<jdf:columnCollectionValue items="positions" nameProperty="positionName" valueProperty="positionCode" value="${currentRowObject.positionCode}"/>
							</jdf:column>
			                <jdf:column property="url" title="跳转网址" style="width: 20%" />
			                <jdf:column property="uploadDate" title="上传时间" style="width:10%" cell="date"/>
			                <jdf:column property="dispalyOrder" title="显示顺序" style="width:10%" />
			                <jdf:column property="advertStatus" title="广告状态" style="width:10%" >
							   <jdf:columnValue dictionaryId="1002" value="${currentRowObject.advertStatus}"/>
							</jdf:column>
							<jdf:column alias="查看" title="查看" sortable="false" viewsAllowed="html" style="width:15%">
								<a href="${dynamicDomain}/admin/advert/viewAdvert/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large">
									<span class="glyphicon glyphicon-fullscreen"></span><jdf:message code="查看广告"/>
								</a>
							</jdf:column>
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" style="width: 15%">
                                   <c:if test="${currentRowObject.advertStatus==2}">
                                    <a href="javascript:;" class="btn btn-warning btn-mini" onclick="show_audit_confirm2('${dynamicDomain}/admin/advert/audit/${currentRowObject.objectId}?advertStatus=5');">
                                        <span class="glyphicon glyphicon-check"></span><jdf:message code="审核"/>
                                    </a>
                                </c:if>
                            </jdf:column>
						</jdf:row>
					</jdf:table>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function show_audit_confirm2(url){
    var r=confirm("确定要审核通过吗?");
    if (r==true){
      window.location.href=url;
    }else{
      }
    }
    function show_audit_confirm3(url){
        var r=confirm("确定要复核通过吗?");
        if (r==true){
          window.location.href=url;
        }else{
          }
        }
    function show_audit_confirm4(url){
        var r=confirm("确定要发布通过吗?");
        if (r==true){
          window.location.href=url;
        }else{
          }
        }
    function replaceSpace(obj){
    	   obj.value = obj.value.replace("%","")
    	 }
    </script>
</body>
</html>