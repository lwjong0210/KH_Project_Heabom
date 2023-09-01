<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList searchKey = (ArrayList)request.getAttribute("searchKey");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
<%@include file = "../common/header.jsp" %>
	    <form action="<%=contextPath%>/courseSelect.pl">
        <input type="checkbox" name = "check" value = "1">술한잔
        <input type="checkbox" name = "check" value = "2">커피한잔 하실래요? 
        <input type="checkbox" name = "check" value = "3">배고파요!
        <button type="submit">가볼까요?</button>
   		</form>
	
	
</body>
</html>