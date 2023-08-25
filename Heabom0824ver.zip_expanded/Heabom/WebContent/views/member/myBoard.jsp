<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        .area{
        border: 1px solid;
        height: auto;
        width: 600px;
        margin: auto;
        margin-top: 50px;
        padding-top: 30px;
        padding-left:20px;
        padding-right:20px;
        }
        .area *{
            border: 0px;
        }
        nav{
            display: flex;
            flex-flow: row nowrap;
            justify-content: center;
           
        }
        .page-link{
            border: 0px;
            color: black;
            font-weight: bolder;
        }
        .card-body{
            text-align: left;
        }
        .row{
            margin-bottom: 20px;
        }
        a{
            text-decoration: none;
            color: black;
        }
    </style>
</head>
<body>
<%@include file = "myPage.jsp" %>
    <div class="area" align="center">
        <div class="card mb-3">
            <div class="row">
            <div class="col">
                <a href="#"><img src="resource/getImage" class="img-fluid rounded-start" alt="..."></a>
            </div>
            <div class="col-md-8">
                <div class="card-body">
                <h5 class="card-title"><a href="#"><strong>글제목</strong></a></h5>
                <p class="card-text text-truncate"><a href="#">시끌벅적 와글와글 웅성웅성 시끌벅적 와글와글 웅성웅성시끌벅적 와글와글 웅성웅성시끌벅적 와글와글 웅성웅</a></p>
                </div>
            </div>
            </div>
        </div>
        <div class="card mb-3">
            <div class="row">
            <div class="col">
                <a href="#"><img src="resource/getImage" class="img-fluid rounded-start" alt="..."></a>
            </div>
            <div class="col-md-8">
                <div class="card-body">
                <h5 class="card-title"><a href="#"><strong>글제목</strong></a></h5>
                <p class="card-text text-truncate"><a href="#">시끌벅적 와글와글 웅성웅성 시끌벅적 와글와글 웅성웅성시끌벅적 와글와글 웅성웅성시끌벅적 와글와글 웅성웅</a></p>
                </div>
            </div>
            </div>
        </div>
        <div class="card mb-3">
            <div class="row">
            <div class="col">
                <a href="#"><img src="resource/getImage" class="img-fluid rounded-start" alt="..."></a>
            </div>
            <div class="col-md-8">
                <div class="card-body">
                <h5 class="card-title"><a href="#"><strong>글제목</strong></a></h5>
                <p class="card-text text-truncate"><a href="#">시끌벅적 와글와글 웅성웅성 시끌벅적 와글와글 웅성웅성시끌벅적 와글와글 웅성웅성시끌벅적 와글와글 웅성웅</a></p>
                </div>
            </div>
            </div>
        </div>
        <div class="card mb-3">
            <div class="row">
            <div class="col">
                <a href="#"><img src="resource/getImage" class="img-fluid rounded-start" alt="..."></a>
            </div>
            <div class="col-md-8">
                <div class="card-body">
                <h5 class="card-title"><a href="#"><strong>글제목</strong></a></h5>
                <p class="card-text text-truncate"><a href="#">시끌벅적 와글와글 웅성웅성 시끌벅적 와글와글 웅성웅성시끌벅적 와글와글 웅성웅성시끌벅적 와글와글 웅성웅</a></p>
                </div>
            </div>
            </div>
        </div>

        <!-- 하단 네비바, 글 추가할 경우 위에 추가 -->
        <nav aria-label="Page navigation example">
            <ul class="pagination">
            <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-left" viewBox="0 0 16 16">
                        <path d="M10 12.796V3.204L4.519 8 10 12.796zm-.659.753-5.48-4.796a1 1 0 0 1 0-1.506l5.48-4.796A1 1 0 0 1 11 3.204v9.592a1 1 0 0 1-1.659.753z"/>
                      </svg>
                <!-- <span aria-hidden="true">&laquo;</span> -->
                </a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right" viewBox="0 0 16 16">
                        <path d="M6 12.796V3.204L11.481 8 6 12.796zm.659.753 5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753z"/>
                      </svg>
                      
                <!-- <span aria-hidden="true">&raquo;</span> -->
                </a>
            </li>
            </ul>
        </nav>
        </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>