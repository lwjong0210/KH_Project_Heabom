<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=], initial-scale=1.0">
    <title>2번째 화면</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <style>

        div {
            
        }

        .wrap {
            width: 1000px;
            height:800px;
            margin: auto;
        }

        .wrap>div {
            width: 100%;
            height: 20%;
        }

        #header>div {
            height: 100%;
            float: left;
        }

        #box_1, #box_2, #box_3, #box_4 {
            width: 25%;
        }

        #content1>div {
            height: 100%;
            float: left;
        }

        #box_5, #box_6, #box_7, #box_8 {
            width: 25%;
        }

        #content2>div {
            height: 100%;
            float: left;
        }

        #box_9, #box_10, #box_11, #box_12 {
            width: 25%;
        }

        #content3>div {
            height: 100%;
            float: left;
        }

        #box_13, #box_14, #box_15, #box_16 {
            width: 25%;
        }

        #footer>div {
            height: 100%;
            float: left;
        }

        #box_17, #box_18, #box_19, #box_20 {
            width: 25%;
        }

        .btn {
            height: 95%;
            width: 95%;

            display: block;
            margin: auto;

            border-radius: 20px;
            border: none;

            background-image: url(../../WEB-INF/resource/img/서치뷰.png);
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
    <div class="wrap">
        <div id="header">
            <div id="box_1"><input type="button" class="btn" value="강서구"></div>
            <div id="box_2"><input type="button" class="btn" value="구로구"></div>
            <div id="box_3"><input type="button" class="btn" value="영등포구"></div>
            <div id="box_4"><input type="button" class="btn" value="관악구"></div>
        </div>
        <div id="content1">
            <div id="box_5"><input type="button" class="btn" value="양천구"></div>
            <div id="box_6"><input type="button" class="btn" value="서초구"></div>
            <div id="box_7"><input type="button" class="btn" value="강남구"></div>
            <div id="box_8"><input type="button" class="btn" value="송파구"></div>
        </div>
        <div id="content2">
            <div id="box_9"><input type="button" class="btn" value="강동구"></div>
            <div id="box_10"><input type="button" class="btn" value="구로구"></div>
            <div id="box_11"><input type="button" class="btn" value="금천구"></div>
            <div id="box_12"><input type="button" class="btn" value="동작구"></div>
        </div>
        <div id="content3">
            <div id="box_13"><input type="button" class="btn" value="마포구"></div>
            <div id="box_14"><input type="button" class="btn" value="동대문구"></div>
            <div id="box_15"><input type="button" class="btn" value="서대문구"></div>
            <div id="box_16"><input type="button" class="btn" value="용산구"></div>
        </div>
        <div id="footer">
            <div id="box_17"><input type="button" class="btn" value="도봉구"></div>
            <div id="box_18"><input type="button" class="btn" value="노원구"></div>
            <div id="box_19"><input type="button" class="btn" value="광진구"></div>
            <div id="box_20"><input type="button" class="btn" value="종로구"></div>
        </div>
    </div>
</body>
</html>