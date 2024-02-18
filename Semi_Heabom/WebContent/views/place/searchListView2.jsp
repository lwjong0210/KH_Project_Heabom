<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=], initial-scale=1.0">
<title>Heabom</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<style>
img:hover {
	background-repeat: no-repeat;
	background-position: center;
	background-size: 100%;
	filter: brightness(0.5);
	opacity: 0.6;
}

#regionList p {
	font-weight: 900;
	color : white;
	font-size: 30px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	white-space: nowrap;
}

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

#regionList img {
	border-radius: 0.375rem; width : 100%;
	aspect-ratio: 1;
	width: 100%;
}
</style>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<%
	if (loginMember != null) {
	%>
	<div id="enrollBtn" align="center">
		<button id="place-button" class="btn btn-primary"
			style="background-color: pink; border: none;"
			onclick="location.href ='<%=contextPath%>/enrollForm.pl'">장소
			등록하기</button>
	</div>
	<%
	} else {
	%>
	<div id="plzLogin" align="center">
		<h2 data-toggle="modal" data-target="#myModal">로그인한 회원만 장소를 등록할 수
			있습니다.</h2>
	</div>
	<%
	}
	%>
	<div class="container">

		<div class="row" id="regionList">
			<div class="col-md-3 p-2">
				<a href='<%=contextPath%>/searchListView.pl?lNo=1'><img
					src="<%=contextPath%>/resource/img/place/간판없는가게.jpg"></a>
				<p>강남구</p>
			</div>
			<div class="col-md-3 p-2">
				<a href='<%=contextPath%>/searchListView.pl?lNo=2'><img
					src="<%=contextPath%>/resource/img/place/서울앵무새.jpg"></a>
				<p>서초구</p>
			</div>
			<div class="col-md-3 p-2">
				<a href='<%=contextPath%>/searchListView.pl?lNo=3'><img
					src="<%=contextPath%>/resource/img/place/동작2.jpg"></a>
				<p>동작구</p>
			</div>
			<div class="col-md-3 p-2">
				<a href='<%=contextPath%>/searchListView.pl?lNo=4'><img
					src="<%=contextPath%>/resource/img/place/이태리이층집.jpg"></a>
				<p>강서구</p>
			</div>
			<div class="col-md-3 p-2">
				<a href='<%=contextPath%>/searchListView.pl?lNo=5'><img
					src="<%=contextPath%>/resource/img/place/리차드하우스 연남.jpg"></a>
				<p>양천구</p>
			</div>
			<div class="col-md-3 p-2">
				<a href='<%=contextPath%>/searchListView.pl?lNo=6'><img
					src="<%=contextPath%>/resource/img/place/바빌리안테이블.jpg"></a>
				<p>구로구</p>
			</div>
			<div class="col-md-3 p-2">
				<a href='<%=contextPath%>/searchListView.pl?lNo=7'><img
					src="<%=contextPath%>/resource/img/place/세상의모든아침.jpg"></a>
				<p>금천구</p>
			</div>
			<div class="col-md-3 p-2">
				<a href='<%=contextPath%>/searchListView.pl?lNo=8'><img
					src="<%=contextPath%>/resource/img/place/일떼라쪼당산본점.jpg"></a>
				<p>관악구</p>
			</div>
			<div class="col-md-3 p-2">
				<a href='<%=contextPath%>/searchListView.pl?lNo=9'><img
					src="<%=contextPath%>/resource/img/place/영등포구.jpg"></a>
				<p>영등포구</p>
			</div>
			<div class="col-md-3 p-2">
				<a href='<%=contextPath%>/searchListView.pl?lNo=10'><img
					src="<%=contextPath%>/resource/img/place/송파구.png"></a>
				<p>송파구</p>
			</div>
			<div class="col-md-3 p-2">
				<a href='<%=contextPath%>/searchListView.pl?lNo=11'><img
					src="<%=contextPath%>/resource/img/place/강동구.jpg"></a>
				<p>강동구</p>
			</div>
			<div class="col-md-3 p-2">
				<a href='<%=contextPath%>/searchListView.pl?lNo=12'><img
					src="<%=contextPath%>/resource/img/place/광진구.jpg"></a>
				<p>광진구</p>
			</div>
			<div class="col-md-3 p-2">
				<a href='<%=contextPath%>/searchListView.pl?lNo=13'><img
					src="<%=contextPath%>/resource/img/place/성동구.jpg"></a>
				<p>성동구</p>
			</div>
			<div class="col-md-3 p-2">
				<a href='<%=contextPath%>/searchListView.pl?lNo=14'><img
					src="<%=contextPath%>/resource/img/place/용산구.jpg"></a>
				<p>용산구</p>
			</div>
			<div class="col-md-3 p-2">
				<a href='<%=contextPath%>/searchListView.pl?lNo=15'><img
					src="<%=contextPath%>/resource/img/place/마포구.jpg"></a>
				<p>마포구</p>
			</div>
			<div class="col-md-3 p-2">
				<a href='<%=contextPath%>/searchListView.pl?lNo=16'><img
					src="<%=contextPath%>/resource/img/place/서대문구.jpg"></a>
				<p>서대문구</p>
			</div>
			<div class="col-md-3 p-2">
				<a href='<%=contextPath%>/searchListView.pl?lNo=17'><img
					src="<%=contextPath%>/resource/img/place/중구.jpg"></a>
				<p>중구</p>
			</div>
			<div class="col-md-3 p-2">
				<a href='<%=contextPath%>/searchListView.pl?lNo=18'><img
					src="<%=contextPath%>/resource/img/place/동대문구.jpg"></a>
				<p>동대문구</p>
			</div>
			<div class="col-md-3 p-2">
				<a href='<%=contextPath%>/searchListView.pl?lNo=19'><img
					src="<%=contextPath%>/resource/img/place/중랑구.jpg"></a>
				<p>중랑구</p>
			</div>
			<div class="col-md-3 p-2">
				<a href='<%=contextPath%>/searchListView.pl?lNo=20'><img
					src="<%=contextPath%>/resource/img/place/종로구.jpg"></a>
				<p>종로구</p>
			</div>
			<div class="col-md-3 p-2">
				<a href='<%=contextPath%>/searchListView.pl?lNo=21'><img
					src="<%=contextPath%>/resource/img/place/성북구.jpg"></a>
				<p>성북구</p>
			</div>
			<div class="col-md-3 p-2">
				<a href='<%=contextPath%>/searchListView.pl?lNo=22'><img
					src="<%=contextPath%>/resource/img/place/은평구.jpg"></a>
				<p>은평구</p>
			</div>
			<div class="col-md-3 p-2">
				<a href='<%=contextPath%>/searchListView.pl?lNo=23'><img
					src="<%=contextPath%>/resource/img/place/강북구.jpg"></a>
				<p>강북구</p>
			</div>
			<div class="col-md-3 p-2">
				<a href='<%=contextPath%>/searchListView.pl?lNo=24'><img
					src="<%=contextPath%>/resource/img/place/도봉구.jpg"></a>
				<p>도봉구</p>
			</div>
			<div class="col-md-3 p-2">
				<a href='<%=contextPath%>/searchListView.pl?lNo=25'><img
					src="<%=contextPath%>/resource/img/place/노원구.jpg"></a>
				<p>노원구</p>
			</div>
		</div>
	</div>
	<%@include file="../common/footer.jsp"%>



</body>
</html>