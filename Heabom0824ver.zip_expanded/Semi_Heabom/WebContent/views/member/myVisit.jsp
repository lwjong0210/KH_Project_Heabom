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
    .yj_myVisit_area{
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

    .yj_myVisit_detail{
    height: auto;
    width: auto;
    border: 1px solid lightgray;
    padding: 10px;
    }

    .yj_myVisit_detail img{
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

    </style>
</head>
<body>
    <div class="yj_myVisit_area" align="cneter">
        <div class="yj_myVisit_detail">
            <table border="0" class="detail_tb">
                <tr>
                    <td rowspan="3" width="300" height="150">
                        <img src="https://mediahub.seoul.go.kr/wp-content/uploads/2015/01/ff3e50a3a7011272d25652517be9489d.jpg" alt="">
                    </td>
                    <td rowspan="3" width="10"></td>
                    <td height="50" width="350" colspan="4"><div class="text_limit"><strong>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tenetur, saepe quo. Expedita omnis rerum suscipit ullam minima exercitationem doloremque aut amet non deserunt voluptatum, nostrum atque iusto nisi aliquam autem!</strong></div></td>
                </tr>

                <tr>
                    <td height="50" width="350" colspan="4"><div class="text_limit">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Excepturi totam aliquam consequatur ipsum rerum distinctio commodi odit eum sed nihil ducimus adipisci aliquid, magni quis iure, libero temporibus in ullam!</div></td>
                </tr>
                <tr>
                    <td width="200" style="text-align: center;">작성일 : 23/08/25 11:45</td>
                    <td width="150" style="text-align: center;">별점 : ★★★★★ </td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>