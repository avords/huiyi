<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../../common/taglibs.jsp"%>
<div class="topbar-v1">
	<div class="container">
		<div class="row">
			<div class="col-xs-6">
				<ul class="list-inline top-v1-contacts">
					<li><jdf:message code="label_welcome_to_huiyi"/></li>
					<c:choose>
						<c:when test="${not empty simpleIndex }">
							<li><a class="color-orange" href="${dynamicDomain}/home"><jdf:message code="page_main"/></a></li>
						</c:when>
						<c:otherwise>
							<li><a class="color-orange" href="${dynamicDomain}/simpleIndex"><jdf:message code="page_home"/></a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<div class="col-xs-6">
				<ul class="list-inline top-v1-data loginbar">
					<c:choose>
						<c:when test="${empty sessionScope.m_loginName }">
							<li><a class="color-orange" href="${dynamicDomain}/home/login"><jdf:message code="btn_main_login"/></a></li>
							<li><a class="color-orange" href="${dynamicDomain}/home/register"><jdf:message code="btn_main_register"/></a></li>
						</c:when>
						<c:otherwise>
							<li>
								<a href="javascript:void(0);"><span class="glyphicon glyphicon-user"></span>&nbsp;${sessionScope.m_loginName}&nbsp;<i class="fa fa-angle-down"></i></a>
								<div class="down">
									<a href="${dynamicDomain}/member/modifyAccount"><jdf:message code="menu_member_account" /></a>
									<a href="${dynamicDomain}/member/modifyCompany"><jdf:message code="menu_member_company" /></a>
									<a href="${dynamicDomain}/home/login/out?logoutFrom=5"><jdf:message code="common.login.out" /></a>
								</div>
							</li>
						</c:otherwise>
					</c:choose>
					<li><a href="${dynamicDomain }/member/sellerCenter"><jdf:message code="btn_main_supplier_center"/>&nbsp;<i class="fa fa-angle-down"></i></a>
                		<div class="down">
                			<a href="${dynamicDomain }/member/product/listSku"><jdf:message code="menu_product_list"/></a><a href="${dynamicDomain }/member/product/create"><jdf:message code="menu_product_publish"/></a> 
                		</div>
              		</li>
		           	<li><a href="${dynamicDomain }/member/buyerCenter"><jdf:message code="btn_main_buyer_center"/><i class="fa fa-angle-down"></i></a>
		                <div class="down"> <a href="${dynamicDomain }/member/myTracks?typee=0"><jdf:message code="menu_member_mytracks"/></a></div>
		            </li>
		            <li>
		            	<c:choose>
		            		<c:when test="${sessionScope.locale=='zh_CN' }">
		            			<a href="javascript:changeLanguage('en_US')">English</a>
		            		</c:when>
		            		<c:otherwise>
		            			<a href="javascript:changeLanguage('zh_CN')">Chinese</a>
		            		</c:otherwise>
		            	</c:choose>
		            </li>
				</ul>
			</div>
		</div>
	</div>
</div>