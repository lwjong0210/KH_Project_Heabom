<%@page import="com.heabom.board.model.service.BoardService"%>
<%@page import="com.heabom.board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.heabom.common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .outer{
            padding: 10px 10px 0 10px;
            width: 1000px;
            height: auto;
            border: 1px solid black;
            margin: auto;
            background-color: white; 
        }
        div{
            box-sizing: border-box;
            /*border: 1px solid black;*/
        }
        .table-header>td button{
            height: 35px;
            width: 70px;
            font-size: 14px;
            line-height: 10px;
            margin-left: 540px;
        }
        .table-header>td div{
            display: inline-block
        }
        .table-header>td div *{
			width: auto;
        }
        .table-header a{
            color: #000;
            text-decoration: none;
        }
        .post-notice{
            border: 1px solid #ffc6c9;
            border-radius: 10px;
            background-color: #ffe3e4;
            color: #ff4e59;
            font-weight: 600;
        }
        .table-hover{
            text-align: center;
        }
        tbody>tr:hover{
            cursor: pointer;
        }
        .post-notice-area{
            background-color: rgb(249, 238, 238);
        }
        
        .post-notice-title{
            color:  #ff4e59;
            font-weight: 600;
        }

        /* 페이지네이션 관련 */
        .page-link {
            color: #000; 
            background-color: #fff;
            border: 1px solid #ccc; 
        }
        .page-item.active .page-link {
            /*z-index: 1;*/
            color: #555;
            font-weight:bold;
            background-color: #f1f1f1;
            border-color: #ccc;
            
        }
        .page-link:focus, .page-link:hover {
            color: #000;
            background-color: #fafafa; 
            border-color: #ccc;
        }
        /* 페이지네이션 관련 끝 */
        
    </style>
</head> 
<body>
<%@ include file ="../common/header.jsp" %>
    <div class="outer">
        <br>
        <h2 align="center">자유게시판</h2>
        <br>
        <table class="table table-hover">
            <thead>
                <tr class="table-header">
                    <td colspan="5" style="border-bottom: 1px solid gray; border-top: 0px; text-align: left;">
                        <div style="width: 100%; height: 30px;">
                            <div style="height: 100%; width: 100px; font-size: 14px;">
                                총 <%= pi.getListCount() %>개의 글
                            </div>
                            <div style="font-size: 14px;"><a href="">최신순</a> |</div>
                            <div style="font-size: 14px;"><a href="">조회순</a></div>
                            <div>
                                <select name="display" class="listCountCtrl" onchange="a();">
                                    <option value="10">10개씩보기</option>
                                    <option value="15">15개씩보기</option>
                                    <option value="20">20개씩보기</option>
                                    <option value="25">25개씩보기</option>
                                    <option value="30">30개씩보기</option>
                                </select>
                            </div>
                            <div>
                                <button class="btn btn-secondary" onclick="location.href='<%=contextPath%>/enrollForm.bo'">글쓰기</button>
                            </div>
                            <script>
                            console.log($(".listCountCtrl").val())
                           		function a (){
                           		
									$.ajax({
										url:"list.bo?cpage=1",
										data:{
											pageLimit:$(".listCountCtrl").val()
										},
										type:"post",
										success:function(){
											console.log("ajax 통신 성공!")
									
										},error:function(){
											console.log("ajax 통신 실패!")
										}
										
									})
                           		}
                            </script>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th style="width: 5%;">글번호</th>
                    <th style="width: 60%;">제목</th>
                    <th style="width: 10%;">작성자</th>
                    <th style="width: 10%;">조회수</th>
                    <th style="width: 15%;">작성일</th>
                </tr>
                
            </thead>
            <tbody>
                <% if(list.isEmpty()){ %>
	                <tr>
						<td colspan="5">아직 게시글이 존재하지 않습니다.</td>
	                </tr>
                <% }else{ %>
                
                	<% for(Board b : list){ %>
                		<% if(b.getBoardCategory().equals("N")){ %>
                	<% System.out.println("하이룽" + pi.getBoardLimit()); %>
					         <tr class="post-notice-area">        
					             <td><div class="post-notice">공지</div></td>
					             <td class="post-notice-title"><%= b.getBoardTitle() %>
					             <% if(b.getCountReply() != 0){ %>
					             	<b style="color: red"> [<%= b.getCountReply() %>]</b>
					             <% }else{ %>
					             <% } %>
					             </td>
                		<% }else{ %>
			                <tr>        
			                    <td><%= b.getBoardNo() %></td>
			                    <td><%= b.getBoardTitle()%>
								<% if( b.getCountReply() != 0){ %>
					             	<b style="color: red"> [<%= b.getCountReply() %>]</b>
					             <% }else{ %>
					             <% } %>
					             </td>

                		
                		<% } %>
		                    <td><%= b.getWriter() %></td>
		                    <td><%= b.getBoardCount() %></td>
		                    <td><%= b.getCreateDate() %></td>
		                </tr>
	                <% } %>
                
	            <% } %>

            </tbody>
            <tfoot>
                <tr>
                    <td colspan="5" style="border-top: 1px solid gray;">
                        <ul class="pagination justify-content-center" style="margin: 0;">
	                        <% if(pi.getCurrentPage() != 1){ %>
                            	<li class="page-item"><button class="page-link" onclick="location.href='<%= contextPath %>/list.bo?cpage=<%= currentPage -1 %>'">Previous</button></li>
	                        <% } %>
	                        <% for(int i = startPage; i <= endPage; i++ ){ %>
		                        <% if(i == currentPage){ %>
			                        <li class="page-item"><button class="page-link btn active" disabled><%= i %></button></li>
		                        <% }else{ %>
			                        <li class="page-item"><button class="page-link" onclick="location.href='<%= contextPath %>/list.bo?cpage=<%= i %>'"><%= i %></button></li>
		                        
                        		<% } %>
                        	<% } %>
	                        
	                        <% if(currentPage != maxPage){ %>
	                            <li class="page-item"><button class="page-link" onclick="location.href='<%= contextPath %>/list.bo?cpage=<%= currentPage +1 %>'">Next</button></li>
	                      	<% } %>
                        </ul>
                    </td>
                </tr>
            </tfoot>
        </table>
    </div>
</body>
</html>