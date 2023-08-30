<%@page import="java.lang.reflect.Field"%>
<%@page import="com.heabom.common.model.vo.File"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.heabom.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Board b = (Board)request.getAttribute("b");
	ArrayList<File> list = (ArrayList<File>)request.getAttribute("list");
	
	String boardNo = b.getBoardNo();
	String boardTitle = b.getBoardTitle();
	String writer = b.getWriter();
	String boardContent = b.getBoardContent();
	int boardCount = b.getBoardCount();
	String createDate = b.getCreateDate();
	String hashTag = b.getHashTagName();
	
%>
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
	<%@ include file= "../common/header.jsp" %>
	
    <div class="wrap">
        <div id="post_header">
            <div id="post_header">
                <div id="notice_category">
                <% System.out.println(boardNo.substring(0,1)+"ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ"); %>
               		<% if(boardNo.substring(0,1).equals("F")){ %>
                    	<a href="<%= contextPath %>/list.bo?cpage=1">자유게시판</a>
                    <% }else{ %>                    	
                    	<a href="#">공지사항</a>
                    <% } %>
                </div>
                <div id="post_title">
                    <span><%= b.getBoardTitle() %></span>
                </div>
                <div id="user_info">
                    <div id="user_profile_img">
                        <img src="resources/img/free-icon-login-310869.png" alt="">
                    </div>
                    <div id="user_id">
                        <span><%= b.getWriter() %></span>
                    </div>
                    <div id="user_grade">
                        <img src="resources/img/free-icon-benefit-6000574.png" alt="">
                    </div>
                </div>
                <div id="post_header_footer">
                    <div id="post_date">
                        <span><%= b.getCreateDate() %></span>
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
                    <%= b.getBoardContent() %>
                </div>
            </div>
            <div id="post_hashtag">
            <% String[] tagList = hashTag.split(","); %>
            <% for(String s : tagList){ %>
                <a href="#">#<%= s %></a>&nbsp;&nbsp;
            <% } %>
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