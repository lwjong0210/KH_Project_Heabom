<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판4</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        div, input {
            /*border: 1px solid red;*/
            box-sizing: border-box;
        }

        p {
            box-sizing: border-box;
            border: 1px solid black;
            float: left;
        }

        .wrap {
            width: 1900px;
            height: 800px;
            border: 1px solid black;
            box-sizing: border-box;
            margin: auto;
            margin-top: 30px;
            overflow: auto;

            background-color: #FDEEEE;
        }

        .background {
            box-sizing: border-box;
            width: 90%;
            height: 150%;
            margin: auto;
            margin-top: 4%;
            margin-bottom: 4%;
            
            background-color: #F2F2F2;
            /*border: 1px solid black;*/
            border-radius: 30px 30px 30px 30px;

            position: relative;
        }

        #header {
            height: 15%;
        }

        #content {
            height: 75%;
        }

        #footer {
            height: 10%;
        }

        #header>div, #content>div, #footer>div {
            height: 100%;
            float: left;
        }

        #header_1, #header_5 {
            width: 8%;
        }

        #header_2 {
            width: 30%;
        }

        #header_3 {
            width: 24%;
        }

        #header_4 {
            width: 30%;
        }

        #content_1, #content_3 {
            width: 8%;
        }

        #content_2 {
            width: 84%;
        }

        #footer_1, #footer_4 {
            width: 8%;
        }

        #footer_2 {
            width: 14%;
        }

        #footer_3 {
            width: 70%;
        }

        /*-------------------테이블---------------------------------*/

        #content_2>table {
            width: 100%;

            margin-top: 2%;

            border-color: lightgray;
        }

        table>thead {
            text-align: center;
            font-size: 25px;
            
        }

        table>tbody {
            text-align: center;
            font-size: 25px;

            background-color: white;
        }

        th {
            padding-top: 3%;
            padding-bottom: 3%;
        }

        td {
            padding-top: 4%;
            padding-bottom: 4%;
        }

        /*----------------------------전체---------------------------------------*/

        #header_3 {
            position: relative;

            /*border: 1px solid purple;*/
        }

        .dropdown {
            position: absolute;

            width: 40%;
            height: 30%;

            top: 120px;
            bottom: 0px;
            left: 0px;
            right: 5px;

            background-color: white;
            font-weight: 900;
        }

        .dropdown>div {
            height: 100%;
        }

        .dropdown button, .dropdown a {
            width: 100%;
            height: 100%;
        }

        /*----------------------------검색---------------------------------------*/

        #header_4 {
            position: relative;

            /*border: 1px solid purple;*/
        }

        #search_form {
            width: 90%;
            height: 30%;

            font-size: 20px;
        }

        #search_form {

            margin: auto;
            position: absolute;
            top: 70px;
            bottom: 0px;
            left: 200;
            right: 0px;
        }

        #search_form>div {
            height: 100%;
            float: left;
        }

        #search_text {
            width: 80%;
        }

        #search_btn {
            width: 20%;
        }

        #search_form input {
            width: 100%;
            height: 100%;
        }

        /*--------------------------페이지바---------------------------------*/

        .pagination {
            display: flex;
            justify-content: center;

            margin-right: 15%;
        }

        .page-link {
            font-size: 30px;
        }

        /*-------------------------- 버튼 ---------------------------------*/
        
        #button1 {
            width: 90px;
            height: 60px;

            border: none;
            background-color: #3498db;
        }

        #button2 {
            width: 90px;
            height: 60px;

            border: none;
        }

        #button3 {
            font-size: 30px;

            width: 60%;
            height: 50%;

            font-weight: 900;
            font-size: 20px;

            border: none;
            color: white;
        }
            
        /*-----------------------------------------------------*/

        .dropdown button, .dropdown a {
            width: 100%;
            height: 100%;

            font-size: 20px;

            background-color: white;
            border: 3px solid lightgray;
            color: black;
        }


    </style>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<%@include file = "../common/header.jsp" %>
    <div class="wrap">
        <div class="background">
            <div id="header">
                <div id="header_1"></div>
                <div id="header_2">
                    <div class="dropdown">
                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">전체</button>
                        <div class="dropdown-menu">
                          <a class="dropdown-item" href="#">Link 1</a>
                          <a class="dropdown-item" href="#">Link 2</a>
                          <a class="dropdown-item" href="#">Link 3</a>
                        </div>
                      </div>
                </div>
                <div id="header_3"></div>
                <div id="header_4"></div>
                <div id="header_5"></div>
            </div>
            <div id="content">
                <div id="content_1"></div>
                <div id="content_2">
                    <table border="1">
                        <thead>
                            <th width="100"><input type="checkbox" style="width:30px;height:30px;border:none;"></th>
                            <th width="120">분류</th>
                            <th width="150">이미지</th>
                            <th width="120">사용여부</th>
                            <th width="120">관리</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="checkbox" style="width:30px;height:30px;border:none;"></td>
                                <td>메인 이미지</td>
                                <td>.</td>
                                <td><input type="checkbox" style="width:30px;height:30px;border:none;"></td>
                                <td>
                                    <button type="button" id="button1" class="btn btn-primary">수정</button>
                                    <button type="button" id="button2" class="btn btn-danger">삭제</button>
                                </td>
                             </tr>
                             <tr>
                                <td><input type="checkbox" style="width:30px;height:30px;border:none;"></td>
                                <td>메인 이미지</td>
                                <td>.</td>
                                <td><input type="checkbox" style="width:30px;height:30px;border:none;"></td>
                                <td>
                                    <button type="button" id="button1" class="btn btn-primary">수정</button>
                                    <button type="button" id="button2" class="btn btn-danger">삭제</button>
                                </td>
                             </tr>
                             <tr>
                                <td><input type="checkbox" style="width:30px;height:30px;border:none;"></td>
                                <td>메인 이미지</td>
                                <td>.</td>
                                <td><input type="checkbox" style="width:30px;height:30px;border:none;"></td>
                                <td>
                                    <button type="button" id="button1" class="btn btn-primary">수정</button>
                                    <button type="button" id="button2" class="btn btn-danger">삭제</button>
                                </td>
                             </tr>
                             <tr>
                                <td><input type="checkbox" style="width:30px;height:30px;border:none;"></td>
                                <td>메인 이미지</td>
                                <td>.</td>
                                <td><input type="checkbox" style="width:30px;height:30px;border:none;"></td>
                                <td>
                                    <button type="button" id="button1" class="btn btn-primary">수정</button>
                                    <button type="button" id="button2" class="btn btn-danger">삭제</button>
                                </td>
                             </tr>
                        </tbody>
                    </table>
                </div>
                <div id="content_3"></div>
            </div>
            <div id="footer">
                <div id="footer_1"></div>
                <div id="footer_2">
                    <button type="button" id="button3" class="btn btn-warning">순서 지정</button>
                </div>
                <div id="footer_3">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                          <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                              <span aria-hidden="true">&laquo;</span>
                            </a>
                          </li>
                          <li class="page-item"><a class="page-link" href="#">1</a></li>
                          <li class="page-item"><a class="page-link" href="#">2</a></li>
                          <li class="page-item"><a class="page-link" href="#">3</a></li>
                          <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                              <span aria-hidden="true">&raquo;</span>
                            </a>
                          </li>
                        </ul>
                      </nav>
                </div>
                <div id="footer_4"></div>
            </div>
        </div>
    </div>
</body>
</html>