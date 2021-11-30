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
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/noscript.css" />
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">


		<!-- Main -->

			<!-- One -->
			<section id="one">
				<div class="inner">
					
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


					<div class="table-wrapper">
						<table class=alt>
							<tbody>
								<tr>
									<td style="font-size: 14px; text-align: center; vertical-align: middle"><b>상품정보</b></td>
									<td style="font-size: 12px; vertical-align: middle">상품입니다만</td>
								</tr>
								<tr>
									<td style="font-size: 14px; width: 100px; text-align: center; vertical-align: middle"><b>판매자</b></td>
									<td style="font-size: 12px; vertical-align: middle">삼표화학</td>
								</tr>
								<tr>
									<td style="font-size: 14px; width: 100px; text-align: center; vertical-align: middle"><b>문의내용</b></td>
									<td style="font-size: 12px; vertical-align: middle;  padding: 0;">
										<textarea name="demo-message" id="demo-message" placeholder="Enter your message" rows="6" style="font-size:12px;" ></textarea>
									</td>
								</tr>
						</tbody>
						</table>
					</div>


				<ul>
					<li style="font-size: 10px">구매한 상품의 취소/반품은 마이쿠팡 구매내역에서 신청 가능합니다.</li>
				</ul>
				
				<!-- 
				<ul class="actions stacked">
							<li style="text-align:left"><a href="#" class="button primary small">확인</a></li>
							<li style="text-align:left"><a href="#" class="button small">취소</a></li>
						</ul>
				
				
				 -->
				<div class="row" style="text-align:center">
					<input style="display: block; margin: 0 auto;"
                    type="submit" value="확인" class="button primary icon solid fa-search" />
				</div>		
				

			</div>

			</section>
				
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