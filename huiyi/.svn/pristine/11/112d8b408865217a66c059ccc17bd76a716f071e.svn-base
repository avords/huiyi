<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>导入企业</title>
</head>
<body>
    <div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-folder-open"></span> 导入企业
        </div>
            <form method="post" action="${dynamicDomain}/admin/company/importCompany?ajax=1" class="form-horizontal reject" id="editForm" enctype="multipart/form-data" >
                    <div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div><br>
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <div class="form-group">
                                <div class="col-sm-4">
                                    <input type="file" name="uploadFile" id="uploadFile" style="display: inline;">
                                </div>
                                <div class="col-sm-2">
                                    <a href="${dynamicDomain}/static/template/company_import.xls">下载模板</a>
                                </div>
                            </div>
                        </div>
                    </div>
                <div class="row" style="margin-top:50px;margin-left: 150px;margin-bottom: 20px;">
                    <div class="editPageButton">
                            <button type="button" class="btn btn-primary btn-lg" onclick="saveSubmit()">
                                <jdf:message code="common.button.save" />
                            </button>
                    </div>
                </div>
            </form>
    </div>
<script type="text/javascript">
function saveSubmit(){
	if($("#uploadFile").val()==''){
        alert('请选择文件！');
        return false;
    }
	$("#editForm").submit();
}
</script>    
</body>
</html>