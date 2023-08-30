<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=], initial-scale=1.0">
    <title>검색화면</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <style>
        .wrap {

            width: 1900px;
            height: auto;
            
            margin: auto;

            display: grid;
            grid-template-columns: 1fr 1fr 1fr 1fr;
            grid-template-rows: 1fr 1fr 1fr 1fr 1fr;

            grid-column-gap: 30px;
            grid-row-gap: 30px;
            padding: 5%;

        }

        .wrap>div {
            width: 100%;
        }


        img {

            box-sizing: border-box;
            border: 1px solid black;
            height: 95%;
            width: 95%;

            display: block;
            margin: auto;

            border-radius: 20px;
			
            background-repeat: no-repeat;
            background-position: center;
            background-size: 100%;
            filter: brightness(1);

            font-weight: 900;
            color: white;

            cursor: pointer;
        }

        .btn:hover {
            background-repeat: no-repeat;
            background-position: center;
            background-size: 100%;
            filter: brightness(0.5);
        }

    </style>
</head>
<body>
<%@include file = "../common/header.jsp" %>

<button  class="btn btn-primary" onclick="location.href ='<%=contextPath%>/enrollForm.pl'">장소 새로 등록하기</button>
   
    <div class="wrap">
       
        <div id="box">
            <a href="<%=contextPath %>"><img src="<%=contextPath%>/resource/img/place/서치뷰.png"></a>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/서치뷰.png"></a>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/서치뷰.png"></a>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/서치뷰.png"></a>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/서치뷰.png"></a>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/서치뷰.png"></a>
        </div>
        <div id="box">
            <a href="<%=contextPath %>"><img src="<%=contextPath%>/resource/img/place/서치뷰.png"></a>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/서치뷰.png"></a>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/서치뷰.png"></a>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/서치뷰.png"></a>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/서치뷰.png"></a>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/서치뷰.png"></a>
        </div>
        <div id="box">
            <a href="<%=contextPath %>"><img src="<%=contextPath%>/resource/img/place/서치뷰.png"></a>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/서치뷰.png"></a>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/서치뷰.png"></a>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/서치뷰.png"></a>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/서치뷰.png"></a>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/서치뷰.png"></a>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/서치뷰.png"></a>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/서치뷰.png"></a>
        </div>
    </div>
    <%@include file = "../common/footer.jsp" %>
</body>
</html>