<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>产品分类属性</title>
</head>
<body>
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="menu-icon glyphicon glyphicon-align-left icon-white"></span>产品分类属性
                <c:choose>
                    <c:when test="${entity.objectId eq null }">—新增</c:when>
                    <c:otherwise>—修改</c:otherwise>
                </c:choose>
        </div>
        <div class="panel-body">
            <jdf:form bean="entity" scope="request">
                <form method="post" action="${dynamicDomain}/admin/attribute/save?ajax=1" class="form-horizontal" id="category" onsubmit="return customeValid();">
                    <input type="hidden" name="objectId">
                    <input type="hidden" name="categoryId" value="${category.objectId }">
                    <div class="row">
                        <div class="col-sm-12 alert alert-info" id="messageBox">
                            ${message}</div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <div class="form-group">
                                <label class="col-sm-3 col-xs-3 control-label" for="category">产品类别
                                  </label>
                                <div class="col-sm-8 col-xs-8">
                                    ${category.parentName }>>${category.nameZh }
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <div class="form-group">
                                <label class="col-sm-3 col-xs-3 control-label" for="name">属性名称
                                  </label>
                                <div class="col-sm-4 col-xs-4">
                                    <input type="text" class="form-control" name="nameZh" placeholder="属性中文名称">
                                    
                                </div>
                                <div class="col-sm-4 col-xs-4">
                                    <input type="text" class="form-control" name="nameEn" placeholder="属性英文名称">
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <div class="form-group">
                                <label class="col-sm-3 col-xs-3 control-label" for="type">属性类型
                                  </label>
                                <div class="col-sm-8 col-xs-8">
                                    <select name="type" class="form-control">
                                            <option value="">—全部—</option>
                                            <jdf:select dictionaryId="1501" valid="true" />
                                        </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                            <div class="col-sm-12 col-md-12">
                                <div class="form-group">
                                    <label for="status" class="col-sm-3 col-xs-3 control-label">状态</label>
                                    <div class="col-sm-8 col-xs-8">
                                        <select name="status" class="form-control">
                                            <option value="">—全部—</option>
                                            <jdf:select dictionaryId="111" valid="true" />
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="row">
                            <div class="col-sm-12 col-md-12">
                                <div class="form-group">
                                    <label for="sortNo" class="col-sm-3 col-xs-3 control-label">排序</label>
                                    <div class="col-sm-8 col-xs-8">
                                        <input type="text" class="{sortNoVerify:true} form-control" name="sortNo">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="margin-left: 20px;">
                                  <table class="tableAttr" style="width:100%;">
                                     <thead>
                                         <tr>
                                             <th width="30%">子规格中文名</th> <th width="30%">子规格英文名</th><th width="30%">排序</th> <th width="10%"></th>
                                         </tr>
                                     </thead>
                                     <tbody>
                                       <c:forEach var="item" items="${attributeValues}" varStatus="num">
                                         <tr>
                                             <td>
                                                 <input type="hidden" name="objectId1" value="${item.objectId }">
                                                 <input type="text"  name="attributeValueNameZh" value="${item.nameZh }">
                                             </td> 
                                             <td>
                                                 <input type="text"  name="attributeValueNameEn" value="${item.nameEn }">
                                             </td> 
                                             <td><input type="text"  name="sortNo1" value="${item.sortNo}"></td>
                                             <td><input type="button" data-id="${item.objectId }" value="删除" class="delete-value"/></td>
                                         </tr>
                                        </c:forEach>
                                         <tr>
                                           <td></td>
                                           <td></td>
                                           <td></td>
                                           <td><input type="button" value="添加" class="create-value1"/></td>
                                       </tr>
                                     </tbody>
                                  </table>
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
    <jdf:bootstrapDomainValidate domain="Attribute" />
    <script type="text/javascript">
    function calculation1(){
        var count = $("input[name='sortNo1']").length;
        return count;
    }
    $(function(){
        $('.delete-value').click(function(){
            //如果有产品则不删除
            if(!confirm('你确定要删除此规格吗?')){
                return false;
            }
            var obj = $(this);
            var id = $(this).data('id');
            if(id!=''){
                $.ajax({
                      url:'${dynamicDomain}/admin/attribute/deleteValue/'+id,
                      type : 'post',
                      async : false,
                      dataType : 'json',
                      success : function(json) {
                          if(json.result){
                              obj.parent().parent().remove();
                          }
                          alert(json.message); 
                      }
                  });
            }else{
                $(this).parent().parent().remove();
            }
        });
        $('.create-value1').click(function(){
            var count = calculation1();
            if(count>=12){
                winAlert('子规格不能多于12个');
                return false;
            }
            var str = '<tr>'+
                '<td>'+
                    '<input type="hidden" name="objectId1">'+
                    '<input type="text"  name="attributeValueNameZh">'+
                '</td>'+
                '<td>'+
                 '<input type="text"  name="attributeValueNameEn">'+
                '</td>'+
                '<td><input type="text"  name="sortNo1"></td>'+
                '<td><input type="button" value="删除" class="delete-value"/></td>'+
                '</tr>';
            $(this).parent().parent().before(str);
            $('.delete-value').click(function(){
                $(this).parent().parent().remove();
            });
        });
        
        if('${param.result}'=='true'){
            alert('操作成功');
            parent.$.colorbox.close();
        }
    });
    function verifiSortNo1(){
        var sort1 = new Array();
         $("input[name='sortNo1']").each(function(){
             sort1.push($(this).val());
         });
         for(var i=0;i<sort1.length;i++){
             if(sort1[i]==''){
                 alert('排序不能为空！');
                 return false;
             }
             if(!/^\d+(\.\d)?$/.test(sort1[i])){
                 alert('排序必须输入最多一位小数');
                 return false;
            }
         }
         return true;
    }
    
    function verification1(){
        var att1 = new Array();
        $("input[name='attributeValueNameZh']").each(function(){
            att1.push($(this).val());
        });
//         if(att1.length==0){
//             alert('必须填写子规格!');
//             return false;
//         }
        
        var att2 = new Array();
        $("input[name='attributeValueNameEn']").each(function(){
            att2.push($(this).val());
        });
//         if(att2.length==0){
//             alert('必须填写子规格!');
//             return false;
//         }
        for(var i=0;i<att1.length;i++){
            if(att1[i]==''){
                alert('子规格中文名称不能为空！');
                return false;
            }
            for(var j=i+1;j<att1.length;j++){
                if(att1[i]==att1[j]){
                    alert('子规格中文名称不能重复！');
                    return false;
                }
            }
        }
        for(var i=0;i<att2.length;i++){
            if(att2[i]==''){
                alert('子规格英文名称不能为空！');
                return false;
            }
            for(var j=i+1;j<att2.length;j++){
                if(att2[i]==att2[j]){
                    alert('子规格英文名称不能重复！');
                    return false;
                }
            }
        }
        return true;
    }
    function customeValid(){
        var flag = verification1()&&verifiSortNo1();
        return flag;
    }
    </script>
</body>
</html>