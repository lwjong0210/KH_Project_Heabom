<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"/>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
    div{border: 0px solid red;}
    .yj_place_area{
        width: 900px;
        height: auto;
        margin: auto;
        margin-top: 50px;
    }

    .yj_place_review{
        width: 900px;
        margin: auto;
        margin-top: 50px;
    }

    p{
        margin: 0;
    }

    .preview_detail{
        margin-bottom: 10px;
    }

    .reviewText{

        cursor: pointer;
    }

    .reviewText:hover{
        color: darkgray;
    }

</style>
</head>
<body>
<div class="yj_place_area" align="center">
    <form id="uploadForm" action="<%=contextPath%>/review.pl" id="enroll-form" method="post" enctype="multipart/form-data">
            <input type="file" id="file" name="file" style="display:none;">
            <div class="place_text" align="center">
                <textarea name="content" id="content" cols="118" rows="5" style="resize: none;" placeholder="해봄은 여러분의 소중한 리뷰를 기다리고 있습니다."></textarea>
            </div>
            <div class="text_btn" align="center" style="float: left; width: 900px;">
            <% if(loginMember != null) { %>
                <div class="options" align="center" style="text-align: right;">
                    <button type="button" id="uploadBtn">파일첨부</button>
                    <별점>
                    <input type="hidden" name="star" id="star">
                    <input type="hidden" name="refNo" id="refNo" value="">
                    <input type="hidden" name="writer" id="writer" value="<%=loginMember.getMemNo()%>">
                    <select name="starpoint" id="starpoint">
                            <option value="5" selected>5점</option>
                            <option value="4">4점</option>
                            <option value="3">3점</option>
                            <option value="2">2점</option>
                            <option value="1">1점</option>
                        </select>
                        <input type="hidden" id="getstar" onclick="getStar(event);">
                        <button type="button" class="btn btn-sm btn-info" onclick="insertReview();">리뷰등록</button>
                        <button class="btn btn-sm btn-danger" type="reset">초기화</button>
                </div>
            <% } %>
            </div>
        </form>
</div>
<div class="yj_place_review" align="center">
    <div class="preview">
        <table class="preview_detail" border="2">
            <tr>
                <td rowspan="2" width="80" height="80">
                	<div align="center">
						<% if(loginMember.getTitleImg().length() < 5) { %>
                        	<img src="<%=contextPath%>/resource/img/profile/기본이미지.png" id="viewTitleImg2" name="viewTitleImg" style="width: 75px; height: 75px; border-radius: 20px;">
                        <% } else { %>
                        	<img src="<%=contextPath%><%=loginMember.getTitleImg()%>" id="viewTitleImg2" name="viewTitleImg" style="width: 75px; height: 75px; border-radius: 20px;">
						<% } %>
					</div>
                </td>
                <td colspan="2">별점(★★★★★) 5</td>
            </tr>
            <tr>
                <td colspan="2">원종짱짱 | 23-09-01 | <a href="">신고</a></td>
            </tr>
            <tr>
                <td colspan="2" width="550">
                    <p class="reviewText">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Et, eum consequatur? Accusamus asperiores laboriosam dicta animi ipsa voluptas, quam dolor doloribus quidem atque delectus nihil ea, fuga molestiae tenetur quia.</p>
                    <div align="center" style="display:none;">
                        <img src="https://mp-seoul-image-production-s3.mangoplate.com/416559/181795_1638755840238_8421?fit=around|738:738&crop=738:738;*,*&output-format=jpg&output-quality=80" alt="" width="350" height="300">  
                    </div>
                </td>
                <td width="130" height="130">
                    <img src="https://mp-seoul-image-production-s3.mangoplate.com/416559/181795_1638755840238_8421?fit=around|738:738&crop=738:738;*,*&output-format=jpg&output-quality=80" alt="" width="130" height="130">  
                </td>
            </tr>
        </table>

        <table border="2">
            <tr>
                <td rowspan="2" width="80" height="80">
                	<div align="center">
						<% if(loginMember.getTitleImg().length() < 5) { %>
                        	<img src="<%=contextPath%>/resource/img/profile/기본이미지.png" id="viewTitleImg2" name="viewTitleImg" style="width: 75px; height: 75px; border-radius: 20px;">
                        <% } else { %>
                        	<img src="<%=contextPath%><%=loginMember.getTitleImg()%>" id="viewTitleImg2" name="viewTitleImg" style="width: 75px; height: 75px; border-radius: 20px;">
						<% } %>
					</div>
                </td>
                <td colspan="2">별점(★★★★★) 5</td>
            </tr>
            <tr>
                <td colspan="2">원종짱짱 | 23-09-01 | <a href="">신고</a></td>
            </tr>
            <tr>
                <td colspan="2" width="680" height="50">
                <p style="padding: 10px;">Lorem ipsum dolor sit amet consectetur adipisicing elit. Culpa odit iure nesciunt doloremque! Ipsa nihil, atque culpa id, sed, corrupti voluptatibus facilis recusandae magnam earum ad accusantium aut officia. Dignissimos!</p>
                </td>
            </tr>
        </table>
    </div>
</div>

<script>
$(function(){ 
    $("#uploadBtn").click(function(){
        $("#file").click();
    })
 
});

function uploadFile(){
    var form = $("#uploadForm")[0];
    var formData = new FormData(form);
    
    $.ajax({
        url:"review.pl",
        type:"post",
        data : formData,
        contentType : false,
        processData : false,
        success:function(){
            console.log("리뷰 사진 통신 성공!!!")
        },
        error:function(){
            console.log("리뷰 사진 통신 실패ㅠㅠ")
        }
    })
}

function getStar(event) {
    event.preventDefault();
    let star = $("#starpoint option:selected").val();
    $("#star").val(star);
}

function insertReview(){
    $("#getstar").click();
    uploadFile();


    var form = $("#uploadForm")[0];
    var formData = new FormData(form);
      
	$.ajax({
		url:"review.pl",
		data:{
			content:$("#content").val(),
			star:$("#star").val(),
			refNo:$("#refNo").val(),
			writer:$("#writer").val(),
            file:formData,
            contentType:false,
            processData:false
		},
		type:"post",
		success:function(result){
			console.log(result);
            console.log("리뷰작성 ajax 통신 성공!!!");
			if(result > 0){ // 댓글작성 성공! => 갱신된 댓글 리스트 조회
				selectReplyList(); // 한번더 불러줘서 갱신된 글을 불러 준다.
				$("#replyContent").val(""); // 정상적으로 입력했으면, 초기화 해준다.
			}
		},
		error:function(){
			console.log("리뷰작성 ajax 통신 실패 ㅠㅠ");
		}
			  
	})
}



</script>

</body>
</html>