<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            background-color: rgb(249, 238, 238);
        }
        div{
            box-sizing: border-box;
            /*border: 1px solid black;*/
        }
        .table-header>td button{
            height: 100%;
            width: 70px;
            font-size: 14px;
            line-height: 10px;
            margin-left: 680px;
        }
        .table-header>td div{
            display: inline-block
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
                                1,500개의 글
                            </div>
                            <div style="font-size: 14px;"><a href="">최신순</a> |</div>
                            <div style="font-size: 14px;"><a href="">조회순</a></div>
                            <div>
                                <button class="btn btn-secondary">글쓰기</button>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th style="width: 10%;">글번호</th>
                    <th style="width: 60%;">제목</th>
                    <th style="width: 10%;">작성자</th>
                    <th style="width: 10%;">조회수</th>
                    <th style="width: 10%;">작성일</th>
                </tr>
                
            </thead>
            <tbody>
                <tr>        
                    <td>
                        <div class="post-notice">
                            공지
                        </div>
                    </td>
                    <td>게시물 작성 관련</td>
                    <td>관리자</td>
                    <td>2000</td>
                    <td>2023.07.17</td>
                </tr>
                    <tr>        
                        <td>20</td>
                        <td>맛집추천이요</td>
                        <td>USER01</td>
                        <td>5</td>
                        <td>2023.08.19</td>
                    </tr>
                    <tr>
                        <td>19</td>
                        <td>퇴근하고싶다.</td>
                        <td>USER02</td>
                        <td>40</td>
                        <td>2023.08.11</td>
                    </tr>
                    <tr>        
                        <td>18</td>
                        <td>맛집추천이요</td>
                        <td>USER01</td>
                        <td>5</td>
                        <td>2023.08.19</td>
                    </tr>
                    <tr>
                        <td>17</td>
                        <td>퇴근하고싶다.</td>
                        <td>USER02</td>
                        <td>40</td>
                        <td>2023.08.11</td>
                    </tr>
                    <tr>        
                        <td>16</td>
                        <td>맛집추천이요</td>
                        <td>USER01</td>
                        <td>5</td>
                        <td>2023.08.19</td>
                    </tr>
                    <tr>
                        <td>15</td>
                        <td>퇴근하고싶다.</td>
                        <td>USER02</td>
                        <td>40</td>
                        <td>2023.08.11</td>
                    </tr>
                    <tr>        
                        <td>14</td>
                        <td>맛집추천이요</td>
                        <td>USER01</td>
                        <td>5</td>
                        <td>2023.08.19</td>
                    </tr>
                    <tr>
                        <td>13</td>
                        <td>퇴근하고싶다.</td>
                        <td>USER02</td>
                        <td>40</td>
                        <td>2023.08.11</td>
                    </tr>
                    <tr>
                        <td>12</td>
                        <td>퇴근하고싶다.</td>
                        <td>USER02</td>
                        <td>40</td>
                        <td>2023.08.11</td>
                    </tr>

            </tbody>
            <tfoot>
                <tr>
                    <td colspan="5" style="border-top: 1px solid gray;">
                        <ul class="pagination justify-content-center" style="margin: 0;">
                            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item active"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">Next</a></li>
                        </ul>
                    </td>
                </tr>
            </tfoot>
        </table>
    </div>
</body>
</html>