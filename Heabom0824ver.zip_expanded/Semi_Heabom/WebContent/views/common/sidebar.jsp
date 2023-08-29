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
<<<<<<< HEAD
    .login_btn{
        position: fixed;
        /* position: absolute; */
        bottom: 3.7rem;
        right: 1rem;
        width: 2.5rem;
        height: 2.5rem;
        /* top: auto;
        left: 1850px; */

    }
=======
    
>>>>>>> 99e1512bdae2c4f272249c1550823d6bb3ec918e
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