<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .all{
        position: relative;
    }
        .moveTopBtn {
        position: fixed;
        bottom: 1rem;
        right: 1rem;
        width: 2.5rem;
        height: 2.5rem;
        cursor: pointer;
    }
    .loginBtn{
        position: fixed;
        bottom: 3.7rem;
        right: 1rem;
        width: 2.5rem;
        height: 2.5rem;
        cursor: pointer;
    }
    .login_btn{
        /* position: fixed; */
        /* position: absolute; */
        bottom: 3.7rem;
        right: 1rem;
        width: 2.5rem;
        height: 2.5rem;
        /* top: auto;
        left: 1850px; */

    }
    .loginBtn>svg, .moveTopBtn>svg {
        width: 40px;
        height: 40px;
        color: rgb(253, 111, 182)
    }
</style>
</head>
<body>
<div class="all">
    <div class="moveTopBtn">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up-circle-fill" viewBox="0 0 16 16">
            <path d="M16 8A8 8 0 1 0 0 8a8 8 0 0 0 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
          </svg>
    </div>

    <!-- 로그인 및 버튼 -->
    <div class="login_btn">
        <%if (loginMember == null ){ %>
        
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                    <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                </svg>
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
                            
                            <input type="text" class="form-control" placeholder="아이디" name = "memId" value="admin">
                            </div>
                            <div class="form-group">
                            <label for="pwd">Password:</label>
                            <input type="password" class="form-control" placeholder="Enter password" name="memPwd" value="admin">
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
</div>

    <script>
        const $topBtn = document.querySelector(".moveTopBtn");

        // 버튼 클릭 시 맨 위로 이동
        $topBtn.onclick = () => {
            window.scrollTo({ top: 0, behavior: "smooth" });  
        }
    </script>
</body>
</html>