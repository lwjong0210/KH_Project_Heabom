<%@page import="java.util.ArrayList"%>
<%@page import="com.heabom.common.model.vo.PageInfo"%>
<%@page import="com.heabom.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
PageInfo pi = (PageInfo)request.getAttribute("pi");
ArrayList<Board> plist = (ArrayList<Board>)request.getAttribute("plist");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div {
	box-sizing: border-box;
	/*border: 1px solid black;*/
}

.table-header>td button {
	height: 35px;
	width: 70px;
	font-size: 14px;
}

.table-header>td div {
	float: right;
}

.table-header>td div * {
	width: auto;
}

.table-header a {
	color: #000;
	text-decoration: none;
}

.post-notice {
	border: 1px solid #ffc6c9;
	border-radius: 10px;
	background-color: #ffe3e4;
	color: #ff4e59;
	font-weight: 600;
}

.table-hover {
	text-align: center;
}

tbody>tr:hover {
	cursor: pointer;
}

.post-notice-area {
	background-color: rgb(249, 238, 238);
}

.post-notice-title {
	color: #ff4e59;
	font-weight: 600;
}
</style>
</head>
<body>

	<% if(plist.isEmpty()){ %>
	<tr>
		<td colspan="5">아직 게시글이 존재하지 않습니다.</td>
	</tr>
	<% }else{ %>

	<% for(Board b : plist){ %>
	<% if(b.getBoardNo().substring(0, 1).equals("N")){ %>
	<tr class="post-notice-area"></tr>

	<td hidden><%= b.getBoardNo().substring(1) %></td>
	<td><div class="post-notice">공지</div></td>
	<td class="post-notice-title"><%= b.getBoardTitle() %> <% if(b.getCountReply() != 0){ %>
		<b style="color: red"> [<%= b.getCountReply() %>]
	</b> <% }else{ %> <% } %></td>
	<% }else{ %>

	<tr>
		<td><%= b.getBoardNo().substring(1) %></td>
		<td><%= b.getBoardTitle()%> <% if( b.getCountReply() != 0){ %> <b
			style="color: red"> [<%= b.getCountReply() %>]
		</b> <% }else{ %> <% } %></td>


		<% } %>
		<td><%= b.getWriter() %></td>
		<td><%= b.getBoardCount() %></td>
		<td><%= b.getCreateDate() %></td>
	</tr>
	<% } %>

	<% } %>
</body>
</html>