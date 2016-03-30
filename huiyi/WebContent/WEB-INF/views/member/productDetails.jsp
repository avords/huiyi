<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>产品详情页</title>
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
					<%-- <div class="crumb">
						当前位置： <a href="${dynamicDomain}/home">首页</a> > <a href="${dynamicDomain}/home/articleList">新闻资讯</a> > 全文
					</div> --%>
					<div class="pageText">
						<div class="title">
							<h1>${products.nameZh}</h1>
							<%-- <p>
								时间： <fmt:formatDate value="${products.startDate}" pattern="yyyy-MM-dd HH:mm" />
							</p> --%>
						</div>
						<div class="article">${products.descriptionZh}</div>
						<div class="share clearfix">
							<!-- JiaThis Button BEGIN -->
							<span>分享到：</span>
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
					<!-- 产品推荐 -->
					<div class="package">
						<div class="title">
							<h3><jdf:message code="label_index_product_recommend"/></h3>
						</div>
						<ul class="tc-bd">
							<c:forEach items="${recommendProducts}" var="item" varStatus="status">
							<li><a href="#"><img src="${dynamicDomain}${item.mainPicture}"/></a>
								<dl>
									<dt>
										<a href="#">${item.nameZh}</a>
									</dt>
									<dd>${item.sellPrice}</dd>
								</dl>
							</li>
							</c:forEach>
						</ul>
					</div>
					<!--/产品推荐-->
				</div>
			</div>
		</div>
	</div>
</body>
</html>