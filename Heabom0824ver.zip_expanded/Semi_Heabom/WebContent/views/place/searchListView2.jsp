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
            grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
            grid-template-rows: 1fr 1fr 1fr 1fr 1fr;

            grid-column-gap: 30px;
            grid-row-gap: 30px;
            padding: 5%;


        }

        #box {
            position: relative;
        }

        p {
            position: absolute;
            text-align: center;

            color: white;
            font-size: 30px;

            top: 40%;
	        left: 37%;
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

        img:hover {
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
            <a href=""><img src="<%=contextPath%>/resource/img/place/뷰.png"></a>
            <p>강남구</p>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/뷰.png"></a>
            <p>서초구</p>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/뷰.png"></a>
            <p>동작구</p>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/뷰.png"></a>
            <p>강서구</p>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/뷰.png"></a>
            <p>양천구</p>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/뷰.png"></a>
            <p>구로구</p>
        </div>
        <div id="box">
            <a href=""><img src="<%=contextPath%>/resource/img/place/뷰.png"></a>
            <p>금천구</p>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/뷰.png"></a>
            <p>관악구</p>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/뷰.png"></a>
            <p>영등포구</p>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/뷰.png"></a>
            <p>송파구</p>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/뷰.png"></a>
            <p>강동구</p>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/뷰.png"></a>
            <p>광진구</p>
        </div>
        <div id="box">
            <a href=""><img src="<%=contextPath%>/resource/img/place/뷰.png"></a>
            <p>성동구</p>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/뷰.png"></a>
            <p>용산구</p>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/뷰.png"></a>
            <p>마포구</p>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/뷰.png"></a>
            <p>서대문구</p>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/뷰.png"></a>
            <p>중구</p>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/뷰.png"></a>
            <p>동대문구</p>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/뷰.png"></a>
            <p>중량구</p>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/뷰.png"></a>
            <p>종로구</p>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/뷰.png"></a>
            <p>성북구</p>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/뷰.png"></a>
            <p>은평구</p>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/뷰.png"></a>
            <p>강북구</p>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/뷰.png"></a>
            <p>도봉구</p>
        </div>
        <div id="box">
            <a href="#"><img src="<%=contextPath%>/resource/img/place/뷰.png"></a>
            <p>노원구</p>
        </div>
    </div>
    <%@include file = "../common/footer.jsp" %>
</body>
</html>