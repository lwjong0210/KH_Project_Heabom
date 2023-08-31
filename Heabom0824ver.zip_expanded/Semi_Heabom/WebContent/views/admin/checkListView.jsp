<%@page import="com.heabom.common.model.vo.PageInfo"%>
<%@page import="com.heabom.member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판1</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        div, input {
            /* border: 1px solid red;
            box-sizing: border-box; */
        }

        p {
            box-sizing: border-box;
            float: left;
            /*border: 1px solid black;*/

            margin-left: 5%;
            font-size: 20px;
            font-weight: 900;
        }

        #p1 {
            margin-top: 20%;
        }

        #p2 {
            margin-top: 20%;

            color: orange;
        }

        #p3 {
            margin-top: 20%;

            color: red;
        }

        .wrap {
            width: 1900px;
            height: auto;
            /* border: 1px solid black; */
            box-sizing: border-box;
            margin: auto;
            margin-top: 30px;

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
            height: 12%;
        }

        #content1 {
            height: 70%;
        }

        #content2 {
            height: 8%;
        }

        #footer {
            height: 10%;
        }

        #header>div, #content1>div, #content2>div, #footer>div {
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

            background-color: white;
            border-top-left-radius: 30px;
            border-top-right-radius: 30px;
        }

        #content_4, #content_8 {
            width: 8%;
        }

        #content_5 {
            width: 28%;

            background-color: white;
            border-bottom-left-radius: 30px;
        }

        #content_6 {
            width: 28%;

            background-color: white;
        }

        #content_7 {
            width: 28%;

            background-color: white;
            border-bottom-right-radius: 30px;
        }

        /*-------------------테이블---------------------------------*/

        #content_2>form {
            width: 100%;

            margin-top: 4%;
        }

        table>thead {
            text-align: center;
            font-size: 30px;

            
            border: none;
            border-color: white;
            border-bottom: 2px solid lightgray;
            
        }

        table>.listInner {
            text-align: center;
            font-size: 25px;

            
            border: none;
            border-color: white;
            border-bottom: 1px solid lightgray;
            
        }

        th {
            padding-top: 10px;
            padding-bottom: 10px;

            font-size: 17px;
        }

        td {
            padding-top: 10px;
            padding-bottom: 10px;

            font-size: 15px;
        }

        /*---------------------------- 아코디언 ----------------------------------*/

        #header_3 {
            position: relative;

            /*border: 1px solid purple;*/
        }

        #search_date {
            position: absolute;
            margin: auto;

            width: 40%;
            height: 30%;

            top: 50px;
            bottom: 0px;
            left: 170px;
            right: 0px;

            background-color: white;
            border-width: 3px;
            border-radius: 5px;
            border-color: lightgray;
            font-weight: 900;
        }

        #search_date option {
            text-align: center;
        }

        #search_date2 {
            background-color: white;
            border-width: 3px;
            border-radius: 5px;

            border-color: lightgray;
        }

        #search_date2 option {
            text-align: center;
        }

        #search_date3 {

            background-color: white;
            border-width: 3px;
            border-radius: 5px;

            border-color: lightgray;

        }

        #search_date3 option {
            text-align: center;
        }

        /*----------------------------검색---------------------------------------*/

        #header_4 {
            position: relative;

            /*border: 1px solid purple;*/
        }

        #search_form {
            width: 90%;
            height: 30%;

            font-size: 15px;
        }

        #search_form {

            margin: auto;
            position: absolute;
            top: 50px;
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

        #search_text input {
            border-color: lightgray;
        }

        #search_btn input {

            border-color: lightgray;
        }

        /*--------------------------페이지바---------------------------------*/

        .pagination {
            display: flex;
            justify-content: center;

            margin-top: 3%;
        }

        .page-link {
            font-size: 20px;
        }

        /*--------------------------선택 수정, 삭제---------------------------------*/
        
        #content_5>button {

            width: 30%;

            margin-top: 4%;

            font-size: 15px;

            color: white;
            font-weight: 900;
        }

        #button1 {
            margin-left: 15%;
        }

        #button2 {
            margin-left: 3%;
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
                    <p id="p1">총 회원 수 : </p>
                    <p id="p2"> 차단 : </p>
                    <p id="p3"> 탈퇴 : </p>
                </div>
                <div id="header_3">
                    <select id="search_date" name="search_date" fw-filter="" fw-label="" fw-msg="" onchange="changeFn()">
                        <option value="memberId" selected="selected">회원 아이디</option>
                        <option value="memberName">이름</option>
                        <option value="nickname">별명</option>
                        <option value="all">.</option>
                    </select>
                </div>
                <div id="header_4">
                    <form action="" id="search_form">
                        <div id="search_text">
                            <input type="text" id="keyword" name="keyword">
                        </div>
                        <div id="search_btn">
                            <input type="submit" value="검색">
                        </div>
                    </form>
                </div>
                <div id="header_5"></div>
            </div>
            <div id="content1">
                <div id="content_1"></div>
                <div id="content_2">
                    <form action="<%= contextPath %>/update.ad" method="post">
                        <table border="1">
                            <thead>
                                <th width="130">
                                    <input type="checkbox" name="check" style="width:30px;height:30px;border:none;" onclick="selectAll(this)">
                                </th>
                                <th width="130">번호</th>
                                <th width="130">회원 아이디</th>
                                <th width="130">이름</th>
                                <th width="130">별명</th>
                                <th width="120">등급</th>
                                <th width="120">포인트</th>
                                <th width="160">최종 접속</th>
                                <th width="120">이메일</th>
                                <th width="120">회원 상태</th>
                                <th width="160"><button type="button" style="width: 60px; height: 40px; font-size: 15px; background-color: rgb(148, 226, 165); border: none; border-radius: 5px;">추가</button>
                            </thead>
                            <tbody class="listInner">
                                <% for(Member m : list) { %>
                                    <tr>
                                        <td><input type="checkbox" name="check" style="width:30px;height:30px;border:none;"></td>
                                        <td><%= m.getMemNo() %></td>
                                        <td><%= m.getMemId() %></td>
                                        <td><%= m.getMemName() %></td>
                                        <td><%= m.getNickname() %></td>
                                        <td><%= m.getGrade() %></td>
                                        <td><input type="text" style="width: 50%;"></td>
                                        <td><%= m.getMemVisit() %></td>
                                        <td><%= m.getEmail() %></td>
                                        <td>
                                            <select id="search_date2" name="search_date" fw-filter="" fw-label="" fw-msg="" onchange="chageLangSelect()">
                                                <option value="차단" selected="selected">차단</option>
                                                <option value="잔디">잔디</option>
                                                <option value="새싹">새싹</option>
                                                <option value="벚꽃">벚꽃</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input type="submit" value="변경" onclick="changeFn()">
                                        </td>
                                    </tr>
                                    <% } %>
                            </tbody>
                        </table>
                    </form>
                </div>
                <div id="content_3"></div>
            </div>
            <div id="content2">
                <div id="content_4"></div>
                <div id="content_5">
                    <button type="button" id="button1" class="btn btn-warning">선택 수정</button>
                    <button type="button" id="button2" class="btn btn-danger">선택 삭제</button>
                </div>
                <div id="content_6">
                    <div class="paging-area" align="center">
						<% if(currentPage != 1) { %>
            			<button onclick="location.href='<%= contextPath %>/check.ad?cpage=<%= currentPage -1 %>'">&lt;</button>
            			<% } %>
            
            			<% for(int p=startPage; p<=endPage; p++){ %>
            				<% if(p == currentPage) { %>
            				<button disabled><%= p %></button>
            				<% } else { %>
            				<button onclick="location.href='<%= contextPath %>/check.ad?cpage=<%= p %>';"><%= p %></button>
           					<% } %>
            			<% } %> 
            
            			<% if(currentPage != maxPage) { %>
            			<button onclick="location.href='<%= contextPath %>/check.ad?cpage=<%= currentPage +1 %>'">&gt;</button>
						<% } %>
        			</div>
                </div>
                <div id="content_7"></div>
                <div id="content_8"></div>
            </div>
            <div id="footer"></div>
        </div>
    </div>

    <!-- 전체 클릭 -->
    <script>
        function selectAll(selectAll) {
            const check = document.getElementsByName('check');

            check.forEach((check) => {
                check.checked = selectAll.checked;
            })
        }
    </script>

    <!-- 회원 등급 수정 -->
    <script>
    </script>
    <%@include file = "../common/footer.jsp" %>
</body>
</html>