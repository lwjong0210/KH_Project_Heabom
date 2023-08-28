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


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

	<!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"/>

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


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
                
                <%if (loginMember != null ){ %>
	                <%if (loginMember.getMemId().equals("admin")){%>
                        <li><a href="<%= contextPath %>/myPage.me">마이페이지</a></li>
	                <li><a href="<%= contextPath %>/check.ad">관리자페이지</a></li>
                    <ul>
                        <li><a href="배너 관리"></a></li>
                    </ul>
	                <%}%>
                <%}%>
                <li><a href="<%= contextPath %>/list.bo?cpage=1">자유게시판</a></li>
                <li><a href="#">고객센터</a></li>
                <li><a href="<%= contextPath %>/list.pl">장소</a></li>
                <li><a href="#">Q&A</a></li>
            </ul>
        </nav>
        <div>
        <%if (loginMember == null ){ %>
        
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                로그인하기
              </button>
              
              <!-- The Modal -->
              <div class="modal" id="myModal">
                <div class="modal-dialog">
                  <div class="modal-content">
              
                    <!-- Modal Header -->
                    <div class="modal-header">
                      <h4 class="modal-title">로그인</h4>
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
              
                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="<%=contextPath%>/login.me">
                            <div class="form-group">
                             
                              <input type="text" class="form-control" placeholder="아이디" name = "memId">
                            </div>
                            <div class="form-group">
                              <label for="pwd">Password:</label>
                              <input type="password" class="form-control" placeholder="Enter password" name="memPwd">
                            </div>
                            <button type="submit" class="btn btn-primary">로그인</button>
                          </form>
                        
                    </div>
                    <br>
                    <button type="button" class="btn btn-primary" onclick="enroll();">회원가입하기</button>
              
                    <!-- Modal footer -->
                    <div class="modal-footer">
                      <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
              
                  </div>
                </div>
              </div>
        <%}else{%>
            <h3><%=loginMember.getNickname()%>님</h3>
            <br>
            <button  class="btn btn-danger" onclick="location.href = '<%=contextPath%>/logout.me'">로그아웃</button>
            
        
        <%}%>

        </div>

    </header>

        <script>
            function enroll(){
                location.href =  "<%=contextPath%>/enrollForm.me";
            }

        </script>
</body>



</html>