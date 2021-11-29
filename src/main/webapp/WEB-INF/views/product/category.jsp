<%@page import="com.javaex.dao.ReviewDaoImpl"%>
<%@page import="com.javaex.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%
List productList = (List) request.getAttribute("list");
int total_record = ((Integer) request.getAttribute("total_record")).intValue();
int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
int total_page = ((Integer) request.getAttribute("total_page")).intValue();
%>
<!DOCTYPE HTML>
<!--
	Forty by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Elements - Forty by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/noscript.css" />
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">


		<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
		<!-- Main -->
		<div id="main" class="alt">

			<!-- One -->
			<section id="one">
				<div class="inner">
					<header class="major">
						<h1>카테고리</h1>
					</header>



					<hr class="major" />

					<!-- Elements -->
					<div class="col-6 col-12-medium">


						<!-- Lists -->
						<div class="row">
							<div class="col-3 col-3-small">


								<ul>
									<li>아우터</li>
									<li>상의</li>
									<li>하의</li>
								</ul>


							</div>
							<div class="col-9 col-12-medium">


								<h4>신규 상품</h4>
								<span class="image fit"><img src="images/pic03.jpg"
									alt="" /></span>
								<div class="box alt">

									<form method="post" action="/mysiteB/product">
										<input type="hidden" name="a" value="productList" />

										<div class="row gtr-50 gtr-uniform">
											<c:forEach items="${list}" var="vo">
												<div class="col-4">
													<span class="image fit"><img src="/mysiteB/upload/${vo.proFileName }"
														alt="" />
														<h4><a href="/mysiteB/product?a=readProduct&proNo=${vo.proNo}">${vo.proName }</a></h4> ${vo.proRate}
														<h5>${vo.proPrice }</h5> </span>

												</div>
											</c:forEach>
										</div>

									</form>
								
								<c:set var="pageNum" value="<%=pageNum%>" />
								<c:forEach var="i" begin="1" end="<%=total_page%>">
									<a href="/mysiteB/product?a=productList&pageNum=${i}">
										<c:choose>
											<c:when test="${pageNum==i}">
												<font color='4C5317'><b> [${i}]</b></font>
											</c:when>
											<c:otherwise>
												<font color='4C5317'> [${i}]</font>
											</c:otherwise>
										</c:choose>
									</a>
								</c:forEach>
								</div>


							</div>
						</div>








					</div>


				</div>
			</div>
		</section>

	</div>


	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>