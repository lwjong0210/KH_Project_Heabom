<%@page import="com.heabom.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String contextPath = request.getContextPath();
	Member loginMember =  (Member)session.getAttribute("loginMember");
	
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="wWidth=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
    @import url('https://fonts.googleapis.com/css?family=Montserrat:500');
    li,a {
        font-family: "Montserrat", sans-serif;
        font-weight: 500;
        font-size: 30px;
        color: #627e87;
        text-decoration: none;
    }

    header {
       box-sizing: border-box;
       margin: 20px 3px;
       padding: 0 20px;
       width: 1900px;
       display: flex; 
       justify-content: flex-end;
       align-items: center;
    }

    .logo {
        width: 211px;
        height: 67px;
        margin-right: auto;
    }

    .nav__links {
        list-style: none;
    }

    .nav__links li {
        display: inline-block;
        padding: 0px 20px;
    }

    .nav__links li a {
        transition: all 0.3s ease 0s;
    }

    .nav__links li a:hover {
        color: #06acd5;
    }
    </style>
</head>
<body>
	<%if (alertMsg != null){  %>
		
		<script>
		alert("<%=alertMsg%>");
		</script>
		<%session.removeAttribute("alertMsg"); // invalidate 쓰면 session 이 다 날아간다 따라서 이 세션만 지울수 있게 removeattribute 를 쓴다%>
	<%} %>
    <header>
        <img class="logo" src="img/KakaoTalk_20230814_140248577_04.png" alt="logo">
        <nav>
            <ul class="nav__links">
                <li><a href="#">검색</a></li>
                <li><a href="<%= contextPath %>/myPage.me">마이페이지</a></li>
                <li><a href="<%= contextPath %>/check.ad">관리자페이지</a></li>
                <li><a href="#">자유게시판</a></li>
                <li><a href="#">고객센터</a></li>
                <li><a href="<%= contextPath %>/list.pl">장소</a></li>
                <li><a href="#">Q&A</a></li>
            
            </ul>
        </nav>
    </header>
</body>
</html>