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
            box-sizing: border-box;
            border: 1px solid black;
        }

        .wrap {
            width: 1000px;
            height:800px;
            margin: auto;
        }

        .wrap>div {
            width: 100%;
        }

        #header {
            height: 33%;
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
        </div>
        <div id="content">
            <div id="box_3"><input type="button" class="btn" value="양천구"></div>
            <div id="box_4"><input type="button" class="btn" value="서초구"></div>
        </div>
        <div id="footer">
            <div id="box_5"><input type="button" class="btn" value="마포구"></div>
            <div id="box_6"><input type="button" class="btn" value="동대문구"></div>
        </div>
    </div>
</body>
</html>