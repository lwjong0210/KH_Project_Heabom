<%@page import="com.heabom.place.model.vo.Place"%>
<%@page import="com.heabom.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath1 = request.getContextPath();
	Member loginMember1 =  (Member)session.getAttribute("loginMember");
%>      
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
    <form id="uploadForm" action="<%=contextPath1%>/review.pl" id="enroll-form" method="post" enctype="multipart/form-data">
            <input type="file" id="file" name="file" style="display:none;">
            <div class="place_text" align="center">
                <textarea name="content" id="content" cols="118" rows="5" style="resize: none;" placeholder="해봄은 여러분의 소중한 리뷰를 기다리고 있습니다."></textarea>
            </div>
            <div class="text_btn" align="center" style="float: left; width: 900px;">
            <% if(loginMember1 != null) { %>
                <div class="options" align="center" style="text-align: right;">
                    <button type="button" id="uploadBtn">파일첨부</button>
                    &lt; 별점 &gt;
                    <input type="hidden" name="star" id="star">
                    <input type="hidden" name="refNo" id="refNo" value="<%=place.getPlaceNo()%>">
                    <input type="hidden" name="writer" id="writer" value="<%=loginMember1.getMemNo()%>">
                    <select name="starpoint" id="starpoint">
                            <option value="5" selected>5점</option>
                            <option value="4">4점</option>
                            <option value="3">3점</option>
                            <option value="2">2점</option>
                            <option value="1">1점</option>
                        </select>
                        <input type="hidden" id="getstar" onclick="getStar(event);">
                        <button type="button" class="btn btn-sm btn-info" onclick="insertReview();">리뷰등록</button>
                        <button class="btn btn-sm btn-danger" id="allreset" type="reset">초기화</button>
                </div>
            <% } %>
            </div>
        </form>
</div>
<div class="yj_place_review" align="center">
    <div class="preview">

    </div>
</div>

<script>
$(function(){ 
	selectReplyList();
	setInterval(selectReplyList, 100000);
    $("#uploadBtn").click(function(){
        $("#file").click();
    })
    
    $(document).on('click','.reviewText',function(){
    $(this).next().css("display","")
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
    });
}

function getStar(event) {
    event.preventDefault();
    let star = $("#starpoint option:selected").val();
    $("#star").val(star);
}



function selectReplyList(){
    $.ajax({
    	url:"rlist.pl",
    	type:"post",
    	data:{
    		pNo:$("#refNo").val()
    	},
        success:function(list){
        	console.log(list);
            console.log("ajax 리뷰조회 성공 !!!")
            let result = "";
            $(".preview").html("");
            for(let i=0; i<list.length; i++){
                result += `<table class="preview_detail" border="2">
			                <tr>
			                    <td rowspan="2" width="80" height="80">
			                    	<div align="center">`
			                    	if(list[i].userImgPath && list[i].userImgPath.length < 5) {
			    						result +=	`<img src="<%=contextPath1%>/resource/img/profile/기본이미지.png" name="viewTitleImg" style="width: 75px; height: 75px; border-radius: 20px;">`
			                            } else {
			                            result += 	`<img src="<%=contextPath1%>/\${list[i].userImgPath}" name="viewTitleImg" style="width: 75px; height: 75px; border-radius: 20px;">`
			    						}
			    						result += `</div>
			                    </td>
			                    <td colspan="2">
			                    별점(`
			                    	for(let j = 0; j<list[i].reRefStar; j++) { 
			                    	result += `⭐`
			                    	}
			                    	result += `)\${list[i].reRefStar}
			                    </td>
			                </tr>
			                <tr>
			                    <td colspan="2">\${list[i].nickname} | \${list[i].reDate} | <a href="" data-toggle="modal" data-target="#reportModal">신고</a></td>
			                </tr>`
			                if( list[i].imgPath != "/") {
			                result +=  `<tr>
			                    <td colspan="2" width="550">
			                        <p class="reviewText"> \${list[i].reContent}</p>
			                        <div class="noneImg" align="center" style="display:none">
			                            <img src="<%=contextPath1%>/\${list[i].imgPath}" alt="" width="350" height="300">  
			                        </div>
			                    </td>
			                    <td width="130" height="130">
			                        <img src="<%=contextPath1%>/\${list[i].imgPath}" alt="" width="130" height="130">  
			                    </td>
			                </tr>
			            </table>`
			            
			            } else {
			            result += `<tr>
			                    <td colspan="2" width="680" height="50">
			                    <p style="padding: 10px;"> \${list[i].reContent} </p>
			                    </td>
			                </tr>
			            </table>`
			            }                        
            }
            $(".preview").html(result);
        },
        error:function(){
            console.log("ajax 리뷰죠회 실패 ㅠㅠ")
        }
    })
}

// 등록 및 동기화
async function insertReview() {
	insertReview1();
    const result = await selectReplyList1();
};

function selectReplyList1(){
    return new Promise((resolve) => {
        setTimeout(() => {
            selectReplyList();
        }, 100);
    })
};


function insertReview1(){
    $("#getstar").click();
    uploadFile();

    var form = $("#uploadForm")[0];
    var formData = new FormData(form);
    
    console.log(form)
    console.log(formData)
      
	$.ajax({
		url:"review.pl",
		data:{
			content:$("#content").val(),
			star:$("#star").val(),
			refNo:$("#refNo").val(),
			writer:$("#writer").val(),
            file:formData,
		},
		contentType:false,
        processData:false,
		type:"post",
		success:function(result){
				// 한번더 불러줘서 갱신된 글을 불러 준다.
			console.log(result);
            console.log("리뷰작성 ajax 통신 성공!!!");
            $("#content").val("");
             
			if(result > 0){ // 댓글작성 성공! => 갱신된 댓글 리스트 조회
				$("#allreset").click(); // 정상적으로 입력했으면, 초기화 해준다.
			}else{
				console.log("result 문제발생!!!!");	
			}
			
		},
		error:function(){
			console.log("리뷰작성 ajax 통신 실패 ㅠㅠ");
		}
			  
	})
}


</script>

<!-- 신고용 Modal -->
<div class="modal" id="reportModal" align="center">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">리뷰신고</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <form action="#" method="post">
                <input type="hidden" name="userId" value="">
                    <b>부적절한 댓글 및 사용자에 대해서 신고를 할 수 있습니다.<br>
                    아래의 신고 내용을 참고 해서 작성해 주세요<br><br> </b>

                    비밀번호 : <input type="password" name="userPwd" required> <br><br>
                    <button type="submit" class="btn btn-sm btn-danger" onclick="vaildateStatus()">탈퇴하기</button>
                </form>
            </div>

        </div>
    </div>
</div>

</body>
</html>