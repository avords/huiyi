<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>产品运营一级分类</title>
</head>
<body>
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="menu-icon glyphicon glyphicon-align-left icon-white"></span>产品运营一级分类
                <c:choose>
                    <c:when test="${entity.objectId eq null }">—新增</c:when>
                    <c:otherwise>—修改</c:otherwise>
                </c:choose>
        </div>
        <div class="panel-body">
            <jdf:form bean="entity" scope="request">
                <form method="post" action="${dynamicDomain}/admin/category/save?ajax=1" class="form-horizontal" id="category">
                    <input type="hidden" name="objectId">
                    <input type="hidden" name="layer"  value="1">
                    <input type="hidden" name="parentId"  value="0">
                    <div class="row">
                        <div class="col-sm-12 alert alert-info" id="messageBox">
                            ${message}</div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="type">
                                 <jdf:message code="类型" />
                                  </label>
                                <div class="col-sm-8">
                                     <select name="type" class="form-control">
                                            <option value="">—请选择—</option>
                                            <jdf:select dictionaryId="1502" valid="true" />
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="nameZh">
                                 <jdf:message code="一级分类中文名称 " />
                                  </label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="nameZh" maxlength="50">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="nameEn">
                                 <jdf:message code="一级分类英文名称 " />
                                  </label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="nameEn" maxlength="50">
                                </div>
                            </div>
                        </div>
                    </div>
                         <div class="row">
                            <div class="col-sm-12 col-md-12">
                                <div class="form-group">
                                    <label for="sortNo" class="col-sm-3 control-label">排序</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="{sortNoVerify:true} form-control" name="sortNo">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-12">
                                <div class="form-group">
                                    <label for="status" class="col-sm-3 control-label">状态</label>
                                    <div class="col-sm-8">
                                        <select name="status" class="form-control">
	                                        <option value="">—全部—</option>
	                                        <jdf:select dictionaryId="111" valid="true" />
	                                    </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                        <div class="col-sm-12 col-md-6">
                            <div class="pull-right">
                                <button class="btn btn-primary" type="submit">
                                    <span class="glyphicon glyphicon-ok"></span>保存
                                </button>
                            </div>
                        </div>
                    </div>
                    </div>
                </form>
            </jdf:form>
        </div>
    <jdf:bootstrapDomainValidate domain="Category" />
</body>
</html>