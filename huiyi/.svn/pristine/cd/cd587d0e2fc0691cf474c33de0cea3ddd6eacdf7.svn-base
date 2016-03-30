<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>导入产品</title>
</head>
<body>
    <div>
        <div class="callout callout-info" style="height: 35px;">
            <div class="message-right">${message }</div>
            <h4 class="modal-title">导入产品</h4>
        </div>
            <form method="post" action="${dynamicDomain}/admin/product/importProduct?ajax=1" class="form-horizontal reject" id="editForm" enctype="multipart/form-data" >
                <div class="box-body">
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <div class="form-group">
                                <div class="col-sm-5">
                                    <input type="file" name="uploadFile" id="uploadFile" style="display: inline;">
                                </div>
                                <div class="col-sm-2">
                                    <a href="${dynamicDomain}/static/template/product_import.xls">下载模板</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="editPageButton">
                            <button type="submit" class="btn btn-primary">
                                <jdf:message code="common.button.save" />
                            </button>
                    </div>
                </div>
            </form>
    </div>
</body>
</html>