<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@page import="com.heabom.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member loginMember =  (Member)session.getAttribute("loginMember");
	String contextPath = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Document</title>

    <style>
        /* 여기서부터 프로필 수정 */
        .prop_setting{
            margin-top: 10px;
            border-radius: 20px;
            background-color: white;
            width: 533px;
            height: auto;
            padding-bottom: 10px;
            margin-left: 266px;
        }

        .detail_title{
            text-align: right;
            font-weight: bolder;
            font-size: small;
            height: 60px;
            background-color: rgb(216, 216, 216);
        }

        .prop_detail input {
            border-radius: 5px;
            width: 230px;
            
        } 

        .prop_detail p {
            margin: -1px;
        }

    </style>
</head>
<body>
<%
	String userId = loginMember.getMemId();
	String userPwd = loginMember.getMemPwd();
	String userName = loginMember.getMemName();
	String userPhone = loginMember.getMemPhone();
	String userNickname = loginMember.getNickname();
	String userEmail = (loginMember.getEmail() == null) ? "" : loginMember.getEmail();
	String userMbti = (loginMember.getMbit() == null) ? "" : loginMember.getMbit();
	String userBirth = (loginMember.getMemBirthday() == null) ? "1111-11-11" : loginMember.getMemBirthday();
	String[] userBirthList = userBirth.split("-");
	String userGrade = loginMember.getGrade();
	int userPoint = loginMember.getMemPoint();
%>
        <div class="prop_setting">
            <br>
            <form action="">
                <table border="1" class="prop_detail" style="margin-bottom: 10px;">
                    <tr>
                        <td class="detail_title" width="100">아이디<label for="" style="color:hotpink">&nbsp★&nbsp</label></td>
                        <td width="245">
                            <input type="text" readonly style="background-color: lightgray;" value="<%=userId%>">
                            <br><p style="font-size: smaller; color: red;"><strong>&nbsp* 아이디는 수정 불가 사항입니다.</strong></p></td>
                        <td rowspan="2" width="120">사진미리보기</td>
                    </tr>
                    <tr>
                        <td class="detail_title">비밀번호<label for="" style="color:hotpink">&nbsp★&nbsp</label></td>
                        <td><input type="password" id="updatePwd" value="<%=userPwd%>"></td>
                    </tr>
                    <tr>
                        <td class="detail_title">비밀번호확인&nbsp</td>
                        <td><input id="checkPwd" type="password"><br><p style="font-size: smaller; color: green;"><strong>&nbsp* 비밀번호 변경시 작성해주세요</strong></p></td></td>
                        <td class="detail_title" style="text-align: center;">대표사진</td>
                    </tr>
                    <tr>
                        <td class="detail_title">이&nbsp&nbsp&nbsp름&nbsp</td>
                        <td><input type="text" placeholder="ex)홍길동" readonly style="background-color: lightgray;" value="<%=userName%>"></td>
                        <td class="" rowspan="2" style="text-align: center; font-size: smaller;">
                            <p style="color: blue;"><strong>사진은 최대 10Mbyte를</strong></p>
                            <p style="margin-bottom: 5px;">넘을수 없습니다.</p>
                            <p style="color: blue;"><strong>사진 규격은 125*125를</strong></p>
                            <p>권장합니다.</p>
                        </td>
                    </tr>
                    <tr>
                        <td class="detail_title">이메일&nbsp</td>
                        <td><input type="email" placeholder="ex)해봄@SunSpring.com" maxlength="30" value="<%=userEmail%>"></td>
                    </tr>
                    <tr>
                        <td class="detail_title">MBTI&nbsp</td>
                        <td colspan="2"><input type="text" placeholder="ex)ESFJ(최대4글자)" maxlength="4" value="<%=userMbti%>"></td>
                    </tr>
                    <tr>
                        <td class="detail_title" colspan="">휴대폰번호<label for="" style="color:hotpink">&nbsp★&nbsp</label></td>
                        <td colspan="2"><input type="text" placeholder="ex)010-1234-5678" minlength="13" maxlength="13" value="<%=userPhone%>"><p style="font-size: smaller; color: green;"><strong>&nbsp* 010-1234-5678과 같이 13자로 작성해주세요</strong></p></td>
                    </tr>
                    <tr>
                        <td class="detail_title" colspan="">닉네임<label for="" style="color:hotpink">&nbsp★&nbsp</label></td>
                        <td colspan="2"><input type="text" placeholder="ex)동해번쩍서해번쩍" value="<%=userNickname%>"></td>
                    </tr>
                    <tr>
                        <td class="detail_title">생년월일&nbsp</td>
                        <td colspan="2">
                            <select id="yearDropdown"><%=userBirthList[0] %></select>
                            <select id="monthDropdown"><%=userBirthList[1] %></select>
                            <select id="dateDropdown"><%=userBirthList[2] %></select>
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="detail_title">등급 및 포인트&nbsp</td>
                        <td colspan="2">
                            <input type="number" style="width: 100px; background-color: lightgray;" readonly value="<%=userPoint%>">
                            <input type="text" style="width: 100px; background-color: lightgray;" readonly value="<%=userGrade%>">
                            <p style="font-size: smaller; color: green;"><strong>&nbsp* 획득한 포인트에 대한 등급입니다.</strong></p>
                        </td>
                    </tr>
                    <tr>
                        <td class="detail_title">대표사진변경&nbsp</td>
                        <td colspan="2"><input type="file"></td>
                    </tr>
                </table>
                <input type="submit" class="btn btn-sm btn-success style="background-color: pink; border: 1;" value="정보변경" onclick="return vaildatePwd();">
                <a href="<%=contextPath%>/myPage.me" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#updatePwdModal">비밀번호변경</a>
                <!--<button type="button" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#updatePwdModal">비밀번호변경</button>-->
                <a href="<%=contextPath%>/myPage.me" class="btn btn-sm btn-warning">취소</a>
                <button type="button" class="btn btn-sm btn-danger"data-toggle="modal" data-target="#deleteModal">회원탈퇴</button>
            </div>
        </td>
    </tr>
</table>
</form>
<br><br>
        </div>
    </div>
    
    
    <!-- 비밀번호 변경용 Modal -->
	<div class="modal" id="updatePwdModal" align="center">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">비밀번호 변경</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
                    <form action="<%= contextPath %>/updatePwd.me" method="post">
                    	<input type="hidden" name="userId" value="<%= userId %>">
                        <table>
                            <tr>
                                <td>현재 비밀번호</td>
                                <td><input type="text" name="userPwd" required></td>
                            </tr>
                            <tr>
                                <td>변경할 비밀번호</td>
                                <td><input type="text" name="updatePwd" required></td>
                            </tr>
                            <tr>
                                <td>변경할 비밀번호 확인</td>
                                <td><input type="text" name="checkPwd" required></td>
                            </tr>
                        </table>
                        <br>
                        <button type="submit" class="btn btn-sm btn-secondary" onclick="return vaildatePwd()">변경완료</button>
                        <br><br>
                    </form>
                </div>
            </div>
		</div>
	</div>

                <script>
                function vaildatePwd(){
                    if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()){
                        alert("변경할 비밀번호가 일치하지 않습니다.");
                        return false;
                    }
                }
                </script>
                
    <!-- 회원탈퇴용 Modal -->
	<div class="modal" id="deleteModal" align="center">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">회원탈퇴</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
                    <form action="<%= contextPath %>/updateStatus.me" method="post">
                    <input type="hidden" name="userId" value="<%= userId %>">
                        <b>탈퇴 후 복구가 불가능 합니다. <br>
                        정말로 탈퇴 하시겠습니까? <br><br> </b>

                        비밀번호 : <input type="password" name="userPwd" required> <br><br>
                        <button type="submit" class="btn btn-sm btn-danger" onclick="vaildateStatus()">탈퇴하기</button>
                    </form>
                </div>

			</div>
		</div>
	</div>


</body>
<script>
    window.onload = function() {
        let dropdown = document.getElementById('yearDropdown');
        
        for (let i = 1950; i <= 2023; i++) {
            let option = document.createElement('option');
            option.value = i;
            option.text = i;
            dropdown.appendChild(option);
        }
    }
</script>
<script>
window.onload = function() {
    populateYearDropdown();
    populateMonthDropdown();
    populateDateDropdown();

    document.getElementById('yearDropdown').addEventListener('change', populateDateDropdown);
    document.getElementById('monthDropdown').addEventListener('change', populateDateDropdown);
}

function populateYearDropdown() {
    let dropdown = document.getElementById('yearDropdown');
    for (let i = 1950; i <= 2020; i++) {
        let option = document.createElement('option');
        option.value = i;
        option.text = i + "년";
        dropdown.appendChild(option);
    }
}

function populateMonthDropdown() {
    let dropdown = document.getElementById('monthDropdown');
    let months = [
        "1월", "2월", "3월", "4월", "5월", "6월",
        "7월", "8월", "9월", "10월", "11월", "12월"
    ];
    
    for (let i = 0; i < months.length; i++) {
        let option = document.createElement('option');
        option.value = i+1;
        option.text = months[i];
        dropdown.appendChild(option);
    }
}

function populateDateDropdown() {
    let yearDropdown = document.getElementById('yearDropdown');
    let monthDropdown = document.getElementById('monthDropdown');
    let dateDropdown = document.getElementById('dateDropdown');
    
    while (dateDropdown.firstChild) {
        dateDropdown.removeChild(dateDropdown.firstChild);
    }

    let month = monthDropdown.value;
    let year = yearDropdown.value;

    let daysInMonth;
    switch (month) {
        case '2':
            daysInMonth = (year % 4 === 0 && (year % 100 !== 0 || year % 400 === 0)) ? 29 : 28; // Leap year check
            break;
        case '4':
        case '6':
        case '9':
        case '11':
            daysInMonth = 30;
            break;
        default:
            daysInMonth = 31;
    }

    for (let i = 1; i <= daysInMonth; i++) {
        let option = document.createElement('option');
        option.value = i;
        option.text = i + "일";
        dateDropdown.appendChild(option);
    }
}

</script>
</html>