<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
    .yj_myPlace_area{
        border: 0px solid;
        height: auto;
        width: 532px;
        margin: auto;
        margin-top: 10px;
        margin-left: 817px;
        background-color: white;
        padding: 20px;
        border-radius: 20px;
    }

    .yj_myPlace_detail{
    height: auto;
    width: auto;
    border: 1px solid lightgray;
    padding: 10px;
    margin-bottom: 5px;
    }

    .yj_myPlace_detail img{
        height: 100%;
        width: 100%;
    }

    .text_limit {
        width: 300px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;  /* 말줄임 적용 */
        font-size: larger;
    }

    .detail_tb div, .detail_tb img{
        cursor: pointer;
    }

    .text_limit a {
        color: blue;
        font-size: small;
        font-weight: bolder;
    }
    .text_limit a:hover {
        color: yellowgreen;
    }
    .text_limit:hover{
        color: darkgray;
    }


    </style>
</head>
<body>
    <div class="yj_myPlace_area" align="cneter">
        <div class="yj_myPlace_detail">
            <table border="0" class="detail_tb">
                <tr>
                    <td rowspan="4" width="300" height="130">
                        <img src="https://mediahub.seoul.go.kr/wp-content/uploads/2015/01/ff3e50a3a7011272d25652517be9489d.jpg" alt="">
                    </td>
                    <td rowspan="4" width="10"></td>
                    <td height="40" width="350" colspan="4"><div class="text_limit"><strong>11월 최대 여의도 불꽃축제</strong></div></td>
                </tr>
                <tr>
                    <td height="30" width="350" colspan="4"><div class="text_limit">2023년 국제 최대 규모의 불꽃 축제가 여의도에서 열린다.</div></td>
                </tr>
                <tr>
                    <td height="20" width="350" colspan="4"><div class="text_limit" ><a href="#">#용산</a> <a href="#">#불꽃축제</a> <a href="#">#서울데이트</a> <a href="#">#야경</a> <a href="#">#우리동네뷰맛집</a></div></td>
                </tr>
                <tr>
                    <td width="120" style="text-align: center; font-size: smaller;">작성일: 23/08/25</td>
                    <td width="80" style="text-align: center; font-size: smaller;">조회수: 30</td>
                    <td width="150" style="text-align: center; font-size: smaller;">별점: ★★★★★ </td>
                </tr>
            </table>
        </div>
        <div class="yj_myPlace_detail">
            <table border="0" class="detail_tb">
                <tr>
                    <td rowspan="4" width="300" height="130">
                        <img src="https://mediahub.seoul.go.kr/wp-content/uploads/2015/01/ff3e50a3a7011272d25652517be9489d.jpg" alt="">
                    </td>
                    <td rowspan="4" width="10"></td>
                    <td height="40" width="350" colspan="4"><div class="text_limit"><strong>여기는 내가쓴 게시물 보여주는 곳Lorem ipsum dolor sit, amet consectetur adipisicing elit. Architecto corrupti voluptatum, unde nihil illum fugiat aspernatur nesciunt ea excepturi libero veritatis iusto facere ipsa quod, perferendis omnis distinctio soluta minus!</strong></div></td>
                </tr>
                <tr>
                    <td height="30" width="350" colspan="4"><div class="text_limit">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Incidunt eos a maxime magnam quam laudantium, quas sint numquam, natus nam deleniti, at cum deserunt ducimus porro perspiciatis debitis quo vitae.</div></td>
                </tr>
                <tr>
                    <td height="20" width="350" colspan="4"><div class="text_limit" ><a href="#">#용산</a> <a href="#">#불꽃축제</a> <a href="#">#서울데이트</a> <a href="#">#야경</a> <a href="#">#우리동네뷰맛집</a></div></td>
                </tr>
                <tr>
                    <td width="120" style="text-align: center; font-size: smaller;">작성일: 23/08/25</td>
                    <td width="80" style="text-align: center; font-size: smaller;">조회수: 30</td>
                    <td width="150" style="text-align: center; font-size: smaller;">별점: ★★★★★ </td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>