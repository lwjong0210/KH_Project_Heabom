<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .yj_myReview_area{
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
        .yj_myReview_detail{
            height: auto;
            width: auto;
            border: 1px solid lightgray;
            padding: 10px;
            margin-bottom: 5px;
        }
        .yj_myReview_detail img{
            height: 100%;
            width: 100%;
        }
    
        .text_limit {
            width: 250px;
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
    <div class="yj_myReview_area" align="cneter">
        <div class="yj_myReview_detail">
            <table border="0" class="detail_tb">
                <tr>
                    <td height="80" width="80">
                        <img src="https://tse1.mm.bing.net/th?id=OIP.bcPW77h3l7ZG8_rqFbsIKwHaHj&pid=Api&P=0&h=220" alt="" style="width: 100%; height: 100%; border-radius: 50px;">
                    </td>
                    <td width="3"></td>
                    <td width="250">
                        <div style="font-size: medium; margin-bottom: 5px;"><strong>이*종님께서</strong> 내 게시물에 리뷰를 작성하였습니다.</div>
                        <div class="text_limit" style="font-size: small;">[리뷰내용]와 이글 진짜 도움되네요</div>
                    </td>
                    <td width="3"></td>
                    <td width="110" height="100">
                        <img src="https://mediahub.seoul.go.kr/wp-content/uploads/2015/01/ff3e50a3a7011272d25652517be9489d.jpg" alt="">
                    </td>
                </tr>
            </table>
        </div>
        <div class="yj_myReview_detail">
            <table border="0" class="detail_tb">
                <tr>
                    <td height="80" width="80">
                        <img src="https://tse1.mm.bing.net/th?id=OIP.bcPW77h3l7ZG8_rqFbsIKwHaHj&pid=Api&P=0&h=220" alt="" style="width: 100%; height: 100%; border-radius: 50px;">
                    </td>
                    <td width="3"></td>
                    <td width="250">
                        <div style="font-size: medium; margin-bottom: 5px;"><strong>박*진님께서</strong> 내 게시물에 리뷰를 작성하였습니다.</div>
                        <div class="text_limit" style="font-size: small;">이글은 발로쓰신건지 손으로 쓰신건지 모를정도네요 난독증 올거 같아요</div>
                    </td>
                    <td width="3"></td>
                    <td width="110" height="100">
                        <img src="https://mediahub.seoul.go.kr/wp-content/uploads/2015/01/ff3e50a3a7011272d25652517be9489d.jpg" alt="">
                    </td>
                </tr>
            </table>
        </div>
    </div>
</body>

</html>