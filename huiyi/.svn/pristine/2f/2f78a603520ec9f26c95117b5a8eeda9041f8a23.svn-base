<%@ page language="java" pageEncoding="UTF-8"%>
<div class="footer-v1">
	<div class="copyright">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 text-center">
					<p>
						<c:forEach items="${footChannels }" var="item" varStatus="status">
					        <c:if test="${!status.first }"> | </c:if>
					   		<a href="${dynamicDomain }/home/directDetail/${item.objectId}" target="_blank">${item.nameZh}</a>
					   	</c:forEach>
						<br> <jdf:message code="system_name" /> 2015 © All Rights Reserved. <jdf:message code="system_footer" />
					</p>
					<p>
						<%-- <img src="${pageContext.request.contextPath}/static/assets/img/footer_img110.jpg" width="591" height="60"> --%>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>