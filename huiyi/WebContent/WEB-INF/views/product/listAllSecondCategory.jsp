<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>产品分类属性管理</title>
</head>
<body>
        <div class="panel panel-default">
        <div class="panel-heading">
            <span class=""></span>产品分类属性管理
        </div>
        <div class="panel-body">
            <jdf:form bean="request" scope="request">
            <form action="${dynamicDomain}/admin/category/allSecondPage" method="post" class="form-horizontal">
                    <div class="row">
                        <div class="col-sm-12 alert alert-info" id="messageBox">
                            ${message}
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="search_EQL_parentId" class="col-sm-3 control-label">一级分类：</label>
                                <div class="col-sm-6">
                                    <select name="search_EQL_parentId" class="form-control" id="category1">
                                        <option value="">—全部—</option>
                                        <jdf:selectCollection items="firstCategory" optionValue="objectId" optionText="nameZh"/>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="search_EQL_objectId" class="col-sm-3 control-label">二级分类：</label>
                                <div class="col-sm-6">
                                    <select name="search_EQL_objectId" class="form-control" id="category2">
                                        <option value="">—全部—</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                     <div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="search_EQI_status" class="col-sm-3 control-label">状态：</label>
                                <div class="col-sm-6">
                                    <select name="search_EQI_status" class="form-control">
                                        <option value="">—全部—</option>
                                        <jdf:select dictionaryId="111" valid="true" />
                                    </select>
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
                    <jdf:table items="items" var="currentRowObject" retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit" action="${dynamicDomain}/admin/category/allSecondPage">
                        <jdf:export view="csv" fileName="产品分类属性管理.csv" tooltip="导出CSV" imageName="csv" />
                        <jdf:export view="xls" fileName="产品分类属性管理.xls" tooltip="导出EXCEL" imageName="xls" />
                        <jdf:row>
                            <jdf:column alias="操作" title="common.lable.operate" sortable="false" viewsAllowed="html" style="width: 4%">
                                <a href="${dynamicDomain}/admin/attribute/page?categoryId=${currentRowObject.objectId}" class="btn btn-primary btn-mini">编辑属性
                                </a>
                            </jdf:column>
                            <jdf:column property="rowcount" sortable="false" cell="rowCount" title="序号" style="width:4%;text-align:center"/>
                            <jdf:column property="parentName" title="一级分类" headerStyle="width:10%;" sortable="false"/>
                            <jdf:column property="nameZh" title="二级分类" headerStyle="width:10%;" />
                            <jdf:column property="attributeName" title="属性" headerStyle="width:30%;" sortable="false"/>
                            <jdf:column property="status" title="状态" headerStyle="width:10%;">
                                <jdf:columnValue dictionaryId="111" value="${currentRowObject.status}" />
                            </jdf:column> 
                        </jdf:row>
                    </jdf:table>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    $(function(){
        $("#category1").bind("change",function(){
            if($(this).val()){
                $.ajax({
                    url:"${dynamicDomain}/admin/category/getSecondCategory/" + $(this).val(),
                    type : 'post',
                    dataType : 'json',
                    success : function(json) {
                        $("#category2").children().remove();
                        $("#category2").append("<option value=''>—全部—</option>");
                        for ( var i = 0; i < json.secondCategory.length; i++) {
                            $("#category2").append("<option value='" + json.secondCategory[i].objectId + "'>" + json.secondCategory[i].nameZh + "</option>");
                        }
                        $("#category2").val('${param.search_EQL_objectId}').change();
                    }
                });
            }
         }).change();
    });
    </script>
</body>
</html>