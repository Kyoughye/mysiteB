<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.javaex.dao.ReviewDaoImpl"%>
<%@page import="com.javaex.dao.ReviewDao"%>
<%@ page import="java.util.*"%>
<%
List reviewList = (List) request.getAttribute("revlist");

int revpageNum = ((Integer) request.getAttribute("pageNum")).intValue();
int total_page = ((Integer) request.getAttribute("total_page")).intValue();
int total_record = ((Integer) request.getAttribute("total_record")).intValue();
%>

<!DOCTYPE HTML>
<!--
	Forty by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(function() {
	$('#onDisplay1').click(function() {
		if($("#noneDiv1").css("display") == "none"){
			$('#noneDiv1').show();
			$('#noneDiv2').hide();
			$('#noneDiv3').hide();
		}else if ($("onDisplay1").css("display") != "none"){
			$('#noneDiv1').hide();
		}
		
	});
	$('#onDisplay2').click(function() {
		if($("#noneDiv2").css("display") == "none"){
			$('#noneDiv1').hide();
			$('#noneDiv2').show();
			$('#noneDiv3').hide();
		}else if ($("onDisplay2").css("display") != "none"){
			$('#noneDiv2').hide();
		}
		
	});
	$('#onDisplay3').click(function() {
		if($("#noneDiv3").css("display") == "none"){
			$('#noneDiv1').hide();
			$('#noneDiv2').hide();
			$('#noneDiv3').show();
		}else if ($("onDisplay3").css("display") != "none"){
			$('#noneDiv3').hide();
		}
		
	});
	

});
</script>
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
									<a href="#" class="list-group-item">Category 1</a>
									<br>
									<a href="#" class="list-group-item">Category 2</a>
									<br>
									<a href="#" class="list-group-item">Category 3</a>
								</ul>

							</div>

							<div class="col-9 col-12-medium">
								<!-- 
								
								<p>
									<span class="image left"><img src="images/pic09.jpg" alt="" /></span>
									<h4>상품 이름</h4>
									
									<h4><b>2000원</b></h4>
									
									
									<h4> </h4>
									
									<div class="inner">
										<section>
											<form method="post" action="#">
												
												<ul class="actions">
												
													<form method="post" action="#">
														<input type=button value="-" onClick="javascript:this.form.amount.value--;">
														<input style="text-align:center" type=text name=amount value=1>
														<input type=button value="+" onClick="javascript:this.form.amount.value++;">
													</form>
													
													<li><input type="submit" value="장바구니" class="primary" /></li>
													<li><input type="reset" value="구매하기" /></li>
												</ul>
												
											</form>
										</section>
									</div>
								</p>
								
								-->

								<div class="row">
									<div class="col-6 col-12-small">
										<span class="image fit"><img src="images/pic09.jpg"
											alt="" style="max-width: 100000px; height: auto;" /></span>
									</div>
									<div class="col-6 col-12-small">
										<h1>${ProductVo.proName }</h1>
										<h3>
											<b>${ProductVo.proPrice}원</b>
										</h3>
										<h3></h3>
										<section>
											<form method="post" action="#">

												<ul class="actions">

													<form method="post" action="#">
														<li><input type=button value="-" onClick="javascript:this.form.amount.value--;"></li>
														<input style="text-align: center; width: 100px"  type=text name=amount value=1>
														<input type=button value="+" onClick="javascript:this.form.amount.value++;">
													</form>
												</ul>
												
												<ul class="actions">
													<li><input type="submit" value="장바구니" class="primary" /></li>
													<li><input type="reset" value="구매하기" /></li>
												</ul>
											</form>
										</section>
									</div>
								</div>
							</div>
						</div>

						<hr class="major" />
			
						<div class="row" style="text-align: center">
							<!-- Break -->
							<div class="col-4 col-12-medium">
								<a class="list-group-item" id = "onDisplay1" style="font-weight: bold">상품상세</a>
							</div>
							<div class="col-4 col-12-medium">
								<a class="list-group-item" id = "onDisplay2" style="font-weight: bold">상품평</a>
							</div>
							<div class="col-4 col-12-medium">
								<a class="list-group-item" id = "onDisplay3" style="font-weight: bold">상품문의</a>
							</div>
							

						</div>
						

						<div class="row"></div>
						
						<hr class="major" />

					</div>
					<div id = "noneDiv1" style="display: ;">${ProductVo.proDesc }</div>
					
					<div id = "noneDiv2" style="display: none;">
					<form id="search_form" action="" method="post">
						<input type="hidden" name="a" value="search"> 
							<!-- put options as orderBy -->
							<select name="items" class="txt" style = "width: auto">
								<option value="인기순">인기순</option>
								<option value="신규 등록순">신규 등록순</option>
							</select>
					</form>

					<!-- trial part from here -->
					<div class="box alt">

							<form method="post" action="/mysiteB/product">
								<input type="hidden" name="a" value="reviewList" />

								<div class="contact-method">
									<c:forEach items="${revlist}" var="revList">
										<section>
											<div class="contact-method">
												<span class="icon solid alt"><img src="images/사람.png"
													alt="" style="max-width: 2em; height: auto;" /></span>
												<h6>
													${revList.memId}<br>${revList.rate}&nbsp&nbsp${revList.revDate}
												</h6>
												<br>
												<div class="col-4">
													<span class="image fit"><img src="images/pic09.jpg"
														alt="" style="width: 200px; height: auto" /></span>
												</div>
												<p>${revList.content}</p>
											</div>
										</section>

									</c:forEach>
								</div>

								<c:set var="pageNum" value="<%=revpageNum%>" />
								<c:forEach var="i" begin="1" end="<%=total_page%>">
									<a href="/mysiteB/product?a=reviewList&pageNum=${i}">
										<c:choose>
											<c:when test="${revpageNum==i}">
												<font color='4C5317'><b> [${i}]</b></font>
											</c:when>
											<c:otherwise>
												<font color='4C5317'> [${i}]</font>
											</c:otherwise>
										</c:choose>
									</a>
								</c:forEach>
							</form>

							
					</div>
					</div>			
					<div id = "noneDiv3" style="display: none;" class = "row">
						
						<div class="col-6 col-12-small">
						<h3>상품문의</h3>	
						</div>
					
						<div class="col-6 col-12-small">
							<ul class="actions stacked">
								<li style="text-align:right"><a onclick="window.open('/mysiteB/product?a=inquiryBox', 'win', 'width=400,height=500')" class="button small">문의하기</a></li>
							</ul>
						</div>
						
						<ul style="font-size:13px;">
							<li>구매한 상품의 취소/반품은 마이쿠팡 구매내역에서 신청 가능합니다.</li>
							<li>상품문의 및 후기게시판을 통해 취소나 환불, 반품 등은 처리되지 않습니다.</li>
							<li>가격, 판매자, 교환/환불 및 배송 등 해당 상품 자체와 관련 없는 문의는 고객센터 내 1:1 문의하기를 이용해주세요.</li>
							<li>"해당 상품 자체"와 관계없는 글, 양도, 광고성, 욕설, 비방, 도배 등의 글은 예고 없이 이동, 노출제한, 삭제 등의 조치가 취해질 수 있습니다.</li>
							<li>공개 게시판이므로 전화번호, 메일 주소 등 고객님의 소중한 개인정보는 절대 남기지 말아주세요.</li>
						</ul>
						
						

						<div class="table-wrapper">
							<table>
								<tbody>
									<c:forEach items="${questionList }" var="qvo">
										<tr>
											<td
												style="font-size: 14px; text-align: center; vertical-align: middle"><b>${qvo.content }</b></td>
											<td
												style="font-size: 12px; text-align: center; vertical-align: middle"><b>${qvo.getMemId() }</b><br>${qvo.getQdate() }</td>
											<td style="font-size: 12px; vertical-align: middle">녹에
												도포후 물로씻어내지 않아도되나요?그리고 마르면 페인트칠하면 되는지요?타 제품들은 물로씻어내라 해서요 이제품은
												그냥 뿌리고 마르면 페인트칠하는것 같아 편할거 같습니다</td>
										</tr>
										<tr>
											<td
												style="font-size: 14px; width: 100px; text-align: center; vertical-align: middle"><b>↳
													답변</b></td>
											<td
												style="font-size: 12px; width: 120px; text-align: center; vertical-align: middle"><b>삼표화학</b><br>2021.11.25</td>
											<td style="font-size: 12px; vertical-align: middle">삼표화학입니다
												러스크린은 금속의 녹이난부위에 축축히 젖도록 발라주셔서 녹의 성분을 산화철로 전화시켜주는 녹전환제로 하루정도
												표면의 성분이 자연휘발된 후에 방청효과가 약 4주유지되비니다. 기간내에 녹제거후에 씻어내지 마시고 바로
												페인트 칠하십시오 감사합니다.</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>



					</div>
					

					
										
					<hr class="major" />


					<!-- 
					
					실제로는 아래거 지우고 이거 쓰면 돼용
					
					<div class="table-wrapper">
						<table>
							<tbody>
								<c:forEach items="${list }" var="vo">
									<tr>
										<td style="font-size: 14px; text-align: center; vertical-align: middle"><b>질문</b></td>
										<td style="font-size: 12px; text-align: center; vertical-align: middle"><b>nam***@na</b><br>2021.11.25</td>
										<td style="font-size: 12px; vertical-align: middle">녹에 도포후 물로씻어내지 않아도되나요?그리고 마르면 페인트칠하면 되는지요?타 제품들은 물로씻어내라 해서요 이제품은 그냥 뿌리고 마르면 페인트칠하는것 같아 편할거 같습니다</td>
									</tr>
									<tr>
										<td style="font-size: 14px; width: 100px; text-align: center; vertical-align: middle"><b>↳ 답변</b></td>
										<td style="font-size: 12px; width: 120px; text-align: center; vertical-align: middle"><b>삼표화학</b><br>2021.11.25</td>
										<td style="font-size: 12px; vertical-align: middle">삼표화학입니다 러스크린은 금속의 녹이난부위에 축축히 젖도록 발라주셔서 녹의 성분을 산화철로
											전화시켜주는 녹전환제로 하루정도 표면의 성분이 자연휘발된 후에 방청효과가 약 4주유지되비니다. 기간내에
											녹제거후에 씻어내지 마시고 바로 페인트 칠하십시오 감사합니다.</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					
					-->

				
						
				</div>
				
				
				
				</div>


				


				<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>


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