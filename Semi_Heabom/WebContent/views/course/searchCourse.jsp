<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html lang="ko">

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=], initial-scale=1.0">
		<title>코스 짜기전 검색화면</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
		<style>
			#enrollBtn {
				margin-top: 30px;
				background-color: pink;
			}

			#plzLogin {
				margin-top: 30px;
				cursor: pointer;
			}

			#plzLogin:hover {
				color: red;
			}

			.row .col-3 img {
				width: 265px;
				height: 245px;
				border-radius: 20px;
				box-shadow: 5px 5px 5px gray;
			}

			.row .col-3 img:hover {
				opacity: 0.6;
			}
			.row .col-3{
				margin-bottom: 20px;
			}
			.row .col-3 p {
				position: absolute;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
				white-space: nowrap;
				color: white;
				font-weight: 900;
				font-size: 30px;
				text-shadow: 5px 3px 3px gray;
			}
		</style>
	</head>

	<body>
		<%@include file="../common/header.jsp" %>

			<div class="container">
				<div class="row">
					<div class="col-3">
						<a href='<%=contextPath%>/courseCheck.pl?lNo=1'><img
								src="<%=contextPath%>/resource/img/place/간판없는가게.jpg"></a>
						<p>강남구</p>
					</div>
					<div class="col-3">
						<a href='<%=contextPath%>/courseCheck.pl?lNo=2'><img
								src="<%=contextPath%>/resource/img/place/서울앵무새.jpg"></a>
						<p>서초구</p>
					</div>
					<div class="col-3">
						<a href='<%=contextPath%>/courseCheck.pl?lNo=3'><img
								src="<%=contextPath%>/resource/img/place/동작2.jpg"></a>
						<p>동작구</p>
					</div>
					<div class="col-3">
						<a href='<%=contextPath%>/courseCheck.pl?lNo=4'><img
								src="<%=contextPath%>/resource/img/place/이태리이층집.jpg"></a>
						<p>강서구</p>
					</div>
					<div class="col-3">
						<a href='<%=contextPath%>/courseCheck.pl?lNo=5'><img
								src="<%=contextPath%>/resource/img/place/리차드하우스 연남.jpg"></a>
						<p>양천구</p>
					</div>
					<div class="col-3">
						<a href='<%=contextPath%>/courseCheck.pl?lNo=6'><img
								src="<%=contextPath%>/resource/img/place/바빌리안테이블.jpg"></a>
						<p>구로구</p>
					</div>
					<div class="col-3">
						<a href='<%=contextPath%>/courseCheck.pl?lNo=7'><img
								src="<%=contextPath%>/resource/img/place/세상의모든아침.jpg"></a>
						<p>금천구</p>
					</div>
					<div class="col-3">
						<a href='<%=contextPath%>/courseCheck.pl?lNo=8'><img
								src="<%=contextPath%>/resource/img/place/일떼라쪼당산본점.jpg"></a>
						<p>관악구</p>
					</div>
					<div class="col-3">
						<a href='<%=contextPath%>/courseCheck.pl?lNo=9'><img style="width: 250px; height: 250px;"
								src="<%=contextPath%>/resource/img/place/영등포구.jpg"></a>
						<p>영등포구</p>
					</div>
					<div class="col-3">
						<a href='<%=contextPath%>/courseCheck.pl?lNo=10'><img
								src="<%=contextPath%>/resource/img/place/송파구.png"></a>
						<p>송파구</p>
					</div>
					<div class="col-3">
						<a href='<%=contextPath%>/courseCheck.pl?lNo=11'><img
								src="<%=contextPath%>/resource/img/place/강동구.jpg"></a>
						<p>강동구</p>
					</div>
					<div class="col-3">
						<a href='<%=contextPath%>/courseCheck.pl?lNo=12'><img
								src="<%=contextPath%>/resource/img/place/광진구.jpg"></a>
						<p>광진구</p>
					</div>
					<div class="col-3">
						<a href='<%=contextPath%>/courseCheck.pl?lNo=13'><img
								src="<%=contextPath%>/resource/img/place/성동구.jpg"></a>
						<p>성동구</p>
					</div>
					<div class="col-3">
						<a href='<%=contextPath%>/courseCheck.pl?lNo=14'><img
								src="<%=contextPath%>/resource/img/place/용산구.jpg"></a>
						<p>용산구</p>
					</div>
					<div class="col-3">
						<a href='<%=contextPath%>/courseCheck.pl?lNo=15'><img
								src="<%=contextPath%>/resource/img/place/마포구.jpg"></a>
						<p>마포구</p>
					</div>
					<div class="col-3">
						<a href='<%=contextPath%>/courseCheck.pl?lNo=16'><img
								src="<%=contextPath%>/resource/img/place/서대문구.jpg"></a>
						<p>서대문구</p>
					</div>
					<div class="col-3">
						<a href='<%=contextPath%>/courseCheck.pl?lNo=17'><img
								src="<%=contextPath%>/resource/img/place/중구.jpg"></a>
						<p>중구</p>
					</div>
					<div class="col-3">
						<a href='<%=contextPath%>/courseCheck.pl?lNo=18'><img
								src="<%=contextPath%>/resource/img/place/동대문구.jpg"></a>
						<p>동대문구</p>
					</div>
					<div class="col-3">
						<a href='<%=contextPath%>/courseCheck.pl?lNo=19'><img
								src="<%=contextPath%>/resource/img/place/중랑구.jpg"></a>
						<p>중량구</p>
					</div>
					<div class="col-3">
						<a href='<%=contextPath%>/courseCheck.pl?lNo=20'><img
								src="<%=contextPath%>/resource/img/place/종로구.jpg"></a>
						<p>종로구</p>
					</div>
					<div class="col-3">
						<a href='<%=contextPath%>/courseCheck.pl?lNo=21'><img
								src="<%=contextPath%>/resource/img/place/성북구.jpg"></a>
						<p>성북구</p>
					</div>
					<div class="col-3">
						<a href='<%=contextPath%>/courseCheck.pl?lNo=22'><img
								src="<%=contextPath%>/resource/img/place/은평구.jpg"></a>
						<p>은평구</p>
					</div>
					<div class="col-3">
						<a href='<%=contextPath%>/courseCheck.pl?lNo=23'><img
								src="<%=contextPath%>/resource/img/place/강북구.jpg"></a>
						<p>강북구</p>
					</div>
					<div class="col-3">
						<a href='<%=contextPath%>/courseCheck.pl?lNo=24'><img
								src="<%=contextPath%>/resource/img/place/도봉구.jpg"></a>
						<p>도봉구</p>
					</div>
					<div class="col-3">
						<a href='<%=contextPath%>/courseCheck.pl?lNo=25'><img
								src="<%=contextPath%>/resource/img/place/노원구.jpg"></a>
						<p>노원구</p>
					</div>
				</div>
			</div>
			<%@include file="../common/footer.jsp" %>


	</body>

	</html>