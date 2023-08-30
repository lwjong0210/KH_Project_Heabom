<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            
        } 

        .prop_detail p {
            margin: -1px;
        }

    </style>
</head>
<body>
        <div class="prop_setting">
            <br>
            <form action="">
                <table border="1" class="prop_detail" style="margin-bottom: 10px;">
                    <tr>
                        <td class="detail_title" width="100">아이디<label for="" style="color:hotpink">&nbsp★&nbsp</label></td>
                        <td width="245">
                            <input type="text" readonly style="background-color: lightgray;">
                            <br><p style="font-size: smaller; color: red;"><strong>&nbsp* 아이디는 수정 불가 사항입니다.</strong></p></td>
                        <td rowspan="2" width="120">사진미리보기</td>
                    </tr>
                    <tr>
                        <td class="detail_title">비밀번호<label for="" style="color:hotpink">&nbsp★&nbsp</label></td>
                        <td><input type="password"></td>
                    </tr>
                    <tr>
                        <td class="detail_title">비밀번호확인&nbsp</td>
                        <td><input type="password"><br><p style="font-size: smaller; color: green;"><strong>&nbsp* 비밀번호 변경시 작성해주세요</strong></p></td></td>
                        <td class="detail_title" style="text-align: center;">대표사진</td>
                    </tr>
                    <tr>
                        <td class="detail_title">이&nbsp&nbsp&nbsp름&nbsp</td>
                        <td><input type="text" placeholder="ex)홍길동" readonly style="background-color: lightgray;"></td>
                        <td class="" rowspan="2" style="text-align: center; font-size: smaller;">
                            <p style="color: blue;"><strong>사진은 최대 10Mbyte를</strong></p>
                            <p style="margin-bottom: 5px;">넘을수 없습니다.</p>
                            <p style="color: blue;"><strong>사진 규격은 125*125를</strong></p>
                            <p>권장합니다.</p>
                        </td>
                    </tr>
                    <tr>
                        <td class="detail_title">이메일&nbsp</td>
                        <td><input type="email" placeholder="ex)해봄@SunSpring.com" maxlength="30"></td>
                    </tr>
                    <tr>
                        <td class="detail_title">MBTI&nbsp</td>
                        <td colspan="2"><input type="text" placeholder="ex)ESFJ(최대4글자)" maxlength="4"></td>
                    </tr>
                    <tr>
                        <td class="detail_title" colspan="">휴대폰번호<label for="" style="color:hotpink">&nbsp★&nbsp</label></td>
                        <td colspan="2"><input type="text" placeholder="ex)010-1234-5678" minlength="13" maxlength="13"><p style="font-size: smaller; color: green;"><strong>&nbsp* 010-1234-5678과 같이 13자로 작성해주세요</strong></p></td>
                    </tr>
                    <tr>
                        <td class="detail_title" colspan="">닉네임<label for="" style="color:hotpink">&nbsp★&nbsp</label></td>
                        <td colspan="2"><input type="text" placeholder="ex)동해번쩍서해번쩍"></td>
                    </tr>
                    <tr>
                        <td class="detail_title">생년월일&nbsp</td>
                        <td colspan="2">
                            <select id="yearDropdown"></select>
                            <select id="monthDropdown"></select>
                            <select id="dateDropdown"></select>
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="detail_title">등급 및 포인트&nbsp</td>
                        <td colspan="2">
                            <input type="number" value="" style="width: 100px; background-color: lightgray;" readonly>
                            <input type="text" value="" style="width: 100px; background-color: lightgray;" readonly>
                            <p style="font-size: smaller; color: green;"><strong>&nbsp* 획득한 포인트에 대한 등급입니다.</strong></p>
                        </td>
                    </tr>
                    <tr>
                        <td class="detail_title">대표사진변경&nbsp</td>
                        <td colspan="2"><input type="file"></td>
                    </tr>
                </table>
                <input type="submit" class="btn btn-sm btn-success style="background-color: pink; border: 1;">
                <a href="" class="btn btn-sm btn-warning">취소</a>
                <a href="" class="btn btn-sm btn-danger">탈퇴</a>
            </div>
        </td>
    </tr>
</table>
</form>
<br><br>
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