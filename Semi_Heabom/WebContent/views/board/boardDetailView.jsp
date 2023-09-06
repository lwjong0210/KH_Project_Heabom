<%@page import="com.heabom.common.model.vo.PageInfo"%>
<%@page import="com.heabom.board.model.vo.PrevNextPage"%>
<%@page import="com.heabom.board.model.vo.Reply"%>
<%@page import="java.lang.reflect.Field"%>
<%@page import="com.heabom.common.model.vo.File"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.heabom.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Board b = (Board) request.getAttribute("b");
ArrayList<File> flist = (ArrayList<File>) request.getAttribute("flist");
ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
ArrayList<Reply> rlist = (ArrayList<Reply>) request.getAttribute("rlist");
PrevNextPage p = (PrevNextPage) request.getAttribute("p");

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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
div {
	/*border: 1px solid red;*/
	box-sizing: border-box;
}

.wrap {
	padding-top: 10px;
	width: 1000px;
	height: auto;
	margin: auto;
	background-color: rgb(249, 238, 238);
}

.wrap>div {
	width: 100%;
	margin: 10px 20px 20px 20px;
}

.btn-light {
	border: 1px solid gray;
}
/* 게시글 헤더 영역 */
#post_header {
	border: 1px solid gray;
	border-radius: 10px 10px 10px 10px;
	background-color: white;
	width: auto;
	height: 230px;
}

#post_header>div {
	width: 100%;
}

#notice_category {
	height: 50px;
}

#notice_category>a {
	text-decoration: none;
	color: black;
	font-size: 18px;
	font-weight: 400;
	line-height: 50px;
	padding-left: 10px;
}

#post_title {
	height: 100px;
	font-size: 32px;
	line-height: 100px;
	padding-left: 10px;
	padding-right: 10px;
	font-weight: 800;
}

#user_info {
	padding-left: 10px;
	width: 100%;
	height: 40px;
}

#user_info>div {
	float: left;
	height: 100%;
}

#user_info img {
	width: 100%;
	height: 100%;
}

#user_profile_img {
	width: 40px;
}

#user_id {
	width: auto;
	line-height: 40px;
	padding-left: 5px;
	font-size: 20px;
}

#user_grade {
	width: 40px;
}

#user_grade img {
	position: relative;
	top: 6px;
	height: 50%;
	width: 50%;
}

#post_header_footer {
	padding-left: 10px;
	width: 100%;
	height: 30px;
}

#post_header_footer>div {
	float: left;
	height: 100%;
}

#post_date {
	line-height: 25px;
	width: 70%;
}

.post_comment {
	width: 30%;
	line-height: 30px;
	padding-right: 1%;
}

.post_comment>div {
	padding-left: 5px;
	text-align: right;
	float: right;
	height: 100%;
}

.post_comment_img img {
	width: 80%;
	height: 80%;
}

.post_comment {
	line-height: 25px;
	font-size: 14px;
	font-weight: 600;
}
/* 게시글 헤더 영역 끝 */

/* 게시글 content 영역 */
#post_content {
	border: 1px solid gray;
	border-radius: 10px 10px 10px 10px;
	background-color: white;
	width: auto;
	height: auto;
}

#post_content>div {
	width: 100%;
}

#post_main {
	height: auto;
}

#post_main>* {
	padding: 50px 50px 100px 50px;
}

#post_main img {
	width: 100%;
}

#post_hashtag {
	padding-left: 10px;
	padding-right: 10px;
	height: 40px;
}

#post_hashtag>a {
	font-size: 20px;
	text-decoration: none;
	color: black;
	font-weight: 600;
	line-height: 40px;
}

#post_content_footer {
	border-top: 1px solid gray;
	padding-left: 10px;
	line-height: 35px;
	height: 40px;
}

#post_content_footer div {
	height: 100%;
	float: left;
}

#post_wish_img, #post_comment_img2, #post_report_img {
	text-align: center;
	line-height: 30px;
	width: 40px;
}

#post_content_footer img {
	height: 30px;
	width: 30px;
}

#post_content_footer span {
	font-size: 18px;
	font-weight: 800;
}
/* 게시글 content 영역  끝 */

/* 게시글 댓글 영역 */
#post_comment_area {
	height: auto;
	width: auto;
	/*border: 1px solid purple;*/
	border: 1px solid gray;
	border-radius: 10px 10px 10px 10px;
	background-color: white;
}

#post_comment_area>div {
	padding-left: 20px;
	padding-right: 20px;
}

#post_comment_header {
	width: 100%;
	height: 45px;
}

#post_comment_header>div {
	height: 100%;
}

#post_comment_header div {
	float: left;
}

#comment_filter_img {
	height: 100%;
	width: 40px;
	text-align: center;
	line-height: 35px;
}

#comment_filter_img img {
	height: 40%;
	width: 40%;
}

#comment_filter_text {
	width: auto;
	height: 100%;
	text-align: left;
	line-height: 35px;
}

#comment_filter_text>a {
	font-size: 12px;
	color: black;
	width: auto;
	text-decoration: none;
}

#post_comment_list {
	width: 100%;
	height: auto;
	/*border: 1px solid blue; */
	border-top: 1px solid gray;
}

#post_comment_list>div {
	border-radius: 10px 10px 10px 10px;
	background-color: lightgray;
	/*border: 1px solid green;*/
	border: 1px solid black;
	margin: 15px 0px 15px 0px;
	width: 100%;
	overflow: hidden;
}

.post_comment>div {
	float: left;
}

.post_comment_profile_img {
	padding-top: 10px;
	width: 4%;
	height: 100px;
}

.post_comment_profile_img img {
	width: 100%;
}

.post_comment_box {
	width: 92%;
	height: auto; /* 바꿔야됨 */
}

.post_comment_box>div>* {
	float: left;
}

.comment_user_info {
	height: 30px;
	width: 100%;
}

.comment_userid {
	padding-top: 3px;
	height: 100%;
	padding-left: 10px;
	font-size: 20px;
	font-weight: 600;
}

.comment_usergrade {
	width: 30px;
	height: 100%;
}

.comment_usergrade>img {
	padding-top: 40%;
	padding-right: 40%;
	float: left;
	height: 100%;
	width: 100%;
}

.comment_text {
	padding: 10px;
	width: 100%;
	height: auto;
}

.comment_info {
	height: 30px;
	width: 100%;
}

.comment_date {
	width: auto;
	height: 100%;
	font-size: 14px;
	padding-left: 10px;
	padding-right: 10px;
	color: rgb(58, 58, 58);
	font-weight: 600;
	line-height: 25px;
}

.comment_report {
	width: 30px;
	height: 100%;
	text-align: center;
}

.comment_report img {
	margin-bottom: 3px;
	width: 60%;
	height: 60%;
}

.comment_like {
	padding-top: 30px;
	width: 4%;
	height: 80px;
}

.comment_like>div {
	width: 100%;
}

.comment_like_img {
	height: 60%;
	text-align: center;
}

.comment_like_img img {
	width: 80%;
	height: 80%;
}

.comment_like_count {
	text-align: center;
	height: 40%;
	width: 100%;
}

#write_comment_form {
	padding: 0 20px 20px 20px;
}

#write_comment_box {
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

#write_comment_userid {
	height: 35px;
	width: 100%;
	padding-top: 3px;
	padding-left: 10px;
	font-size: 20px;
	font-weight: 600;
}

#write_comment_userid>a {
	text-decoration: none;
	color: black;
}

#write_comment_userid>span {
	padding-left: 85%;
	font-size: 14px;
}

#write_comment_main {
	width: 100%;
	height: auto;
}

#write_comment {
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

#write_comment_footer {
	height: 100%;
	overflow: hidden;
}

#write_comment_footer>div {
	float: left;
	height: 100%;
}

#comment_upload_img {
	width: 95%;
}

#comment_upload_img>input {
	position: relative;
	padding-left: 10px;
	width: 30px;
	height: 30px;
	opacity: 0;
	text-align: left;
	z-index: 10;
}

#comment_upload_img img {
	position: relative;
	left: -33px;
	top: 0px;
	height: 30px;
	width: 30px;
	z-index: 1;
}

#comment_submit {
	height: 100%;
	width: 5%;
}

#comment_submit>input {
	height: 30px;
	width: 100%;
}
/* 게시글 댓글 영역 끝 */

/* etc 영역 */
#post_etc {
	/*border: 1px solid red;*/
	width: auto;
	height: auto;
	text-align: right;
}
/* etc 영역 끝 */

/* postlist 영역 */
.post_list { /* 인라인으로는 되는데 왜 css에서는 안되는지 모르겠네*/
	width: auto;
}

.post_list>h3 {
	padding-left: 10px;
	font-weight: 600;
}

.list-area {
	margin: 0;
	padding: 0;
	width: 100%;
	height: auto;
}

.list-area>tbody>tr:hover {
	background-color: lightgray;
	cursor: pointer;
}

.new_post_title {
	width: 70%;
	height: 30px;
	padding-left: 10px;
}

.new_post_title>* {
	line-height: 30px;
	float: left;
	font-size: 14px;
}

.new_post_title>div {
	margin-left: 5px;
	height: 100%;
	color: red;
	font-weight: 600;
}

.post_writer {
	width: 20%;
}

.post_writer, .post_date {
	height: 100%;
	line-height: 30px;
	font-size: 14px;
}

.post_date {
	width: 10%;
	text-align: center;
}

tfoot>tr {
	width: 100%;
	height: auto;
}

.post_all_list {
	padding-top: 10px;
	margin-right: 10px;
	height: 30px;
	width: 60px;
	font-size: 14px;
	font-weight: 600;
	float: right;
}

.post_all_list:hover {
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
	font-weight: bold;
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
	<%@ include file="../common/header.jsp"%>

	<div class="wrap">
		<div id="post_header">
			<div id="post_header">
				<div id="notice_category">
					<%
					System.out.println(boardNo.substring(0, 1) + "ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ");
					%>
					<%
					if (boardNo.substring(0, 1).equals("F")) {
					%>
					<a href="<%=contextPath%>/list.bo?cpage=1">자유게시판</a>
					<%
					} else {
					%>
					<a href="#">공지사항</a>
					<%
					}
					%>
				</div>
				<div id="post_title">
					<span><%=b.getBoardTitle()%></span>
				</div>
				<div id="user_info">
					<div id="user_profile_img">
						<img src="resources/img/free-icon-login-310869.png" alt="">
					</div>
					<div id="user_id">
						<span><%=b.getWriter()%></span>
					</div>
					<div id="user_grade">
						<img src="resources/img/free-icon-benefit-6000574.png" alt="">
					</div>
				</div>
				<div id="post_header_footer">
					<div id="post_date">
						<span><%=b.getCreateDate()%></span>
					</div>
					<div class="post_comment">
						<div class="post_comment_text">
							<span>댓글 <%=b.getCountReply()%></span>
						</div>
						<div class="post_comment_img">
							<img src="resources/img/free-icon-add-comment-button-60782.png"
								alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="post_content">
			<div id="post_main">
				<div>
					<%=b.getBoardContent()%>
				</div>
			</div>
			<div id="post_hashtag">
				<%
				if (hashTag != null) {
				%>
				<%
				String[] tagList = hashTag.split(",");
				%>
				<%
				for (String s : tagList) {
				%>
				<a href="#">#<%=s%></a>&nbsp;&nbsp;

				<%
				}
				%>

				<%
				}
				%>
			</div>
			<div id="post_content_footer">
				<div id="post_wish">
					<div id="post_wish_img">
						<img src="resources/img/free-icon-star-5708819.png" alt="">
					</div>
					<div style="width: auto;" onclick="Like('<%= boardNo %>')">
						<span>찜하기</span>
					</div>
				</div>
				<script>
					function Like(refNo){
						location.href ='like.co?refNo=' + refNo
					}
				</script>
				<div id="post_comment2">
					<div id="post_comment_img2">
						<img src="resources/img/free-icon-add-comment-button-60782.png"
							alt="">
					</div>
					<div id="post_comment_text2" style="width: 720px;">
						<span>댓글 <%=b.getCountReply()%></span>
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
		<div style="height: auto">
			<%
			if (flist.isEmpty()) {
			%>
			사진없다잉
			<%
			} else {
			%>
			<%
			System.out.println("됨?ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ");
			%>
			<%
			for (int i = 0; i < flist.size(); i++) {
			%>
			<img
				src="<%=contextPath%>/<%=flist.get(i).getFilePath()%>/<%=flist.get(i).getChangeName()%>"
				width="auto" height="150">
			<%
			}
			%>
			<%
			}
			%>
		</div>
		<div id="post_comment_area">
			<div id="post_comment_header">
				<div
					style="width: 80px; line-height: 40px; font-weight: 600; font-size: 25px;">
					<span>댓글</span>
				</div>
				<div>
					<div id="comment_filter_img">
						<img src="resources/img/filter-solid.svg" alt="">
					</div>
					<div id="comment_filter_text">
						<a href="#">최신순</a> | <a href="#">추천순</a>
					</div>
				</div>

			</div>


			<div id="post_comment_list">
				<!-- 여기 댓글 창 -->
			</div>
			<script>
				$(function(){
					selectReplyList();
					
	
				})
			
				function selectReplyList(){
					 $.ajax({
					    	url:"rlist.bo",
					    	type:"post",
					    	data:{
					    		bno:"<%= b.getBoardNo() %>"
					    	},success:function(result){
					    		console.log("에이작스 연결 성공")
					    		
					    		let html ="";
					    		$("#post_comment_list").html("");
								if(result.length == 0){
									console.log(" 댓글없어요")
					    			html += '<div style="border: none; background-color: white; font-size: large; height: 100px;">'
									+ '아직 등록된 댓글이 없습니다.</div>';
									
								}else{
						    		for(let i=0; i<result.length; i++){
										
						    			html += `
						    				<div class="post_comment">
						    			    <div class="post_comment_profile_img">
						    			        <img src="resources/img/free-icon-login-310869.png" alt="">
						    			    </div>
						    			    <div class="post_comment_box">
						    			        <div class="comment_user_info">
						    			            <div class="comment_userid">
						    			                ` + result[i].replyWriter + `
						    			            </div>
						    			            <div class="comment_usergrade">
						    			                <img src="resources/img/free-icon-benefit-6000574.png" alt="">
						    			            </div>
						    			            <a href="<%=contextPath %>/delete.rp?bno=<%= b.getBoardNo() %>&rpno=` + result[i].replyNo + `" style="color: red; text-decoration: none; margin-left: 90%;">삭제</a>
						    			        </div>
						    			        <div class="comment_text">` +
						    			            result[i].replyContent + `
						    			        </div>
						    			        <div class="comment_info">
						    			            <div class="comment_date">` +
						    			                result[i].replyDate + `
						    			            </div>
						    			            <div class="comment_report">
						    			                <img class="likeUp" src="resources/img/free-icon-siren-6043503.png" alt="">
						    			            </div>
						    			        </div>
						    			    </div>

						    			        // 보드 디테일에 들어오기전에 로그인한 회원이 이 글에서 좋아요한 댓글 목록을 가져온다. if문 includes
						    			    <div class="comment_like">
						    			        <div class="comment_like_img">
						    			            <img src="<%=contextPath%>/resource/img/board/likeN.png" onclick="likeup(this);">
						    			            <input type="hidden" class="rpw"  value="`+ result[i].replyWriter + `">
						    			            <input type="hidden" class="rpno" value="`+ result[i].replyNo + `">
						    			        </div>
						    			        <div class="comment_like_count">`+
						    			            result[i].replyLike+ `
						    			        </div>
						    			    </div>
						    			</div>`
									
						    		}
									
								}
					    			
								

								
					    		

					    	$("#post_comment_list").html(html)
					    	}
				})
}
			</script>

			<script>
				function likeup(element){
					console.log($(element).next().val())
					console.log($(element).next().next().val())
					console.log("여기와")
					    $(element).attr('src',"<%=contextPath%>/resource/img/board/likeY.png")
					$.ajax({
					 url : "likeup.bo",
	                    data : {
	                    		writer : $(element).next().val() 
	                    	  , rpno: $(element).next().next().val()
	                    	  , loginMem : "<%=loginMember.getMemNo()%>"
	                    	 }, //데이터 넘길때에는 무조건 중괄호 열어라
	                    //키 벨류 세트로 보내야한다 데이터는 긍까 객체 안에 객체네..

	                    type : "get", // 요청방식 지정
	                    success : function(result){ //성공시 응답 데이터가 자동으로 매개변수로 넘어온다
							console.log("킥킥")
							$(element).next().val(result);
							selectReplyList();
	                    
						},
	                    error : function(){
	                        console.log("ajax통신 실패!")
	                    }
					})
			    }
			</script>

			<form action="insert.rp" id="write_comment_form" method="post">
				<input type="hidden" name="boardNo" value="<%=boardNo%>">
				<%
				if (loginMember != null) {
				%>
				<input type="hidden" name="userNo"
					value="<%=loginMember.getMemNo()%>">
				<div id="write_comment_box" style="width: 100%;">

					<div id="write_comment_userid">
						<a href="#"><%=loginMember.getMemId()%></a> <span id="count_char">0/500</span>
					</div>

					<div id="write_comment_main">
						<!-- textarea는 이미지를 넣을수가 없음 어떻게 해결? 그리고 스크롤생김 -->
						<textarea name="reply-content" id="write_comment" cols="30"
							rows="2"></textarea>
					</div>

					<div id="write_comment_footer">
						<div id="comment_upload_img">
							<input type="file" name="rfile" id="rfile"> <img
								src="resources/img/free-icon-camera-685655.png" alt="">
						</div>
						<div id="comment_submit">
							<input class="btn btn-light btn-sm" type="submit" value="등록">
						</div>
					</div>
				</div>
				<%
				}
				%>
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
		<div align="right" id="delete-update-area" style="width: auto;">
			<%
			if (loginMember != null && loginMember.getMemId().equals(b.getWriter())) {
			%>
			<a href="<%=contextPath%>/updateForm.bo?bno=<%=boardNo%>"
				class="btn btn-sm btn-warning">수정하기</a> <a
				onclick="deleteConfirm();" class="btn btn-sm btn-danger">삭제하기</a>

			<%
			}
			%>
			<script>
					function deleteConfirm(){
						if(confirm("정말로 이 게시글을 삭제하시겠습니까?")){
							location.href= href="<%=contextPath%>/deleteForm.bo?bno=<%=b.getBoardNo()%>"
						}
					}
				</script>
		</div>
		<div id="post_etc">
			<a type="button" class="btn btn-light prev"
				href="<%=contextPath%>/detail.bo?bno=<%=p.getPrevPage()%>">∧ 이전글</a>
			<a type="button" class="btn btn-light next"
				href="<%=contextPath%>/detail.bo?bno=<%=p.getNextPage()%>">∨ 다음글</a>
			<a type="button" class="btn btn-light list"
				href="<%=contextPath%>/list.bo?cpage=1">목록</a>
		</div>
		<div class="post_list" style="width: auto;">

			<input type="hidden" id="cpage3" value="1">



			<!-- 여기에 들어감 -->

			<table id="dataTableBody" style="width: 100%">

			</table>
			<br>
			<ul class="page-item"></ul>

		</div>
	</div>










	<script>
	let listCount; // 현재 총 게시글 개수
	let currentPage = 1; //현재 페이지
	let pageLimit= 10; //  하단에 보여지는 페이징바의 최대개수	
	let boardLimit = 10; // 한 페이지내에 보여질 게시글 최대개수
	
	let maxPage ; // 가장마지막 페이지
	let startPage; // 페이징바의 시작수
	let endPage; // 페이징바의 끝 수
	
	let boardList; //표시하려하는 데이터 리스트

		$(function(){
			
	
			 
			 $.ajax({ 
				url: "pageNation.bo",
				success: function (plist) {
			        boardList= JSON.parse(plist);
				   	listCount = boardList.length;
			           console.log(listCount + "!!!!");
                       	maxPage = Math.ceil(listCount / boardLimit);
                       	startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
                		endPage = startPage + pageLimit - 1;

                        boardListView(1, boardLimit);
                		if(endPage > maxPage) {
                			endPage = maxPage;
                		};
                        
                        pagingBar(listCount, boardLimit, pageLimit, 1);
				}
			 });
			 
			})
			function boardListView(currentPage, boardLimit) {
			console.log(currentPage+ "aaaa" + boardLimit)
			  let chartHtml = "";

			currentPage = Number(currentPage);
			boardLimit = Number(boardLimit);
			let charTitleHtml = 
			"<tr><th style='width: 8%;'>글번호</th>"+
	    	"<th style='width: 57%;'>제목</th>"+
	    	"<th style='width: 10%;'>작성자</th>"+
	    	"<th style='width: 10%;'>조회수</th>"+
	    	"<th style='width: 15%;'>작성일</th></tr>"
            ;
			// 총게시글 78개, 1페이지 인덱스 0 ~ 9 , 2페이지 인덱스 10 ~ 19, ..., 8페이지 인덱스 70 ~ 77
			if(currentPage == maxPage){
				  for (var i = (currentPage - 1) * boardLimit; i < (currentPage - 1) * boardLimit + (listCount % boardLimit) ;
				    i++
				  ) {
					  
		
					  console.log(boardList[i]);
					    chartHtml +=
					      "<tr class='boardTr'><td>" +
					      boardList[i].boardNo.substr(1) +
					      "</td><td>" +
					      boardList[i].boardTitle +
					      "</td><td>" +
					      boardList[i].writer +
					      "</td><td>" +
					      boardList[i].boardCount +
					      "</td><td>" +
					      boardList[i].createDate +
					      "</td></tr>";
				  }
			}else{
	
			  for (var i = (currentPage - 1) * boardLimit; i < (currentPage - 1) * boardLimit + boardLimit;
			    i++
			  ) {
				  
	
				  console.log(boardList[i]);
				    chartHtml +=           

				      "<tr class='boardTr'><td>" +
				      boardList[i].boardNo.substr(1) +
				      "</td><td>" +
				      boardList[i].boardTitle +
				      "</td><td>" +
				      boardList[i].writer +
				      "</td><td>" +
				      boardList[i].boardCount +
				      "</td><td>" +
				      boardList[i].createDate +
				      "</td></tr>";
			  }
			  }
				  $("#dataTableBody").html(charTitleHtml+chartHtml);
					
					$("#dataTableBody tr").click(function () {
						console.log("크,ㄹ릭!!!")
						console.log($(this).children().eq(0).text())
						location.href='<%=contextPath%>/detail.bo?bno=' + $(this).children().eq(0).text()

					})
	}
			 
			
		
		function pagingBar(listCount, boardLimit, pageLimit, currentPage) {
			console.log("pageLimit"+pageLimit)
			  console.log("currentPage : " + currentPage);


			  let pageGroup = Math.ceil(currentPage / pageLimit); // 페이지 그룹

			  let pageHtml = "";

			  if (currentPage > 1) {
			    pageHtml += "<li><a href='#' id='prev'> 이전 </a></li>";
			  }

			 //페이징 번호 표시 
			  for (var i = startPage; i <= endPage; i++) {
				  console.log(endPage + "ep");
				  console.log(startPage + "sp");
			    if (currentPage == i) {
			      pageHtml +=
			        "<li class='on' style='background-color: black'><a href='#' id='" + i + "'>" + i + "</a></li>";
			    } else {
			      pageHtml += "<li><a href='#' id='" + i + "'>" + i + "</a></li>";
			    }
			  }

			  if (currentPage != maxPage) {
			    pageHtml += "<li><a href='#' id='next'> 다음 </a></li>";
			  }

			  $(".page-item").html(pageHtml);


			  //페이징 번호 클릭 이벤트 
			  $(".page-item li a").click(function () {
			    let $id = $(this).attr("id");
			    selectedPage = $(this).text();

			    if ($id == "next") {
			    	selectedPage = currentPage + 1;
			    }
			    if ($id == "prev") {
			    	selectedPage = currentPage - 1;
			    }
			    
			    currentPage = selectedPage;
			    console.log(currentPage)
			    pagingBar(listCount, boardLimit, pageLimit, selectedPage);
			    boardListView(selectedPage, boardLimit);
			  });
			}
			
	</script>
</body>
</html>