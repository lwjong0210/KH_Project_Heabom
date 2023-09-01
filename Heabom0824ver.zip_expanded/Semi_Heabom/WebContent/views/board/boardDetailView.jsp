<%@page import="com.heabom.board.model.vo.PrevNextPage"%>
<%@page import="com.heabom.board.model.vo.Reply"%>
<%@page import="java.lang.reflect.Field"%>
<%@page import="com.heabom.common.model.vo.File"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.heabom.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Board b = (Board)request.getAttribute("b");
	ArrayList<File> list = (ArrayList<File>)request.getAttribute("list");
	ArrayList<Reply> rlist = (ArrayList<Reply>)request.getAttribute("rlist");
	PrevNextPage p = (PrevNextPage)request.getAttribute("p");
	
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
        .post_comment>div{
            float: left;
        }
        .post_comment_profile_img{
            padding-top: 10px;
            width: 4%;
            height: 100px;
        }
        .post_comment_profile_img img{
            width: 100%;
        }
        .post_comment_box{
            width: 92%;
            height: auto; /* 바꿔야됨 */
        }
        .post_comment_box>div>*{
            float: left;
        }
        .comment_user_info{
            height: 30px;
            width: 100%;
        }
        .comment_userid{
            padding-top: 3px;
            height: 100%;
            padding-left: 10px;
            font-size: 20px;
            font-weight: 600;
        }
        .comment_usergrade{
            width: 30px;
            height: 100%;
        }
        .comment_usergrade >img{
            padding-top: 40%;
            padding-right: 40%;
            float: left;
            height: 100%;
            width: 100%;
        }
        .comment_text{
            padding: 10px;
            width: 100%;
            height: auto;
        }
        .comment_info{
            height: 30px;
            width: 100%;
        }
        .comment_date{
            width: auto;
            height: 100%;
            font-size: 14px;
            padding-left: 10px;
            padding-right: 10px;
            color: rgb(58, 58, 58);
            font-weight: 600;
            line-height: 25px;
        }
        .comment_report{
            width: 30px;
            height: 100%;
            text-align: center;
        }
        .comment_report img{
            margin-bottom: 3px;
            width: 60%;
            height: 60%;
        }
        .comment_like{
            padding-top: 30px;
            width: 4%;
            height: 80px;
        }
        .comment_like>div{
            width: 100%;
        }
        .comment_like_img{
            height: 60%;
            text-align: center;
        }
        .comment_like_img img{
            width: 80%;
            height: 80%;
        }
        .comment_like_count{
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
            padding-left: 85%;
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
                            <span>댓글 <%= b.getCountReply() %></span>
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
            <% if(hashTag != null){ %>
	            <% String[] tagList = hashTag.split(","); %>
	            <% for(String s : tagList){ %>
	                <a href="#">#<%= s %></a>&nbsp;&nbsp;
            
            <% } %>
            
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
                        <span>댓글 <%= b.getCountReply() %></span>
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
            	<% System.out.println("진짜 이게 안됨?" + rlist); %>
            	<% if(rlist.isEmpty()){ %>
					<div style="border: none; background-color: white; font-size: large; height: 100px;">
						아직 등록된 댓글이 없습니다.
					</div>
            	<% }else{ %>
            			<% for(Reply r : rlist){ %>
            			
	                <div class="post_comment">
	                    <div class="post_comment_profile_img">
	                        <img src="resources/img/free-icon-login-310869.png" alt="">
	                    </div>
	                    <div class="post_comment_box">
	                        <div class="comment_user_info">
	                            <div class="comment_userid">
	                                <%= r.getReplyWriter() %>
	                            </div>
	                            <div class="comment_usergrade">
	                                <img src="resources/img/free-icon-benefit-6000574.png" alt="">
	                            </div>
	                        </div>
	                        <div class="comment_text">
									<%= r.getReplyContent() %>
	                        </div>
	                        <div class="comment_info">
	                            <div class="comment_date">
	                                <%= r.getReplyDate() %>
	                            </div>
	                            <div class="comment_report">
	                                <img src="resources/img/free-icon-siren-6043503.png" alt="">
	                            </div>
	                        </div>
	                    </div>
	                    <div class="comment_like">
	                        <div class="comment_like_img">
	                            <img src="resources/img/thumbs-up-regular.svg" alt="">
	                        </div>
	                        <div class="comment_like_count">
	                            <%= r.getReplyLike() %>
	                        </div>
	                    </div>
	                </div>
            			<% } %>
        		<% } %>

            </div>
            <form action="insert.rp" id="write_comment_form" method="post">
            	<input type="hidden" name="boardNo" value="<%= boardNo %>">
                <% if(loginMember != null){ %>
            	<input type="hidden" name="userNo" value="<%= loginMember.getMemNo()%>">
                <div id="write_comment_box" style="width: 100%;">
          		
                    <div id="write_comment_userid">
                        <a href="#"><%= loginMember.getMemId() %></a>
                        <span id="count_char">0/500</span>
                    </div>	
    
                    <div id="write_comment_main">
                        <!-- textarea는 이미지를 넣을수가 없음 어떻게 해결? 그리고 스크롤생김 -->
                        <textarea name="reply-content" id="write_comment" cols="30" rows="2"></textarea>
                    </div>
    
                    <div id="write_comment_footer">
                        <div id="comment_upload_img">
                            <input type="file" name="rfile" id="rfile">
                            <img src="resources/img/free-icon-camera-685655.png" alt="">
                        </div>
                        <div id="comment_submit">
                            <input class="btn btn-light btn-sm" type="submit" value="등록">
                        </div>
                    </div>
                </div>
                <% } %>
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
            <a type="button" class="btn btn-light prev" href="<%= contextPath %>/detail.bo?bno=<%= p.getPrevPage() %>">∧ 이전글</a>
            <a type="button" class="btn btn-light next" href="<%= contextPath %>/detail.bo?bno=<%= p.getNextPage() %>">∨ 다음글</a>
            <a type="button" class="btn btn-light list" href="<%= contextPath %>/list.bo?cpage=1">목록</a>
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