<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="taglibs.jsp"%>
<div>
	<!--  ************************************分页 *************************************	-->
	<input type="hidden" name="ec_i" value="ec" /> 
	<input type="hidden" name="ec_eti" /> 
	<input type="hidden" name="ec_ev" /> 
	<input type="hidden" name="ec_efn" /> 
	<input type="hidden" name="ec_crd" value="15" /> 
	<input type="hidden" name="ec_p" id="ec_p" value="${pageSearch.page}" />
</div>
<table width='100%' cellpadding=1 cellspacing=0 border='0' align='center'>
	<tr>
		<td align='left'>&nbsp; <c:if test="${fn:length(pageSearch.list)>0}">
			<font color='#000000'>共${pageSearch.totalCount}条记录，分${pageSearch.totalPage}页显示</font> &nbsp;
				第<input id="page" name="page" onkeypress="if(event.keyCode==13) {toPage($('#page').val());};"
						style="width: 30px; text-align: center" value="${page }">页
				<button type="button" onclick="javascript:toPage($('#page').val());">GO</button>
			</c:if> <c:if test="${fn:length(pageSearch.list)==0}">
				<font color='#000000'>没有找到记录...</font>
				<input id="page" type="hidden" name="page">
			</c:if>
		</td>
		<td align='right'>&nbsp; 
			<img id="first" src='<jdf:theme/>img/table/firstPage2.gif' style='border: 0'alt='第一页' />&nbsp; 
			<img id="prev" src='<jdf:theme/>img/table/prevPage2.gif' style='border: 0' alt='上一页' /> 
			<img id="next" src='<jdf:theme/>img/table/nextPage2.gif' style='border: 0' alt='下一页' />&nbsp; 
			<img id="last" src='<jdf:theme/>img/table/lastPage2.gif' style='border: 0' alt='最后页' />&nbsp;
		</td>
	</tr>
</table>
<script type="text/javascript">
	var maxPage = "${pageSearch.totalPage}";
	var currentPage = "${pageSearch.page}";
</script>
<jdf:themeFile file="pageList.js" />