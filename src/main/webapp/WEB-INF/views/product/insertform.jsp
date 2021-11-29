<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						<h1>상품 등록</h1>
					</header>

					<hr class="major" />


					<div class="row gtr-200">
						<div class="col-6 col-12-medium">

							<form class="form-signin" id="insert-form" name="insertform" method="post" action="/mysiteB/product?a=insertProduct" enctype="multipart/form-data">

								<div class="row gtr-uniform">
						
									<h3>상품 이름</h3>
									<div class="col-6 col-12-xsmall">
										<input type="text" name="proName" id="demo-name" value=""/>
									</div>
									
									<div></div>
									<h3>카테고리</h3>
									<div class="col-6 col-12-xsmall">
									
										<input type="text" name="proCateg" id="demo-email" value="" />
									</div>
									
									<div></div>
									<h3>상품 재고</h3>
									<div class="col-6 col-12-xsmall">
									
										<input type="text" name="proStock" id="demo-email" value="" />
									</div>
									
									<div></div>
									<h3>상품 가격</h3>
									<div class="col-6 col-12-xsmall">
									
										<input type="text" name="proPrice" id="demo-email" value="" />
									</div>
									
									<div></div>
									<h3>상품 설명</h3>
									<div class="col-6 col-12-xsmall">
									
										<input type="text" name="proDesc" id="demo-email" value="" />
									</div>
									
									<div></div>
									<h3>판매여부</h3>
									<div class="col-6 col-12-xsmall">
									
										<input type="text" name="proOnSale" id="demo-email" value=""/>
									</div>
									
									<div></div>
									<h3>상품사진</h3>
									<div class="col-6 col-12-xsmall">
									
										<input type="file" name="proFileName" id="demo-email" value=""/>
									</div>
									
									<div class="col-12">
										<ul class="actions">
											<li><input type="submit" value="등록"
												class="primary" /></li>
										</ul>
									</div>
									
								</div>
							</form>
						</div>
					</div>

				</div>
			</section>

		</div>

		<!-- Contact -->
		<section id="contact">
			<div class="inner">
				<section class="split">
					<section>
						<div class="contact-method">
							<span class="icon solid alt fa-envelope"></span>
							<h3>Email</h3>
							<a href="#">information@untitled.tld</a>
						</div>
					</section>
					<section>
						<div class="contact-method">
							<span class="icon solid alt fa-phone"></span>
							<h3>Phone</h3>
							<span>(000) 000-0000 x12387</span>
						</div>
					</section>
					<section>
						<div class="contact-method">
							<span class="icon solid alt fa-home"></span>
							<h3>Address</h3>
							<span>1234 Somewhere Road #5432<br /> Nashville, TN 00000<br />
								United States of America
							</span>
						</div>
					</section>
				</section>
			</div>
		</section>

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