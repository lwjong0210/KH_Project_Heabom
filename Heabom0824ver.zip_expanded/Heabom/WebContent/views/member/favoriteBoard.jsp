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
        .card{border: 0;}
        .card-body{
            text-align: center;
            font-size: larger;
            padding-top: 5px;
        }
        a{text-decoration: none; color: black;}
        .area{
            border: 1px solid;
            height: auto;
            width: 600px;
            margin: auto;
            margin-top: 50px;
            padding-top: 30px;
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


    </style>
</head>
<body>
<%@include file = "myPage.jsp" %>
    <div class="area" align="center">
      <div class="row">
        <div class="col-lg-4 col-md-6">
            <div class="card rounded-3" style="width: 10rem;">
                <a href="http://www.naver.com"><img src="resource/getImage" class="rounded-3 card-img-top"></a>
                <div class="card-body">
                  <a href="http://www.naver.com" class="card-title"><strong>게시물제목</strong></a>
                </div>
              </div>
        </div>
        <div class="col-lg-4 col-md-6">
            <div class="card rounded-3" style="width: 10rem;">
                <a href="http://www.naver.com"><img src="resource/getImage" class="rounded-3 card-img-top"></a>
                <div class="card-body">
                  <a href="http://www.naver.com" class="card-title"><strong>게시물제목</strong></a>
                </div>
              </div>
        </div>
        <div class="col-lg-4 col-md-6">
            <div class="card rounded-3" style="width: 10rem;">
                <a href="http://www.naver.com"><img src="resource/getImage" class="rounded-3 card-img-top"></a>
                <div class="card-body">
                  <a href="http://www.naver.com" class="card-title"><strong>게시물제목</strong></a>
                </div>
              </div>
        </div>
        <div class="col-lg-4 col-md-6">
            <div class="card rounded-3" style="width: 10rem;">
                <a href="http://www.naver.com"><img src="resource/getImage" class="rounded-3 card-img-top"></a>
                <div class="card-body">
                  <a href="http://www.naver.com" class="card-title"><strong>게시물제목</strong></a>
                </div>
              </div>
        </div>
        <div class="col-lg-4 col-md-6">
            <div class="card rounded-3" style="width: 10rem;">
                <a href="http://www.naver.com"><img src="resource/getImage" class="rounded-3 card-img-top"></a>
                <div class="card-body">
                  <a href="http://www.naver.com" class="card-title"><strong>게시물제목</strong></a>
                </div>
              </div>
        </div>
        <div class="col-lg-4 col-md-6">
            <div class="card rounded-3" style="width: 10rem;">
                <a href="http://www.naver.com"><img src="resource/getImage" class="rounded-3 card-img-top"></a>
                <div class="card-body">
                  <a href="http://www.naver.com" class="card-title"><strong>게시물제목</strong></a>
                </div>
              </div>
        </div>
        <div class="col-lg-4 col-md-6">
            <div class="card rounded-3" style="width: 10rem;">
                <a href="http://www.naver.com"><img src="resource/getImage" class="rounded-3 card-img-top"></a>
                <div class="card-body">
                  <a href="http://www.naver.com" class="card-title"><strong>게시물제목</strong></a>
                </div>
              </div>
        </div>
        <div class="col-lg-4 col-md-6">
            <div class="card rounded-3" style="width: 10rem;">
                <a href="http://www.naver.com"><img src="resource/getImage" class="rounded-3 card-img-top"></a>
                <div class="card-body">
                  <a href="http://www.naver.com" class="card-title"><strong>게시물제목</strong></a>
                </div>
              </div>
        </div>
        <div class="col-lg-4 col-md-6">
            <div class="card rounded-3" style="width: 10rem;">
                <a href="http://www.naver.com"><img src="resource/getImage" class="rounded-3 card-img-top"></a>
                <div class="card-body">
                  <a href="http://www.naver.com" class="card-title"><strong>게시물제목</strong></a>
                </div>
              </div>
        </div>
      </div>

      <nav aria-label="Page navigation example">
        <ul class="pagination">
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Previous">
              <span aria-hidden="true">&laquo;</span>
            </a>
          </li>
          <li class="page-item"><a class="page-link" href="#">1</a></li>
          <li class="page-item"><a class="page-link" href="#">2</a></li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Next">
              <span aria-hidden="true">&raquo;</span>
            </a>
          </li>
        </ul>
      </nav>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>