<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>장소 추가화면</h2>
    <form action="">
        이름<input type="text"><br>
        <select name="category" id="">
            <option value="호프">술집</option>
            <option value="카페">카페</option>
            <option value="음식">음식점</option>
        </select><br>
        장소<select name="location" id="">
            <option value="강남구">강남</option>
            <option value="서초구">서초</option>
            <option value="동작구">동작</option>
            <option value="강서구">강서</option>
            <option value="양천구">양천</option>
            <option value="구로구">구로</option>
            <option value="금천구">금천</option>
            <option value="관악구">관악</option>
            <option value="영등포구">영등포</option>
            <option value="송파구">송파</option>
            <option value="강동구">강동</option>
            <option value="광진구">광진</option>
            <option value="성동구">성동</option>
            <option value="용산구">용산</option>
            <option value="마포구">마포</option>
            <option value="서대문구">서대문</option>
            <option value="중구">중구</option>
            <option value="동대문구">동대문구</option>
            <option value="중량구">중량</option>
            <option value="종로구">종로</option>
            <option value="성북구">성북</option>
            <option value="은평구">은평</option>
            <option value="강북구">강북</option>
            <option value="도봉구">도봉</option>
            <option value="노원구">노원</option>
        </select>
        전화번호-<input type="text" name = "phone"><br>
        주소<input type="text" name = "address"><br>
        내용<textarea name="content" rows="10" style="resize: none;" required ></textarea><br>
        영업시간 :
        <select name="startTime" id="">
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
            <option value="13">13</option>
            <option value="14">14</option>
            <option value="15">15</option>
            <option value="16">16</option>
            <option value="17">17</option>
            <option value="18">18</option>
        </select>
        시부터
        <select name="" id="">
            <option value="19">19</option>
            <option value="20">21</option>
            <option value="22">22</option>
            <option value="23">23</option>
            <option value="24">24</option>
            <option value="1">01</option>
            <option value="2">02</option>
            <option value="3">03</option>
            <option value="4">04</option>
            <option value="5">05</option>
            <option value="6">06</option>
            
        </select>
        시까지 <br>

        별점 <input type="range" value="5" min="0" max="5" name = "starPoint"> <br>
        홈페이지 <input type="text" name = "placeUrl"><br>
        예상소요시간 <input type="number" name = "useTime"> <br>
        예상소요비용 <input type="number" name = "userPrice">

    </form>
    
</body>
</html>


