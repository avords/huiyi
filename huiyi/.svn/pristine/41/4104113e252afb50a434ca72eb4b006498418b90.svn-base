<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>产品审核</title>
<style>
</style>
</head>
<body>
        <div class="panel panel-default">
        <div class="panel-heading">
            <span class=""></span>产品审核
            <div class="pull-right">
            </div>
        </div>
        <div class="panel-body">
            <jdf:form bean="request" scope="request">
            <form action="${dynamicDomain}/admin/sku/checkPage" method="post" class="form-horizontal">
                    <div class="row">
                        <div class="col-sm-12 alert alert-info" id="messageBox">
                            ${message}
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="search_EQL_category2.parent_id" class="col-sm-3 control-label">一级分类：</label>
                                <div class="col-sm-6">
                                    <select name="search_EQL_category2.parent_id" class="form-control" id="category1">
                                        <option value="">—全部—</option>
                                        <jdf:selectCollection items="firstCategory" optionValue="objectId" optionText="nameZh"/>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="search_EQL_category2.object_id" class="col-sm-3 control-label">二级分类：</label>
                                <div class="col-sm-6">
                                    <select name="search_EQL_category2.object_id" class="form-control" id="category2">
                                        <option value="">—全部—</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="search_LIKES_company.name_zh" class="col-sm-3 control-label">企业名称：</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="search_LIKES_company.name_zh" name="search_LIKES_company.name_zh">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="search_EQI_product.type" class="col-sm-3 control-label">产品类型：</label>
                                <div class="col-sm-6">
                                    <select name="search_EQI_product.type" class="form-control">
                                        <option value="">—全部—</option>
                                        <jdf:select dictionaryId="1502" valid="true" />
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="search_LIKES_product.name_zh" class="col-sm-3 control-label">产品名称：</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="search_LIKES_product.name_zh" name="search_LIKES_product.name_zh">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="search_LIKES_sku.sku_no" class="col-sm-3 control-label">产品编号：</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="search_LIKES_sku.sku_no" name="search_LIKES_sku.sku_no">
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
			        <jdf:table items="items" var="currentRowObject" retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit" action="${dynamicDomain}/admin/sku/checkPage">
			            <jdf:export view="csv" fileName="产品发布.csv" tooltip="导出CSV" imageName="csv" />
			            <jdf:export view="xls" fileName="产品发布.xls" tooltip="导出EXCEL" imageName="xls" />
			            <jdf:row>
			                <jdf:column property="1" title="<input type='checkbox' class='noBorder' name='pchk' onclick='pchkClick()'/>" style="width: 4%;text-align: center;" headerStyle="width: 4%;text-align: center;" viewsAllowed="html" sortable="false">
			                    <input type="checkbox" class="noBorder" name="schk" onclick="schkClick()" value="${currentRowObject[0]}" />
			                </jdf:column>
			                <jdf:column alias="操作" title="common.lable.operate" sortable="false" viewsAllowed="html" style="width: 4%">
			                    <a href="${dynamicDomain}/admin/product/check/${currentRowObject[0]}" class="btn btn-primary btn-mini">审核
			                    </a>
			                </jdf:column>
			                <jdf:column property="rowcount" sortable="false" cell="rowCount" title="序号" style="width:4%;text-align:center"/>
			                <jdf:column property="sku.status" title="审核状态" headerStyle="width:5%;" sortable="false">
			                   <jdf:columnValue dictionaryId="1505" value="${currentRowObject[1]}" />
			                </jdf:column>
			                <jdf:column property="company.name_zh" title="企业名称" headerStyle="width:10%;" sortable="false">
			                    ${currentRowObject[2]}
			                </jdf:column>
			                <jdf:column property="sku.sku_no" title="产品编号" headerStyle="width:10%;" sortable="false">
                                <a href="${dynamicDomain}/admin/product/view/${currentRowObject[0]}" style="color:blue;">
                                    ${currentRowObject[3]}
                                </a>
                            </jdf:column>
                            <jdf:column property="product.name_zh" title="产品名称" headerStyle="width:10%;" sortable="false">
                                <a href="${dynamicDomain}/admin/product/view/${currentRowObject[0]}" style="color:blue;">
                                    ${currentRowObject[4]}
                                </a>
                            </jdf:column>
			                <jdf:column property="product.category_id" title="产品类别" headerStyle="width:10%;" sortable="false">
			                    ${currentRowObject[5]}
			                </jdf:column>
			                 <jdf:column property="sku.attribute_vals" title="属性" headerStyle="width:10%;" sortable="false">
			                     ${currentRowObject[6]}
			                 </jdf:column>
			                 <jdf:column property="sku.sell_price_zh" title="人民币单价" headerStyle="width:7%;" sortable="false">
			                     ${currentRowObject[7]}
			                 </jdf:column>
			                 <jdf:column property="sku.sell_price_en" title="美元单价" headerStyle="width:7%;" sortable="false">
			                     ${currentRowObject[8]}
			                 </jdf:column>
			                 <jdf:column property="user.user_name" title="修改人" headerStyle="width:10%;" sortable="false">
                                 ${currentRowObject[9]}
                             </jdf:column>
                             <jdf:column property="sku.updated_on" title="修改时间" headerStyle="width:10%;" sortable="false" cell="date" format="yyyy-MM-dd">
                                 <fmt:formatDate value="${currentRowObject[10]}" pattern="yyyy-MM-dd HH:mm:ss"/>
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
                            $("#category2").val('${param["search_EQL_category2.object_id"]}').change();
                        }
                    });
                }
             }).change();
        });
    </script>
</body>
</html>