<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .yj_myQnA_area{
        border: 0px solid;
        height: auto;
        width: 532px;
        margin: auto;
        margin-top: 10px;
        margin-left: 817px;
        background-color: skyblue;
        padding: 20px;
        border-radius: 20px;
        }
        .yj_myQnA_detail{
        height: auto;
        width: auto;
        border: 1px solid white;
        padding: 10px;
    }
    .pull {
        position:relative;
        margin-left: 10px;
        margin-right: 10px;
        margin-bottom: 20px;
        padding: 20px; 
        width:450px; 
        height:auto; 
        color: black; 
        border-radius: 10px; 
        background-color: #000;
        line-height: 30px;
        cursor: pointer;
        }
    .pull.gr {background-color: lightgray;}
    .pull.gr:after {
        content:"";
        position: absolute; 
        right: 30px; 
        top: 65px; 
        border-left: 20px solid transparent; 
        border-right: 20px solid transparent; 
        border-top: 20px solid lightgray;}
    .pull.pk_complete {
        color: white;
        background-color: rgb(223, 188, 223);
        margin-bottom: 0;
    }
    .pull.pk_complete:after {
        content:"";
        position: absolute; 
        left: 30px; 
        bottom: 105px ; 
        border-left: 20px solid transparent; 
        border-right: 20px solid transparent; 
        border-bottom: 20px solid rgb(223, 188, 223);}
    .pull.pk_complete {
        color: white;
        background-color: rgb(223, 188, 223);
    }

    .text_limit {
        width: 450px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;  /* 말줄임 적용 */
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

    .pull.pk_unComplete {
        color: white;
        background-color: rgb(223, 188, 223);
    }    
    .pull.pk_unComplete:after {
        content:"";
        position: absolute; 
        left: 30px; 
        bottom: 65px ; 
        border-left: 20px solid transparent; 
        border-right: 20px solid transparent; 
        border-bottom: 20px solid rgb(223, 188, 223);}
    .pull.pk_unComplete {
        color: white;
        background-color: rgb(223, 188, 223);
        margin-bottom: 0px;
    }
    </style>
</head>
<body>
    <div class="yj_myQnA_area" align="cneter">
        <div class="yj_myQnA_detail">
            <div class="pull gr">
                <div class="text_limit gr">
                    <strong>어제 새벽 6시에 역삼갈비 갔는데 문닫았더라구요 해명해주세요 저는 갈비가 새벽부터</strong>
                </div>
            </div>
            <!-- 답변 전 -->
            <div class="pull pk_unComplete">
                <div class="text_limit"><strong>관리자가 성실한 답변 작성중에 있습니다. 빠른시일내에 답변 드리겠습니다.</strong></div>
            </div>

            <!-- 답변완료시 -->
            <!-- <div class="pull pk_complete">
                    <table border="0">
                        <tr>
                            <td width="60">답변자 :</td>
                            <td><strong>원종매니저</strong></td>
                            <td width="20"></td>
                            <td width="70">답변일자:</td>
                            <td><strong>23/08/28 10:13</strong></td>
                        </tr>
                        <tr>
                            <td colspan="5" width="450">
                                <div class="text_limit">
                                    <strong>고객님은 어제 만취상태로 인사불성이 의심됨으로 가까운 병원을 내방하셔서 알콜중독증 해결 후 질문 바랍니다.</strong>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div> -->
        </div>
    </div>
</body>
</html>