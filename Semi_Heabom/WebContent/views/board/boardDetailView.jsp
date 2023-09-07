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

String contextPath1 = request.getContextPath();
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
	<link rel="stylesheet" href="<%= contextPath1 %>/views/board/css/boardDetailView.css" type="text/css">
</head>
<body>
	<%@ include file="../common/header.jsp"%>

	<div class="wrap">
		<div id="main-area">
			<div id="post_header">
				<div id="post_header">
					<div id="notice_category">
	
						<%
						if (boardNo.substring(0, 1).equals("F")) {
						%>
						<div>
							<a href="<%=contextPath%>/list.bo?cpage=1">자유게시판</a>
						</div>
						<%
						} else {
						%>
						<div>
							<img style="padding-bottom: 4px; margin-left: 4px; width: 20px;" src="<%=contextPath%>/resource/img/board/icon/notice.png">
							<a href="#" style="padding-right: 4px; font-size: 14px;">공지사항</a>
						</div>
						<%
						}
						%>
					</div>
					<div id="post_title">
						<span><%=b.getBoardTitle()%></span>
					</div>
					<div id="user_info">
						<div id="user_profile_img">
							<img src="" alt="">
						</div>
						<div id="user_id" style="font-size: 18px; font-weight: 800;">
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
						<div style="text-align: right;" class="post_comment">
							<img style="width: 20px;" src="<%= contextPath%>/resource/img/board/icon/reply.png"alt="">
							<span>댓글 <%=b.getCountReply()%></span>
						</div>
					</div>
				</div>
			</div>
			<hr style="border: 1px solid gray; width: 98%; margin-top: 0;">
			<div id="post_content">
				<div id="post_main">
					<div>
						<%=b.getBoardContent()%>
					</div>
				</div>
				<hr style="border: 1px solid lightgrey; width: 98%; margin-bottom: 0;">
				<div id="contentImg" style="height: auto">
					<span style="font-size: 18px; font-weight: 800;">첨부파일</span>
					<img style="height: 20px;" src="<%= contextPath%>/resource/img/board/icon/attachment.png" alt="">
					<br>
					<br>
					<%
					if (flist.isEmpty()) {
					%>
					사진없다잉
					<%
					} else {
					%>
					<%
					for (int i = 0; i < flist.size(); i++) {
					%>
					<img src="<%=contextPath%>/<%=flist.get(i).getFilePath()%>/<%=flist.get(i).getChangeName()%>" width="auto" height="150">
					<%
					}
					%>
					<%
					}
					%>
				</div>
				<hr style="border: 1px solid lightgrey; width: 98%; margin-bottom: 0;">
				<div id="post_hashtag" style="height: auto;">
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
				<hr style="border: 1px solid gray; width: 98%; margin-bottom: 5px;">

				<div id="post_content_footer">
					<!-- <div id="post_wish">
						<div id="post_wish_img">
							<img src="resources/img/free-icon-star-5708819.png">
						</div>
						<div style="width: auto;" onclick="Like('<%= boardNo %>')">
							<span>찜하기</span>
						</div>
					</div> -->
					<script>
						function Like(refNo){
							location.href ='like.co?refNo=' + refNo
						}
					</script>
					<div id="post_comment2">
						<img src="<%= contextPath%>/resource/img/board/icon/reply.png" alt="">
						<span id="slideComment">댓글보기 [<%=b.getCountReply()%>]</span>
					</div>
					<script>
						$(function(){
							$("#slideComment").click(function(){
								if($("#post_comment_area").css("display") == "none"){
									$("#post_comment_area").slideUp();
									$("#post_comment_area").slideDown();
								}else{
									$("#post_comment_area").slideUp();
								}
							})
						})
					</script>
					<div id="post_report" data-toggle="modal" data-target="#reportModal" style="text-align: right; padding-right: 10px;">
						<img src="<%= contextPath%>/resource/img/board/icon/report.png">
						<span>신고</span>
					</div>
				</div>
				<div id="post_comment_area">
				<!-- <div id="post_comment_area" style="display: none;"> -->

					<!-- <div id="post_comment_header">
		
						<div>
							<div id="comment_filter_img">
								<img src="resources/img/filter-solid.svg" alt="">
							</div>
							<div id="comment_filter_text">
								<a href="#">최신순</a> | <a href="#">추천순</a>
							</div>
						</div>
				
					</div> -->
				
				
					<div id="post_comment_list">
						<!-- 여기 댓글 창 -->
					</div>
					<script>
				
						$(function () {
							seq();
						})
						let likeList = "";
						async function seq() {
							selectlikeList();	// 좋아요한 리스트 불러오기
				
							const result = await selectReplyList1();	// 좋아요한 리스트와 지금 댓글 좋아요 했는지 비교
				
						};
				
						function selectlikeList() {
				
							$.ajax({
								url: "likelist.bo",
								type: "post",
								data: {
									mno: "<%= loginMember.getMemNo() %>"
								}, success: function (result) {
				
				
									console.log("좋아요한 리스트 불러오기 성공")
									console.log(result)
									console.log(likeList[1])
				
									likeList = result
								}
							})
						}
				
						function selectReplyList1() {
							return new Promise((resolve) => {
								setTimeout(() => {
									selectReplyList();
								}, 100);
							})
						};
				
				
				
						function selectReplyList() {
				
							$.ajax({
								url: "rlist.bo",
								type: "post",
								data: {
									bno: "<%= b.getBoardNo() %>"
								}, success: function (result) {
									console.log("에이작스 연결 성공")
				
									let html = "";
									$("#post_comment_list").html("");
									if (result.length == 0) {
										html += '<div style="border: none; background-color: white; font-size: large; height: 100px;">'
											+ '아직 등록된 댓글이 없습니다. 댓글을 작성해주세요.</div>';
				
									} else {
										for (let i = 0; i < result.length; i++) {
				
											html += `
													<div class="post_comment">
														<div class="post_comment_profile_img">
															<img src="<%= contextPath%>/resource/img/board/icon/profileImg.png" alt="">
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
																<div class="comment_date">`
																+result[i].replyDate + `
																</div>
																<div class="comment_report">
																	<img class="" src="resources/img/free-icon-siren-6043503.png" alt="">
																</div>
															</div>
														</div>
				
														<div class="comment_like">
															<div class="comment_like_img">`
				
														if (likeList.includes(result[i].replyNo)) {
															console.log("같다요")
															html += `<img src="<%=contextPath%>/resource/img/board/likeY.png" onclick="likedown(this)">`
														} else {
															console.log("다르다요")
															html += `<img src="<%=contextPath%>/resource/img/board/likeN.png" onclick="likeup(this);">`
														}
														html += `<input type="hidden" class="rpw"  value="` + result[i].replyWriter + `">
																<input type="hidden" class="rpno" value="`+ result[i].replyNo + `">
															</div>
															<div class="comment_like_count">`+
																result[i].replyLike + `
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
						function likedown(element) {
							console.log($(element).next().val())
							console.log($(element).next().next().val())
							console.log("여기는 likeDown")
							$.ajax({
								url: "likedown.bo",
								data: {
									writer: $(element).next().val()
									, rpno: $(element).next().next().val()
									, loginMem: "<%=loginMember.getMemNo()%>"
								}, //데이터 넘길때에는 무조건 중괄호 열어라
								//키 벨류 세트로 보내야한다 데이터는 긍까 객체 안에 객체네..
				
								type: "get", // 요청방식 지정
								success: function (result) { //성공시 응답 데이터가 자동으로 매개변수로 넘어온다
									console.log("킥킥")
									$(element).next().val(result);
									seq();
				
								},
								error: function () {
									console.log("ajax통신 실패!")
								}
							})
						}
				
						function likeup(element) {
							console.log($(element).next().val())
							console.log($(element).next().next().val())
							console.log("여기와")
							$.ajax({
								url: "likeup.bo",
								data: {
									writer: $(element).next().val()
									, rpno: $(element).next().next().val()
									, loginMem: "<%=loginMember.getMemNo()%>"
								}, //데이터 넘길때에는 무조건 중괄호 열어라
								//키 벨류 세트로 보내야한다 데이터는 긍까 객체 안에 객체네..
				
								type: "get", // 요청방식 지정
								success: function (result) { //성공시 응답 데이터가 자동으로 매개변수로 넘어온다
									console.log("킥킥")
									$(element).next().val(result);
									seq();
				
								},
								error: function () {
									console.log("ajax통신 실패!")
								}
							})
						}
					</script>
				
					<form action="insert.rp" id="write_comment_form" method="post">
						<input type="hidden" name="boardNo" value="<%=boardNo%>">
						<% if (loginMember !=null) { %>
							<input type="hidden" name="userNo" value="<%=loginMember.getMemNo()%>">
							<div id="write_comment_box" style="width: 100%;">
				
								<div id="write_comment_userid">
									<a href="#">
										<%=loginMember.getMemId()%>
									</a> <span id="count_char">0/500</span>
								</div>
				
								<div id="write_comment_main">
									<!-- textarea는 이미지를 넣을수가 없음 어떻게 해결? 그리고 스크롤생김 -->
									<textarea name="reply-content" id="write_comment" cols="30" rows="2"></textarea>
								</div>
				
								<div id="write_comment_footer">
									<div id="comment_upload_img">
										<input type="file" name="rfile" id="rfile"> <img src="resources/img/free-icon-camera-685655.png"
											alt="">
									</div>
									<div id="comment_submit">
										<input class="btn btn-light btn-sm" type="submit" value="등록">
									</div>
								</div>
							</div>
							<% } %>
					</form>
					<script>
						$(function () {
							function comment_ctrl() {
								$(this).css('height', 'auto');
								$(this).css('height', this.scrollHeight);
								console.log(this.scrollHeight)
				
								const count_char = $(this).val().length;
								console.log(count_char)
								$("#count_char").text(count_char + "/500");
				
								if (count_char >= 501) {    // 근데 마우스로 붙여넣으면?
									$(this).val($(this).val().substring(0, 500));
									alert("500자 이상 입력할 수 없습니다.")
								}
							}
							$("#write_comment").keyup(comment_ctrl);
							$("#write_comment").keydown(comment_ctrl);
							$("#write_comment").click(function () {
								$(this).css('outline', 'none')
							})
						})
				
				
					</script>
					
				</div>
				<hr style="border: 1px solid gray; width: 98%; margin-top: 0; margin-bottom: 5px;">
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

<!-- 모달시작 -->
<div class="modal" id = "reportModal" align="center">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">리뷰신고</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<form action="<%=contextPath1%>/insert2.rp" method="post">
				<input type="hidden" name="userId" value="">
				<b>부적절한 댓글 및 사용자에 대해서 신고를 할 수 있습니다.<br>
					아래의 신고 내용을 참고 해서 작성해 주세요<br><br> </b>
					<table class="reportForm" border="0">
						<tr>
							<th>신고대상:</th>
							<td><input type="text" id="xUser" name="xUser" value="<%=writer%>" readonly style="background-color: lightgray;"></td>
						</tr>
						<tr>
							<th>
								신고글:
							</th>
							<td>
								<textarea name="xContent" id="xContent" cols="30" rows="5" readonly style="background-color:lightgray; resize: none;"><%=boardContent%></textarea>
							</td>
						</tr>
						<input type="hidden" name="reNo" value="<%=boardNo%>">
						<input type="hidden" name="reporter" value="<%=loginMember.getMemNo()%>">
						<input type="hidden" name="reported" value="<%=b.getReportWriter()%>">
						<tr>
							<th>신고종류 : </th>
							<td>
								<input name="reprotTypeSelect" type="hidden" onclick="getReportType(event)" value="">
								<select name="reportType" id="reportType">
									<option value="비방">비방</option>
									<option value="불법광고">불법광고</option>
									<option value="허위게시글">허위게시글</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>신고내용 : </th>
							<td>
								<textarea name="reportContent" id="reportContent" cols="30" rows="5" style="resize: none;" minlength="1" required placeholder="신고내용은 신고종류에 맞게 작성해주세요. 부적절한 신고 내용은 신고자가 재제의 대상이 됩니다."></textarea>
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<p style="color: red; margin: 0; text-align: center;">무고한 신고는 신고자 계정이 재제 당할 수 있습니다.<input id="userReportCheck" type="checkbox" onclick="reportCheck();"></p>
							</th>
						</tr>
					</table>
					<br>
					<button type="button" id="thorwReport" class="btn btn-sm btn-danger" onclick="insertReport()" disabled>신고하기</button>
					<button type="submit" id="thorwReporter" style="display: none;"></button>
					<button type="reset" class="btn btn-sm btn-info">초기화</button>
				</form>
			</div>

		</div>
	</div>
</div>
</div>

<script>
    function reportCheck() {
        var checkbox = document.getElementById("userReportCheck");
        var reportButton = document.getElementById("thorwReport");

        if (checkbox.checked) {
            reportButton.removeAttribute("disabled");
        } else {
            reportButton.setAttribute("disabled", "disabled");
        }
    }
    
    function getReportType(event) {
        event.preventDefault();
        let reportSelect = $("#reportType option:selected").val();
        $("#reprotTypeSelect").val(reportSelect);
    }

    function insertReport(){
        $("#reprotTypeSelect").click();
        $("#thorwReporter").click();
    }
</script>
<%@include file="../common/footer.jsp"%>
</body>
</html>