<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title><jdf:message code="label_inquiryList_Search inquiry"/></title>
<meta charset="utf-8">
<link rel="stylesheet" href="${dynamicDomain}/static/assets/css/member.css">
<jdf:themeFile file="My97DatePicker/WdatePicker.js" />
<jdf:themeFile file="jquery.validate.min.js" />
<jdf:themeFile file="jquery.validate_zh.js" />
<jdf:themeFile file="jquery.validate_en.js" />
<jdf:themeFile file="jquery.twbsPagination.js" />
<jdf:themeFile file="jquery.SuperSlide.2.1.1.js" />
</head>
<body>
<div class="container member">
    <%@ include file="common/member_seller_left.jsp"%>
    <div class="merberBody">
      <div class="tag-box tag-box-v3 form-page">
        <div class="headline">
          <h3><jdf:message code="label_inquiryList_Search inquiry"/></h3>
        </div>
        <div class="row margin-bottom-10">
          <div class="col-md-12">
            <form class="form-horizontal" action="${dynamicDomain}/member/searchInquiry" method="post" role="form">
              <div class="row">
				<div class="col-sm-5 col-md-5">
	              <div class="form-group">
	                <label for="status" class="col-md-4 control-label"><jdf:message code="label_inquiry_product_name"/>：</label>
	                <div class="col-md-8">
	                	<input type="text" class="form-control" id="searchText" name="searchText" value="${searchText }" >
	                </div>
	              </div>
	          	</div>
	          <div class="col-sm-7 col-md-7">
	              <div class="form-group">
	                <label for="inputEmail1" class="col-md-3 control-label"><jdf:message code="label_send_time"/>：</label>
	                <div class="col-md-9">
	                	<input value="<fmt:formatDate value="${startDate }" pattern="yyyy-MM-dd HH:mm:ss"/>" type="text" style="width:170px;height:33px;" id="startDate" name="startDate" size="14" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'endDate\')}',readOnly:true})">~ 
	                    <input value="<fmt:formatDate value="${endDate }" pattern="yyyy-MM-dd HH:mm:ss"/>" type="text" style="width:170px;height:33px;" id="endDate" name="endDate" size="14" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'startDate\')}',readOnly:true})">
	                </div>
	              </div>
	          	</div>
	          </div>
	          <div class="row">
				<div class="col-sm-5 col-md-5">
	              <div class="form-group">
	                <label for="status" class="col-md-4 control-label"><jdf:message code="label_inquiryList_status"/>：</label>
	                <div class="col-md-8">
		                <select class="form-control" name="status" id="status">
				             <option value="">—<jdf:message code="label_inquiry_choose"/>—</option>
								<jdf:select dictionaryId="1507" valid="true"/>
			            </select>
		            </div>
	              </div>
	          	</div>
	          </div>        
              <div class="row">
		          <div class="col-md-12 margin-bottom-10" style="text-align:right;">
		            <button type="button" class="btn-u btn-u-blue btn-u-sm" style="width:80px;" onclick="clearForm1()"><jdf:message code="common.button.clear" /></button>
		            <button class="btn-u btn-u-blue btn-u-sm" type="submit" style="width:80px;"><jdf:message code="common.button.query" /></button>
		           </div>
            </form>
          </div>
        </div>
        <div class="row fbTable">
          <table class="table">
            <thead>
              <tr>
                <th><jdf:message code="table_top_no"/></th>
                <th><jdf:message code="label_inquiryList_channel"/></th>
                <th><jdf:message code="label_send_time"/></th>
                <!--  
                <th>截止日期</th>
                -->
                <th><jdf:message code="label_inquiryList_if"/></th>
                <th><jdf:message code="label_inquiryList_s_status_s"/></th>
                <th><jdf:message code="table_top_operation"/></th>
              </tr>
            </thead>
            <tbody>
           <c:forEach items="${inquirys}" var="item" varStatus="vs">
              <tr>
                <td>${vs.count }</td>
                <td><div class="inquire-text">
                    <h4 class="clearfix">
                    <c:choose>
                    	<c:when test="${item.productId==0}">
                    		<a href="${dynamicDomain}/home/products">
                    	</c:when>
                    	<c:otherwise>
                    		<a href="${dynamicDomain }/home/product/detail/${item.productId}">
                    	</c:otherwise>
                    </c:choose>${item.productName }</a></h4>
                    <c:if test="${not empty item.productImg  }">
						<a href="#"><img src="${item.productImg }" /></a>
					</c:if>
                    <div><jdf:message code="label_inquiry_quantity"/>：${item.quantity }  <jdf:columnValue dictionaryId="1503" value="${item.unit }" /></div>
                    <!-- <div><jdf:message code="label_country"/>：中国</div> -->
                    <p>${item.description }</p>
                  </div></td>
                <td><fmt:formatDate value="${item.sendDate }" pattern="yyyy-MM-dd"/></td>
                <!--  
                <td><fmt:formatDate value="${item.expiredDate }" pattern="yyyy-MM-dd"/></td>
                !-->
                <td>
                	<c:choose>
                		<c:when test="${item.offerStatus == 2 }">
                			<jdf:columnValue dictionaryId="109" value="1" />
                		</c:when>
                		<c:otherwise>
                			<jdf:columnValue dictionaryId="109" value="0" />
                		</c:otherwise>
                	</c:choose>
                </td>
                <td class="color-green" id = "td${item.objectId }"><jdf:columnValue dictionaryId="1507" value="${item.offerStatus }" /></td>
                <td>
                	<span class="editor">
                		<c:choose>
                		<c:when test="${item.offerStatus ==3 }">
                			<jdf:message code="label_inquiryList_guoqi"/>
                		</c:when>
                		<c:when test="${item.offerStatus ==2 }">
                			<a class="color-blue" href="#" data-toggle="modal" data-target="#QuotationModal" onclick="updateOffer(${item.objectId },'${item.productName }','${item.description }')"><jdf:message code="label_inquiryList_gengxinbaojia"/></a>
                		</c:when>
                		<c:otherwise>
                			<a class="color-blue" href="#" data-toggle="modal" data-target="#QuotationModal" onclick="offer(${item.objectId },'${item.productName }','${item.description }')"><jdf:message code="label_inquiryList_baojia2"/></a>
                		</c:otherwise>
                		</c:choose>
                	</span>
                </td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
           	<!-- 分页 -->
					<div class="pagination" id="pagination" style="margin-left:280px;height:30px;">
						<div class="page_numbers"></div>
					</div>
			<!--/ 分页 -->
        </div>
      </div>
    </div>
</div>
<!-- 报价弹窗begin -->
<div class="modal fade" id="QuotationModal" tabindex="-1" role="dialog" aria-labelledby="QuotationModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="QuotationModalLabel"><jdf:message code="label_inquiryList_baojia_gengxin"/></h4>
      </div>
      <div class="modal-body">
      <jdf:form bean="entity" scope="request">
        <form method="post" action="${dynamicDomain}/member/releaseOffer" class="form-horizontal" id="offer" >
		<input type="hidden" name="inquiryId" id="inquiryId">
		<input type="hidden" name="quotationId" id="quotationId">
          <div class="form-group">
            <label class="col-lg-2 control-label"></span><jdf:message code="label_inquiryList_baojia"/></label>
            <div class="col-lg-3">
              <input type="text" class="form-control" id="fromCompanyName" name="fromCompanyName" value="${fromCompanyName}" readonly="readonly">
            </div>
             <label class="col-lg-2 control-label"><jdf:message code="label_inquiry_fromCompany"/></label>
            <div class="col-lg-3">
              <input type="text" class="form-control" id="toCompanyName" name="toCompanyName"  readonly="readonly">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-2 control-label"><span class="text-danger"> </span><jdf:message code="label_inquiry_product_name"/></label>
            <div class="col-lg-8">
              <input type="text" class="form-control" id="productName" name="productName" readonly="readonly">
            </div>
          </div>
         <div class="form-group">
            <label class="col-lg-2 control-label"><span class="text-danger"> </span><jdf:message code="label_inquiry_description"/></label>
            <div class="col-lg-8">
              <textarea class="form-control" rows="3" readonly="readonly" id="description"></textarea><br>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-2 control-label">Payment Terms</label>
            <div class="col-lg-8">
            	<huiyi:checkBox dictionaryId="1504" name="paymentTerms" />
           	</div>
          </div>
         <div class="form-group">
            <label class="col-lg-2 control-label"><span class="red">* </span><jdf:message code="label_inquiryList_Minimum purchase quantity"/></label>
            <div class="col-lg-4">
              <input type="text" class="required form-control" name="quantity" id="quantity">
            </div>
            <div class="col-lg-2">
              <select class="required form-control" name="unit" id="unit">
					<jdf:select dictionaryId="1503" valid="true" />
              </select>
            </div>
         </div>
         <div class="form-group">
            <label class="col-lg-2 control-label"><span class="red">* </span><jdf:message code="label_inquiryList_Total price"/></label>
            <div class="col-lg-4">
              <input type="text" class="required form-control" name="price" id="price">
            </div>
            <div class="col-lg-2">
              <select class="required form-control" name="priceUnit" id="priceUnit">
                        <jdf:select dictionaryId="1508" valid="true" />
              </select>
            </div>
         </div>
         <div class="form-group">
            <label class="col-lg-2 control-label"><span class="red">* </span><jdf:message code="label_inquiryList_baojiadate"/></label>
            <div class="col-lg-4">
              <input type="text" class="form-control" id="sendDate" name="sendDate" class="Wdate" 
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
            </div>
         </div>
        
        </form>
        </jdf:form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><jdf:message code="label_inquiry_cancel"/></button>
        <button type="button" class="btn btn-primary" onclick="subform();"><jdf:message code="label_inquiry_submit"/></button>
      </div>
    </div>
  </div>
</div>
<!-- 报价弹窗end -->
 <script type="text/javascript">
 $(function(){
	 	$('#offer').validate();
		$('#searchInquiry').addClass("active");
		$('#status').val(${status});
		<c:if test="${pageSearch.totalPage != 0}">
        $("#pagination").twbsPagination({
              totalPages: ${pageSearch.totalPage},
              visiblePages: 5,
              startPage:${pageSearch.currentPage},
              onPageClick: function (event, page) {
                $('#page-content').text('Page ' + page);
                window.location.href = "${dynamicDomain}/member/searchInquiry?ec_p="+page;
           }
        });
       </c:if>
	});
 function offer(inquiryId,productName,description){
	 $("#inquiryId").val(inquiryId);
	 $("#productName").val(productName);
	 $("#description").val(description);
	 $.ajax({
			url: "${dynamicDomain}/member/readInquiry?inquiryId="+inquiryId,
			type : 'post',
			dataType : 'json',
			success :function (data) {
				$('#td'+inquiryId).text("已读");
				$("#toCompanyName").val(data.toCompanyName);
			}
	});
 }
 
 function updateOffer(inquiryId,productName,description){
	 $("#inquiryId").val(inquiryId);
	 $("#productName").val(productName);
	 $("#description").val(description);
	 $.ajax({
			url: "${dynamicDomain}/member/getQuotationInfo?inquiryId="+inquiryId,
			type : 'post',
			dataType : 'json',
			success :function (data) {
			 //对请求返回的JSON格式进行分解加载
			 	 $("#quotationId").val(data.quotation.objectId);
				 $("#fromCompanyName").val(data.quotation.fromCompanyName);
				 $("#toCompanyName").val(data.quotation.toCompanyName);
				 $("#paymentTerms").val(data.quotation.paymentTerms);
				 $("#quantity").val(data.quotation.quantity);
				 $("#unit").find("option[value="+data.quotation.unit+"]").attr("selected",true);
				 $("#price").val(data.quotation.price);
				 $("#priceUnit").find("option[value="+data.quotation.priceUnit+"]").attr("selected",true);
				 $("#sendDate").val(data.sendDate);
			   	for(var i=0;i<data.paymentTerms.length;i++){
			   	 $('#paymentTerms'+data.paymentTerms[i].paymentTermId).attr("checked",'checked');
			   	}
			          
			}
	});
 }
 function clearForm1(){
		$('#searchText').val("");
		$('#startDate').val("");
		$('#endDate').val("");
		$('#status').val("");
	}
 
 function subform(){
	 $('#offer').validate();
	 $('#offer').submit();
 }
 </script>
</body>
</html>