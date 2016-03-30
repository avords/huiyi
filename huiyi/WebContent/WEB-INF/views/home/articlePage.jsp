<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title><jdf:message code="menu_article_details"/></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${dynamicDomain}/static/assets/css/list.css">
</head>
<body>
	<div class="wrapper">
		<div class="container">
			<div class="list-inner clearfix">
				<div class="pageCont">
					<div class="crumb">
						<jdf:message code="label_current_location"/>： <a href="${dynamicDomain}/home"><jdf:message code="menu_home"/></a> > <a href="${dynamicDomain}/home/article/jszs"><jdf:message code="menu_technique_article"/></a> > <jdf:message code="menu_article_details"/>
					</div>
					<div class="pageText">
						<div class="title">
							<h1>${content.nameZh}</h1>
							<p>
								<jdf:message code="label_time"/>： <fmt:formatDate value="${content.createdOn}" pattern="yyyy-MM-dd HH:mm" />
							</p>
						</div>
						<div class="article">${content.txtZh}</div>
						<div class="share clearfix">
							<!-- JiaThis Button BEGIN -->
							<span><jdf:message code="label_Share_To"/>：</span>
							<div style="float: left;" class="jiathis_style_24x24">
								<a class="jiathis_button_qzone"></a> 
								<a class="jiathis_button_tsina"></a> 
								<a class="jiathis_button_tqq"></a>
								<a class="jiathis_button_weixin"></a> 
								<a class="jiathis_button_renren"></a> 
								<a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a>
								<a class="jiathis_counter_style"></a>
							</div>
							<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
							<!-- JiaThis Button END -->
						</div>
					</div>
				</div>
				<div class="listSide">
					<!-- 展会 -->
			        <div class="rank">
			          <div class="title">
			            <h3><jdf:message code="company_exhibition"/></h3>
			          </div>
			          <div class="cont">
			            <ul>
			            	<c:forEach items="${exhibitions}" var="item" varStatus="status">
								<li><a href="${dynamicDomain }/home/company/exhibition/${item.companyId}" target="_blank">${item.nameZh}</a></li>
							</c:forEach>
			            </ul>
			          </div>
			        </div>
			        <!--/展会--> 
			        
			        <!-- 产品推荐 -->
			        <div class="package">
			          <div class="title">
			            <h3><jdf:message code="label_index_product_recommend"/></h3>
			          </div>
			          <ul class="tc-bd">
			            <c:forEach items="${recommendProducts}" var="item" varStatus="status">
							<li><a href="${dynamicDomain }/home/product/detail/${item.objectId}" target="_blank"><img src="${dynamicDomain}${item.mainPicture}"/></a>
								<dl>
									<dt>
										<a href="${dynamicDomain }/home/product/detail/${item.objectId}" target="_blank">${item.nameZh}</a>
									</dt>
									<dd>${item.sellPrice}</dd>
								</dl>
							</li>
						</c:forEach>
			          </ul>
			        </div>
			        <!--/产品推荐--> 
			        
			        <!-- 法律法规 -->
			        <%-- <div class="rank">
			          <div class="title"><span><a href="#"><i class="fa fa-angle-right"></i></a></span>
			            <h3><a href="#"><jdf:message code="laws_and_regulations"/></a></h3>
			          </div>
			          <div class="cont">
			            <ul>
			              <c:forEach items="${lawArticles}" var="item" varStatus="status">
								<li><a href="${dynamicDomain }/home/article/${lawPositionCode}/${item.objectId}" target="_blank">${item.nameZh}</a></li>
						  </c:forEach>
			            </ul>
			          </div>
			        </div> --%>
			        <!--/法律法规--> 
				</div>
			</div>
		</div>
	</div>
</body>
</html>