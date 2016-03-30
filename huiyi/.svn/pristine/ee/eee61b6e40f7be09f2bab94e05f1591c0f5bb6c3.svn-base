<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>选择企业</title>
<style>
</style>
</head>
<body>
     <div class="panel panel-default">
        <div class="panel-heading">
            <span class=""></span>选择企业
        </div>
        <div class="panel-body">
         <jdf:form bean="request" scope="request">
         <form action="${dynamicDomain}/admin/company/companyTemplate?ajax=1" method="post" class="form-horizontal">
          <input type="hidden" name="inputName" value="${inputName }">      
                    <div class="row">
                        <div class="col-sm-12 alert alert-info" id="messageBox">
                            ${message}
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="search_LIKES_nameZh" class="col-sm-3 control-label">企业名称：</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="search_LIKES_nameZh" name="search_LIKES_nameZh">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12  col-md-12">
                            <div class="pull-right">
                                <button type="button" class="btn" onclick="clearForm(this)">
                                    <span class="glyphicon glyphicon-remove"></span><jdf:message code="common.button.clear" />
                                </button>
                                <button type="submit" class="btn  btn-primary">
                                    <span class="glyphicon glyphicon-search"></span><jdf:message code="common.button.query" />
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </jdf:form>
            <div id="tableDiv" class="row">
                <div class="col-sm-12 col-md-12">
                    <jdf:table items="items" var="currentRowObject" retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit" action="companyTemplate?ajax=1">
			            <jdf:row>
			                <jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" headerStyle="width: 10%" style="text-align:center">
			                    <button type="button" class="btn btn-primary" onclick="javascript:setCompany(${currentRowObject.objectId},'${currentRowObject.nameZh}')">选择</button>
			                </jdf:column>
			                <jdf:column property="rowcount" cell="rowCount" title="序号" headerStyle="width: 4%" style="text-align:center" sortable="false" />
			                <jdf:column property="nameZh" title="企业中文名称" headerStyle="width:20%;" >
			                    <div class="text-ellipsis" style="width: 120px;" title="${currentRowObject.nameZh}">
			                    ${currentRowObject.nameZh}</div>
			                </jdf:column>
			                <jdf:column property="nameEn" title="企业英文名称" headerStyle="width:20%;" >
			                    <div class="text-ellipsis" style="width: 120px;" title="${currentRowObject.nameEn}">
			                    ${currentRowObject.nameEn}</div>
			                </jdf:column>
			            </jdf:row>
			        </jdf:table>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    function setCompany(companyId,companyName){
        $(window.parent.document).find("input[name='${inputName}Name']").val(companyName);
        $(window.parent.document).find("input[name='${inputName}Id']").val(companyId);
        parent.$.colorbox.close();
    }
    </script>
</body>
</html>