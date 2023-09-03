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
            border: 1px solid red;
            box-sizing: border-box;
        }

        p {
            /*box-sizing: border-box;
            border: 1px solid black;*/
            float: left;
        }

        .wrap {
            width: 1900px;
            height: auto;
            /* border: 1px solid black; */
            box-sizing: border-box;
            margin: auto;


            background-color: #FDEEEE;

            padding-top: 1%;
            padding-bottom: 1%;
        }

        .background {
            box-sizing: border-box;
            width: 70%;
            height: 1000px;
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

        /*---------------------------------------------------------*/

        #header2 {
            position: relative;
        }

        #strong {
            position: absolute;

            font-size: 50px;
            top: 9%;
        }

        /*-------------------테이블---------------------------------*/

        #content_2>table {
            width: 100%;

            margin-top: 2%;

            border-color: lightgray;
        }

        table>thead {
            text-align: center;
            font-size: 20px;
            
        }

        table>#tbody {
            text-align: center;
            font-size: 15px;

            background-color: white;
        }

        th {
            padding-top: 3%;
            padding-bottom: 3%;
        }

        #tbody>tr>td {
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
            font-size: 20px;
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
                <div id="header_2"><strong id="strong">로고 관리</strong></div>
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
                        <tbody id="tbody">
                            <form action="">
                                <tr>
                                    <td><input type="checkbox" style="width:30px;height:30px;border:none;"></td>
                                    <td>메인 이미지</td>
                                    <td><img id="img1" width="150" height="50" onclick="chooseFile(1);"></td>
                                    <td><input type="checkbox" style="width:30px;height:30px;border:none;"></td>
                                    <td>
                                        <button type="submit" id="button1" class="btn btn-primary">등록</button>
                                        <button type="button" id="button2" class="btn btn-danger">삭제</button>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td><input type="checkbox" style="width:30px;height:30px;border:none;"></td>
                                    <td>메인 이미지</td>
                                    <td><img id="img2" width="150" height="50"  onclick="chooseFile(2);"></td>
                                    <td><input type="checkbox" style="width:30px;height:30px;border:none;"></td>
                                    <td>
                                        <button type="submit" id="button1" class="btn btn-primary">등록</button>
                                        <button type="button" id="button2" class="btn btn-danger">삭제</button>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td><input type="checkbox" style="width:30px;height:30px;border:none;"></td>
                                    <td>메인 이미지</td>
                                    <td><img id="img3" width="150" height="50"  onclick="chooseFile(3);"></td>
                                    <td><input type="checkbox" style="width:30px;height:30px;border:none;"></td>
                                    <td>
                                        <button type="submit" id="button1" class="btn btn-primary">등록</button>
                                        <button type="button" id="button2" class="btn btn-danger">삭제</button>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td><input type="checkbox" style="width:30px;height:30px;border:none;"></td>
                                    <td>메인 이미지</td>
                                    <td><img id="img4" width="150" height="50"  onclick="chooseFile(4);"></td>
                                    <td><input type="checkbox" style="width:30px;height:30px;border:none;"></td>
                                    <td>
                                        <button type="submit" id="button1" class="btn btn-primary">등록</button>
                                        <button type="button" id="button2" class="btn btn-danger">삭제</button>
                                    </td>
                                 </tr>
                            </form>
                        </tbody>
                    </table>
                </div>
                <div id="content_3"></div>
            </div>
            <div id="footer">
                <div id="footer_1"></div>
                <div id="footer_2"></div>
                <div id="footer_3">
                    <div id="file-area" style="display: none;">
                        <input type="file" name="file1" id="file1" onchange="loadImg(this, 1);">
                        <input type="file" name="file2" id="file2" onchange="loadImg(this, 2);">
                        <input type="file" name="file3" id="file3" onchange="loadImg(this, 3);">
                        <input type="file" name="file4" id="file4" onchange="loadImg(this, 4);">
                    </div>

                    <script>
                        function chooseFile(num) {
                            $("#file" + num).click();
                        }

                        function loadImg(inputFile, num) {
                            if(inputFile.files.length == 1) {
                                const reader = new FileReader();
                                reader.readAsDataURL(inputFile.files[0]);

                                reader.onload = function(e) {
                                    switch(num) {
                                        case 1: $("#img1").attr("src", e.target.result); break;
                                        case 2: $("#img2").attr("src", e.target.result); break;
                                        case 3: $("#img2").attr("src", e.target.result); break;
                                        case 4: $("#img2").attr("src", e.target.result); break;
                                    }
                                }
                            }
                        }
                    </script>

                </div>
                <div id="footer_4"></div>
            </div>
        </div>
    </div>
</body>
</html>