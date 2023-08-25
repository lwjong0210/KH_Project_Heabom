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
        div{
            /*border: 1px solid red;*/
            box-sizing: border-box;
        }
        .wrap{
            padding-top: 10px;
            width: 1000px;
            height: auto;
            margin: auto;
            background-color: rgb(249, 238, 238);
        }
        .wrap>div{
            width: 100%;
            margin: 10px 20px 20px 20px;
        }
        .btn-light{
            border: 1px solid gray;
        }
        /* 게시글 헤더 영역 */
        #post_header{
            border: 1px solid gray;
            border-radius: 10px 10px 10px 10px;
            background-color: white;
            width: auto;
            height: 230px;
        }
        #post_header>div{
            width: 100%;
        }
        #notice_category{
            height: 50px;
        }
        #notice_category>a{
            text-decoration: none;
            color: black;
            font-size: 18px;
            font-weight: 400;
            line-height: 50px;
            padding-left: 10px;
        }
        #post_title{
            height: 100px;
            font-size: 32px;
            line-height: 100px;
            padding-left: 10px;
            padding-right: 10px;
            font-weight: 800;            
        }
        #user_info{
            padding-left: 10px;
            width: 100%;
            height: 40px;
        }
        #user_info>div{
            float: left;
            height: 100%;
        }
        #user_info img{
            width: 100%;
            height: 100%;
        }
        #user_profile_img{
            width: 40px;
        }
        #user_id{
            width: auto;
            line-height: 40px;
            padding-left: 5px;
            font-size: 20px;
        }
        #user_grade{
            width: 40px;
        }
        #user_grade img{
            position: relative;
            top: 6px;
            height: 50%;
            width: 50%;
        }
        #post_header_footer{
            padding-left: 10px;
            width: 100%; 
            height: 30px;           
        }
        #post_header_footer>div{
            float: left;
            height: 100%;
        }
        #post_date{
            line-height: 25px;
            width: 70%;
        }
        .post_comment{
            width: 30%;
            line-height: 30px;
            padding-right: 1%;
        }
        .post_comment>div{
            padding-left: 5px;
            text-align: right;
            float: right;
            height: 100%;
        }
        .post_comment_img img{
            width: 80%;
            height: 80%;
        }
        .post_comment{
            line-height: 25px;
            font-size: 14px;
            font-weight: 600;
        }
        /* 게시글 헤더 영역 끝 */
        



        /* 게시글 content 영역 */

        #post_content{
            border: 1px solid gray;
            border-radius: 10px 10px 10px 10px;
            background-color: white;
            width: auto;
            height: auto;
        }
        #post_content>div{
            
            width: 100%;
        }
        #post_main{
            height: auto;
        }
        #post_main>*{
            padding: 50px 50px 100px 50px;
        }
        #post_main img{
            width: 100%;
        }
        #post_hashtag{
            padding-left: 10px;
            padding-right: 10px;
            height: 40px;
        }
        #post_hashtag> a{
            font-size: 20px;
            text-decoration: none;
            color: black;
            font-weight: 600;
            line-height: 40px;
        }
        #post_content_footer{
            border-top: 1px solid gray;

            padding-left: 10px;
            line-height: 35px;
            height: 40px;
        }
        #post_content_footer div{
            height: 100%;
            float: left;
        }
        #post_wish_img, #post_comment_img2, #post_report_img{
            text-align: center;
            line-height: 30px;
            width: 40px;
        }
        #post_content_footer img{
            height: 30px;
            width: 30px;
        }
        #post_content_footer span{
            font-size: 18px;
            font-weight: 800;
        }
        /* 게시글 content 영역  끝 */
        



        /* 게시글 댓글 영역 */
        #post_comment_area{
            height: auto;
            width: auto;
            /*border: 1px solid purple;*/
            border: 1px solid gray;
            border-radius: 10px 10px 10px 10px;
            background-color: white;
        }
        #post_comment_area>div{
            padding-left: 20px;
            padding-right: 20px;
            
        }
        #post_comment_header{
            width: 100%;
            height: 45px;
        }
        #post_comment_header>div{
            height: 100%;
        }

        #post_comment_header div{
            float: left;
        }
        #comment_filter_img{
            height: 100%;
            width: 40px;
            text-align: center;
            line-height: 35px;
        }
        #comment_filter_img img{
            height: 40%;
            width: 40%;
        }
        #comment_filter_text{
            width: auto;
            height: 100%;
            text-align: left;
            line-height: 35px;
        }
        #comment_filter_text>a{
            font-size: 12px;
            color: black;
            width: auto;
            text-decoration: none;
        }
        #post_comment_list{
            width: 100%;
            height: auto;
            /*border: 1px solid blue; */
            border-top: 1px solid gray;
        }
        #post_comment_list >div{
            border-radius: 10px 10px 10px 10px;
            background-color: lightgray;
            /*border: 1px solid green;*/
            border: 1px solid black;
            margin: 15px 0px 15px 0px; 
            width: 100%;
            overflow: hidden;
             
        }
        #post_comment>div{
            float: left;
        }
        #post_comment_profile_img{
            padding-top: 10px;
            width: 4%;
            height: 100px;
        }
        #post_comment_profile_img img{
            width: 100%;
        }
        #post_comment_box{
            width: 92%;
            height: auto; /* 바꿔야됨 */
        }
        #post_comment_box>div>*{
            float: left;
        }
        #comment_user_info{
            height: 30px;
            width: 100%;
        }
        #comment_userid{
            padding-top: 3px;
            height: 100%;
            padding-left: 10px;
            font-size: 20px;
            font-weight: 600;
        }
        #comment_usergrade{
            width: 30px;
            height: 100%;
        }
        #comment_usergrade >img{
            padding-top: 40%;
            padding-right: 40%;
            float: left;
            height: 100%;
            width: 100%;
        }
        #comment_text{
            padding: 10px;
            width: 100%;
            height: auto;
        }
        #comment_info{
            height: 30px;
            width: 100%;
        }
        #comment_date{
            width: auto;
            height: 100%;
            font-size: 14px;
            padding-left: 10px;
            padding-right: 10px;
            color: rgb(58, 58, 58);
            font-weight: 600;
            line-height: 25px;
        }
        #comment_report{
            width: 30px;
            height: 100%;
            text-align: center;
        }
        #comment_report img{
            margin-bottom: 3px;
            width: 60%;
            height: 60%;
        }
        #comment_like{
            padding-top: 30px;
            width: 4%;
            height: 80px;
        }
        #comment_like>div{
            width: 100%;
        }
        #comment_like_img{
            height: 60%;
            text-align: center;
        }
        #comment_like_img img{
            width: 80%;
            height: 80%;
        }
        #comment_like_count{
            text-align: center;
            height: 40%;
            width: 100%;

        }
        #write_comment_form{
            padding: 0 20px 20px 20px;
        }
        #write_comment_box{
            border-radius: 10px 10px 10px 10px;
            background-color: lightgray;
            /*border: 1px solid green;*/
            border: 1px solid black;
            padding-left: 10px;
            padding-right: 10px;
            padding-bottom: 10px;
            width: 100%;
            height: auto;
        }
        #write_comment_userid{
            height: 35px;
            width: 100%;
            padding-top: 3px;
            padding-left: 10px;
            font-size: 20px;
            font-weight: 600;
        }
        #write_comment_userid>a{
            text-decoration: none;
            color: black;
        }
        #write_comment_userid>span{
            padding-left: 820px;
            font-size: 14px;
        }
        #write_comment_main{
            width: 100%;
            height: auto;
        } 
        #write_comment{
            background-color: lightgray;
            padding: 10px;
            box-sizing: border-box;
            width: 100%;
            resize: none;
            overflow: hidden;
            overflow-wrap: break-word;
            font-size: 14px;
            padding-left: 10px;
            border: none;   
        }
        #write_comment_footer{
            height: 100%;
            overflow: hidden;
        }
        #write_comment_footer>div{
            float: left;
            height: 100%;
        }
        #comment_upload_img{
            width: 95%;
        }
        #comment_upload_img>input{
            position: relative;
            padding-left: 10px;
            width: 30px;
            height: 30px;
            opacity: 0;
            text-align: left;
            z-index: 10;
        }
        #comment_upload_img img{
            position: relative;
            left: -33px;
            top: 0px;
            height: 30px;
            width: 30px;
            z-index: 1;
        }
        #comment_submit{
            height: 100%;
            width: 5%;
        }
        #comment_submit>input{
            height: 30px;
            width: 100%;
        }
        /* 게시글 댓글 영역 끝 */
        
        
    
        
        /* etc 영역 */
        #post_etc{
            /*border: 1px solid red;*/
            width: auto;
            height: auto;
            text-align: right;
        }
        /* etc 영역 끝 */
        
        
        
        
        /* postlist 영역 */
        .post_list{ /* 인라인으로는 되는데 왜 css에서는 안되는지 모르겠네*/
            width: auto;
        }
        .post_list>h3{
            padding-left: 10px;
            font-weight: 600;
        }
        .list-area{
            margin: 0;
            padding: 0;
            width: 100%;
            height: auto;
        }
        .list-area>tbody>tr:hover{
            background-color: lightgray;
            cursor: pointer;
        }
        .new_post_title{
            width: 70%;
            height: 30px;
            padding-left: 10px; 
        }
        .new_post_title>*{
            line-height: 30px;
            float: left;
            font-size: 14px;
        }
        .new_post_title>div{
            margin-left: 5px;
            height: 100%;
            color: red;
            font-weight: 600;
        }
        .post_writer{
            width: 20%;
        }
        .post_writer, .post_date{
            height: 100%;
            line-height: 30px;
            font-size: 14px;
            
        }
        .post_date{
            width: 10%;
            text-align: center;

        }
        tfoot>tr{
            width: 100%;
            height: auto;
        }
        .post_all_list{
            padding-top: 10px;
            margin-right: 10px;
            height: 30px;
            width: 60px;
            font-size: 14px;
            font-weight: 600;
            float: right;
        }
        .post_all_list:hover{
            cursor: pointer;
        }
        /* postlist 영역 끝 */

        /* pagination 관련 */
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
        
        /* pagination 관련 끝 */
    </style>
</head>
<body>
<%@include file = "../common/header.jsp" %>
    <div class="wrap">
        <div id="post_header">
            <div id="post_header">
                <div id="notice_category">
                    <a href="#">자유게시판</a>
                </div>
                <div id="post_title">
                    <span>유채꽃 축제 다녀왔어요.</span>
                </div>
                <div id="user_info">
                    <div id="user_profile_img">
                        <img src="resources/img/free-icon-login-310869.png" alt="">
                    </div>
                    <div id="user_id">
                        <span>USER01</span>
                    </div>
                    <div id="user_grade">
                        <img src="resources/img/free-icon-benefit-6000574.png" alt="">
                    </div>
                </div>
                <div id="post_header_footer">
                    <div id="post_date">
                        <span>2023.08.09. 07:35</span>
                    </div>
                    <div class="post_comment">
                        <div class="post_comment_text">
                            <span>댓글 2</span>
                        </div>
                        <div class="post_comment_img">
                            <img src="resources/img/free-icon-add-comment-button-60782.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="post_content">
            <div id="post_main">
                <div>
                    <img src="resources/img/20200102112319284_oen.jpeg" alt="">
                    위하여, 아니더면, 고동을 행복스럽고 가치를 예수는 아니한 우리 우리 그리하였는가? 피어나는 그들은 가는 꽃이 수 인생의 노년에게서 말이다. 스며들어 들어 있는 두기 힘있다. 위하여서, 봄날의 이것은 같지 청춘의 보는 것이다. 이상 같이 위하여 방황하였으며, 두손을 전인 기관과 이는 사막이다. 밝은 것이 무한한 붙잡아 있는 있을 그들의 내려온 칼이다. 보배를 같이, 새 말이다. 원질이 원대하고, 되는 타오르고 못할 것이다. 밝은 인생의 가진 그들은 듣기만 방황하여도, 힘있다.
    
                    그러므로 이상은 위하여, 이것이다. 위하여 그것을 같은 커다란 너의 원대하고, 봄바람이다. 가치를 평화스러운 인류의 그들에게 말이다. 얼마나 끓는 아니더면, 얼마나 옷을 사는가 사람은 청춘의 운다. 거선의 이것은 가는 구하지 이상의 예수는 뜨거운지라, 위하여, 이상의 이것이다. 열락의 속에 못하다 주는 인간은 찾아 것이다. 인간이 수 돋고, 그들을 철환하였는가? 노래하며 반짝이는 할지니, 예수는 인생의 바이며, 주는 부패뿐이다. 것은 자신과 피부가 끓는다.
                    
                    품으며, 피어나기 부패를 별과 설산에서 관현악이며, 하는 꽃이 전인 운다. 뼈 가지에 밥을 오직 힘있다. 목숨을 동산에는 이 그들은 이것을 생의 것이다. 얼음이 스며들어 날카로우나 때문이다. 더운지라 그들의 발휘하기 그리하였는가? 그들의 주는 공자는 생명을 인간의 굳세게 않는 이것이다. 밥을 인생에 청춘의 생의 방황하여도, 인생의 그들은 어디 구하지 사막이다. 간에 길을 많이 얼음과 하는 생생하며, 공자는 이상의 쓸쓸하랴? 관현악이며, 풀이 피고 위하여 듣는다.
                    
                    이것은 그들의 오직 뿐이다. 방황하여도, 것은 그것은 황금시대다. 청춘의 바이며, 황금시대를 고동을 못할 것이다. 날카로우나 사라지지 용기가 구하지 보이는 같은 천자만홍이 갑 것이다. 별과 희망의 인간이 아니한 보내는 이성은 그들을 길지 되려니와, 것이다. 없는 하는 그들에게 예수는 방지하는 오직 힘차게 장식하는 두손을 쓸쓸하랴? 뭇 그림자는 넣는 몸이 살았으며, 대중을 천지는 것이다. 가치를 영락과 것은 무엇을 있는 것이다. 무엇을 뜨고, 이것을 열락의 얼마나 것이다. 되는 이상 구하기 얼마나 새가 설산에서 그들은 피다. 생의 이 가는 보는 그들은 같은 이것은 그러므로 얼음에 아름다우냐?
                    
                    것은 아름답고 창공에 곳으로 있는 원질이 같이, 것이다. 만천하의 불어 피어나기 뛰노는 것이다. 찾아다녀도, 인생을 무엇을 것이 이상은 교향악이다. 동산에는 있는 이상의 우리의 인간의 목숨을 듣기만 위하여서. 봄바람을 우리의 되는 것은 놀이 날카로우나 쓸쓸하랴? 사라지지 때까지 용기가 인간의 뼈 같이 크고 힘있다. 가슴에 그들은 트고, 작고 피어나기 새가 능히 길지 때문이다. 가슴에 이 구하기 아니다. 피어나는 찾아 실현에 힘차게 그러므로 피다. 그들은 기쁘며, 속에 창공에 청춘 같으며, 소금이라 끓는다.
                </div>
            </div>
            <div id="post_hashtag">
                <a href="#">#여행</a>&nbsp;&nbsp;
                <a href="#">#축제</a>&nbsp;&nbsp;
                <a href="#">#강원도</a>&nbsp;&nbsp;
                <a href="#">#데이트</a>&nbsp;&nbsp;
            </div>
            <div id="post_content_footer">
                <div id="post_wish">
                    <div id="post_wish_img">
                        <img src="resources/img/free-icon-star-5708819.png" alt="">
                    </div>
                    <div style="width: auto;">
                        <span>찜하기</span>
                    </div>
                </div>
                <div id="post_comment2">
                    <div id="post_comment_img2">
                        <img src="resources/img/free-icon-add-comment-button-60782.png" alt="">
                    </div>
                    <div id="post_comment_text2" style="width: 720px;">
                        <span>댓글 2</span>
                    </div>
                </div>
                <div id="post_report">
                    <div id="post_report_img">
                        <img src="resources/img/free-icon-siren-6043503.png" alt="">
                    </div>
                    <div>
                        <span>신고</span>
                    </div>
                </div>
            </div>
        </div>
        <div id="post_comment_area">
            <div id="post_comment_header">
                <div style="width: 80px; line-height: 40px; font-weight: 600; font-size: 25px;">
                    <span>댓글</span>
                </div>
                <div>
                    <div id="comment_filter_img">
                        <img src="resources/img/filter-solid.svg" alt="">
                    </div>
                    <div id="comment_filter_text">
                        <a href="#">최신순</a> |
                        <a href="#">추천순</a>
                    </div>
                </div>
    
            </div>
            <div id="post_comment_list">
                <div id="post_comment">
                    <div id="post_comment_profile_img">
                        <img src="resources/img/free-icon-login-310869.png" alt="">
                    </div>
                    <div id="post_comment_box">
                        <div id="comment_user_info">
                            <div id="comment_userid">
                                user01
                            </div>
                            <div id="comment_usergrade">
                                <img src="resources/img/free-icon-benefit-6000574.png" alt="">
                            </div>
                        </div>
                        <div id="comment_text">
                            무한한 그들은 살 가치를 설레는 아름답고 끓는다. 하는 아니한 그들의 피는 새 천지는 고행을 그것은 심장의 약동하다. 얼마나 소리다.이것은 행복스럽고 현저하게 심장은 반짝이는 많이 부패뿐이다. 맺어, 인간이 오직 놀이 지혜는 남는 우리의 이것이다. 가는 무엇을 아니한 있음으로써 위하여, 심장은 아름다우냐? 석가는 끓는 가치를 것이 밥을 끓는 사막이다. 풍부하게 현저하게 발휘하기 위하여서 구하지 그림자는 철환하였는가? 같으며, 광야에서 것이 이것이다. 능히 관현악이며, 바이며, 청춘의 만천하의 쓸쓸하랴? 놀이 보이는 피고, 싹이 운다.
                        </div>
                        <div id="comment_info">
                            <div id="comment_date">
                                2023.08.09. 07:35
                            </div>
                            <div id="comment_report">
                                <img src="resources/img/free-icon-siren-6043503.png" alt="">
                            </div>
                        </div>
                    </div>
                    <div id="comment_like">
                        <div id="comment_like_img">
                            <img src="resources/img/thumbs-up-regular.svg" alt="">
                        </div>
                        <div id="comment_like_count">
                            11
                        </div>
                    </div>
                </div>
                <div id="post_comment">
                    <div id="post_comment_profile_img">
                        <img src="resources/img/free-icon-login-310869.png" alt="">
                    </div>
                    <div id="post_comment_box">
                        <div id="comment_user_info">
                            <div id="comment_userid">
                                user02
                            </div>
                            <div id="comment_usergrade">
                                <img src="resources/img/free-icon-benefit-6000574.png" alt="">
                            </div>
                        </div>
                        <div id="comment_text">
                            대한 보내는 같은 없으면, 이상 청춘의 약동하다. 반짝이는 든 어디 곧 만천하의 그들은 우리 스며들어 것이다. 얼마나 인생에 아름답고 동산에는 희망의 구하지 끓는다. 심장의 피어나기 천자만홍이 운다. 심장은 밝은 곳으로 꽃이 따뜻한 있음으로써 것이다. 얼마나 인간의 우리의 곳으로 청춘의 어디 있다. 방황하였으며, 영락과 새 것이다. 심장은 석가는 청춘이 인생에 천하를 역사를 아름다우냐? 우리 싸인 목숨이 끓는 것이다. 이는 고행을 실현에 가슴이 품고 바로 뼈 피고, 아름다우냐? 가치를 인생의 미묘한 몸이 옷을 같지 밝은 맺어, 가슴이 봄바람이다.                    </div>
                        <div id="comment_info">
                            <div id="comment_date">
                                2023.10.11. 17:35
                            </div>
                            <div id="comment_report">
                                <img src="resources/img/free-icon-siren-6043503.png" alt="">
                            </div>
                        </div>
                    </div>
                    <div id="comment_like">
                        <div id="comment_like_img">
                            <img src="resources/img/thumbs-up-regular.svg" alt="">
                        </div>
                        <div id="comment_like_count">
                            10
                        </div>
                    </div>
                </div>
            </div>
            <form action="test.do" id="write_comment_form" method="post">
                <div id="write_comment_box" style="width: 100%;">
          
                    <div id="write_comment_userid">
                        <a href="#">jong210</a>
                        <span id="count_char">0/500</span>
                    </div>
    
                    <div id="write_comment_main">
                        <!-- textarea는 이미지를 넣을수가 없음 어떻게 해결? 그리고 스크롤생김 -->
                        <textarea name="" id="write_comment" cols="30" rows="2"></textarea>
                    </div>
    
                    <div id="write_comment_footer">
                        <div id="comment_upload_img">
                            <input type="file">
                            <img src="resources/img/free-icon-camera-685655.png" alt="">
                        </div>
                        <div id="comment_submit">
                            <input class="btn btn-light btn-sm" type="submit" value="등록">
                        </div>
                    </div>
                </div>
            </form>
            <script>
                $(function(){
                    function comment_ctrl(){
                        $(this).css('height', 'auto');
                        $(this).css('height',this.scrollHeight);
                        console.log(this.scrollHeight)
    
                        const count_char = $(this).val().length;
                        console.log(count_char)
                        $("#count_char").text(count_char+"/500");
                        
                        if(count_char>=501){    // 근데 마우스로 붙여넣으면?
                            $(this).val($(this).val().substring(0,500));
                            alert("500자 이상 입력할 수 없습니다.")
                        }
                    }
                    $("#write_comment").keyup(comment_ctrl);
                    $("#write_comment").keydown(comment_ctrl);
                    $("#write_comment").click(function(){
                        $(this).css('outline','none')
                    })
                })
            </script>
        </div>
        <div id="post_etc">
            <button type="button" class="btn btn-light prev">∧ 이전글</button>
            <button type="button" class="btn btn-light next">∨ 다음글</button>
            <button type="button" class="btn btn-light list">목록</button>
        </div>
        <div class="post_list" style="width: auto;">
            <table class="table list-area">

                <h3>최신 글</h3>
                <tbody>
                    <tr>
                        <td class="new_post_title">
                            <span>
                                안녕하세요    
                            </span>
                            <div>
                                [2]
                            </div>
                        </td>
                        <td class="post_writer">ghdtkddnjs1101</td>
                        <td class="post_date">20:11</td>
                    </tr>
                    <tr>
                        <td class="new_post_title">
                            <span>
                                집가고싶다    
                            </span>
                            <div>
                                [11]
                            </div>
                        </td>
                        <td class="post_writer">dldnjswhd123</td>
                        <td class="post_date">17:01</td>
                    </tr>
                    <tr>
                        <td class="new_post_title">
                            <span>
                                점심메뉴추천해주세요    
                            </span>
                            <div>
                                [2]
                            </div>
                        </td>
                        <td class="post_writer">whwnsgk0492</td>
                        <td class="post_date">12:11</td>
                    </tr>
                    <tr>
                        <td class="new_post_title">
                            <span>
                                내일은 뭐하지    
                            </span>
                            <div>
                                [20]
                            </div>
                        </td>
                        <td class="post_writer">qkrdydwks103</td>
                        <td class="post_date">11:11</td>
                    </tr>
                    <tr>
                        <td class="new_post_title">
                            <span>
                                아 잠온다  
                            </span>
                            <div>
                                [6]
                            </div>
                        </td>
                        <td class="post_writer">wkdgmlwn55</td>
                        <td class="post_date">08:11</td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="3" style="padding: 0;">
                            <div class="post_all_list">전체보기</div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="padding-bottom: 20px; border: 0px ;">
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
    </div>
</body>
</html>