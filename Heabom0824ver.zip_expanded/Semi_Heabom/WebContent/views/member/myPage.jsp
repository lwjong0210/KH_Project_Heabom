<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        table,div{
            box-sizing: border-box;
        }
        .outer_yj{
            width: 900px;
            height: 800px;
            background-color: #fdeeee;
            margin: auto;
            margin-top: 50px;
        }
        .mypage-left{
            background-color: rgb(223, 188, 223);
            height: 100%;
            width: 100%;
            border-radius: 20px;
        }
        .mypage-right{
            background-color: white;
            margin-left: 3%;
            height: 100%;
            width: 97%;
            border-radius: 20px;
        }
        .left-table, a {
            text-align: center;
            color: white;
        }
        .mypage-right-p{margin: 0;}
        .mypage-detail img, .mypage-detail{
            border-radius: 20px; box-shadow: 2px 2px 1px gray;
            width: 100px;
            height: 90px;
            cursor: pointer;
        }
        .mypage-detail .img-wrap {overflow: hidden;}
        .thumb {width: 100%; height: auto;}
        .mypage-detail img:hover {transform: scale(1.1, 1.1); transition-duration: 0.2s;}
        .mypage-detail img {transition-duration: 0.2s;}
        .myprofile:hover {color: lightgray;}
        .outer_yj{
            position: relative;
        }
        .mypage-nameTag{
            position: absolute;
            top: 80px;
            left: 350px;
            background-color: rgb(87, 86, 86);
            color: white;
            border-radius: 10px;
            width: 120px;
            height: 50px;
            line-height: 50px;
            font-size: large;
            box-shadow: 3px 3px 3px lightgray;
        }

        </style>
</head>
<body>
    <%@include file = "../common/header.jsp" %>
    <div class="outer_yj" align="center">
        <div class="mypage-nameTag"><strong>나의 정보</strong></div>
        <div class="mypage-area" >
            <table border="0">
                <tr>
                    <td rowspan="2" width="250" height="420">
                        <div class="mypage-left">
                            <br><br><br>
                            <table border="0" align="center" class="left-table">
                                <tr>
                                    <td height="120" width="200">
                                        <div style="width: 100px; height: 100px; margin: auto;">
                                            <img src="https://tse1.mm.bing.net/th?id=OIP.bcPW77h3l7ZG8_rqFbsIKwHaHj&pid=Api&P=0&h=220" alt="" style="width: 100px; height: 100px; border-radius: 50px; cursor: pointer;">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="20"></td>
                                </tr>
                                <tr>
                                    <td height="20" style="font-size: large;"><strong>반가워요!</strong></td>
                                </tr>
                                <tr>
                                    <td height="65" style="font-size: xx-large;"><strong>홍*동님</strong></td>
                                </tr>
                                <tr>
                                    <td height="50" style="font-size: medium;"><strong>새싹등급</strong><img src="" alt=""></td>
                                </tr>
                                <tr>
                                    <td height="40" style="font-size: medium;"><a href="#" style="text-decoration: none;" class="myprofile"><strong>개인정보(프로필사진)설정</strong></a></td>
                                </tr>
                            </table>
                        </div>
                    </td>
                    <td width="400" height="100"></td>
                </tr>
                <tr>
                    <td width="550" height="320">
                        <div class="mypage-right">
                           <br><br>
                            <table border="0" align="center">
                                <tr>
                                    <td width="110" height="110">
                                        <div class="mypage-detail" align="center" onclick="myBoard();">
                                            <img src="../../WEB-INF/resource/img/방문게시물.png">
                                            <p class="mypage-right-p"><strong>방문게시물</strong></p>
                                        </div>
                                    </td>
                                    <td width="30"></td>
                                    <td width="110" height="110">
                                        <div class="mypage-detail" align="center">
                                            <img src="../../WEB-INF/resource/img/즐겨찾기.png">
                                            <p class="mypage-right-p"><strong>즐겨찾기</strong></p>
                                        </div>
                                    </td>
                                    <td width="30"></td>
                                    <td width="110" height="110">
                                        <div class="mypage-detail" align="center">
                                            <img src="../../WEB-INF/resource/img/리뷰관리.png">
                                            <p class="mypage-right-p"><strong>리뷰관리</strong></p>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5" height="5"></td>
                                </tr>
                                <tr>
                                    <td width="110" height="110">
                                        <div class="mypage-detail" align="center">
                                            <img src="../../WEB-INF/resource/img/게시물관리.png">
                                            <p class="mypage-right-p"><strong>게시물관리</strong></p>
                                        </div>
                                    </td>
                                    <td width="30"></td>
                                    <td width="110" height="110">
                                        <div class="mypage-detail" align="center">
                                            <img src="../../WEB-INF/resource/img/내글관리.png">
                                            <p class="mypage-right-p"><strong>내글관리</strong></p>
                                        </div>
                                    </td>
                                    <td width="30"></td>
                                    <td width="110" height="110">
                                        <div class="mypage-detail" align="center">
                                            <img src="../../WEB-INF/resource/img/QNA.png">
                                            <p class="mypage-right-p"><strong>Q&A</strong></p>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </div>

    </div>
</body>
</html>