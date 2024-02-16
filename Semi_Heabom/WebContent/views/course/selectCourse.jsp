<%@page import="com.heabom.place.model.vo.Place"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<Place> list = (ArrayList<Place>)request.getAttribute("list");
       	session.setAttribute("placeSearchList", list);
       	
       	
       	
       	
 
    	//젠장 place 에 카테고리가 int 로 되어있어서 고생좀 합니다.
    	//vo 수정하기도 귀찮고 join 쿼리 돌리기는 더 귀찮으니까 걍 이없으면 잇몸으로 씹습니다. 시간도 없고; 
    	int categoryNo= list.get(0).getCategoryNo();
    	String categoryStr = null ;
    	String category = null  ;
    	if (categoryNo == 1){
    		categoryStr = "술한잔 해볼까요?" ;
    	}else if (categoryNo ==2){
    		categoryStr = "카페에서 커피한잔?";
    	}else{
    		categoryStr ="맛있는 음식점을 찾아봐요";
    	}
    	
    	
    	
    	int locationNo = list.get(0).getLocationNo();
    	String location = null ; 
    	switch (locationNo){
    	case 1 : 
    		location = "강남구";
    		break;
    	case 2 : 
    		location = "서초구";
    		break;
    	case 3 : 
    		location = "동작구";
    		break;
    	case 4 : 
    		location = "강서구";
    		break;
    	case 5 : 
    		location = "양천구";
    		break;
    	case 6 : 
    		location = "구로구";
    		break;
    	case 7 : 
    		location = "금천구";
    		break;
    	case 8 : 
    		location = "관악구";
    		break;
    	case 9 : 
    		location = "영등포구";
    		break;
    	case 10 : 
    		location = "송파구";
    		break;
    	case 11 : 
    		location = "강동구";
    		break;
    	case 12 : 
    		location = "광진구";
    		break;
    	case 13 : 
    		location = "성동구";
    		break;
    	case 14 : 
    		location = "용산구";
    		break;
    	case 15 : 
    		location = "마포구";
    		break;
    	case 16 : 
    		location = "서대문구";
    		break;
    	case 17 : 
    		location = "중구구";
    		break;
    	case 18 : 
    		location = "동대문구";
    		break;
    	case 19 : 
    		location = "중랑구";
    		break;
    	case 20 : 
    		location = "종로구";
    		break;
    	case 21 : 
    		location = "성북ㅍ";
    		break;
    	case 22 : 
    		location = "은평구";
    		break;
    	case 23 : 
    		location = "강북구";
    		break;
    	case 24 : 
    		location = "도봉구";
    		break;
    	case 25 : 
    		location = "노원구";
    		break;
    		
    	}
    	
    	
    	
    %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Heabom</title>
    <style>
#catagory-bar {
  display: flex;
  gap: 32px;
  padding: 20px 40px 0;
  overflow: auto;
}
#catagory-bar::-webkit-scrollbar {
  display: none;
}
.active-img {
  display: none;
}
.catagory-button{
  color: #717171;
  font-size: 12px;
  font-weight: 600;
  cursor: pointer;
}
.catagory-button img {
  width: 28px;
}
.catagory-button:hover {
  color: #000000;
  border-bottom: 0px solid #DDDDDD;
}
#active-catagory-button{
  color: #000000;
  border-bottom: 0px solid #000000;
}
#active-catagory-button .active-img {
  display: inline-block;
}
#active-catagory-button .inactive-img {
  display: none;
}  

.wrap {
  width: 1900px;
  text-align: center;
  border: 0px solid black;
  margin: auto;
}

main {
    display: flex;
    justify-content: center;
    padding: 20px 80px;
}

/* section {
    display: grid;
    grid-template-columns: repeat(4, 308px);
    justify-content: center;
    align-items: center;
    box-sizing: border-box;
    gap: 40px 24px;
} */

.item {
    cursor: pointer;
    border: 0px solid black;
    text-align: center;
}

.img {

  width: 308px;
  height: 293px;
  overflow: hidden;
  border-radius: 23px;
  border: 0px solid black;
  margin: auto;
  
  
}

.img img {
    width: 100%;
    height: 100%;
    transition: color 0.25s, border-color 0.25s, box-shadow 0.25s, transform 0.25s;
    
    
}

.img img:hover {
  box-shadow: 0 0.5em 0.5em -0.4em #6b6b6b;
  transform: translateY(-0.2em);
}

.description {
  margin-top: 13px;
  display: flex;
  flex-direction: column;
  gap: 3px;
  font-size: 15px;
  color: rgb(34, 34, 34);
  border: 1px solid black;
  border-radius: 20px;
}

.description>.description_title {
    font-weight: bold;
}
    </style>
</head>
<body>
	
    <%@include file = "../common/header.jsp" %>
    
  	<script>
  		swal("<%=categoryStr%>");
  	</script>
    
    
    
    
    <h1 align="center" style="font-weight: 700" class="mt-5"><%=location%></h1>
    <div class="wrap">
          <%for (int i = 0 ; i <list.size() ; i ++ ) {%>
	          <%if (list.get(i).getCategoryNo() == 1){ 
	          		category = "주점";
	          }else if(list.get(i).getCategoryNo() == 2) {
	        	  	category = "카페";
	          }else{
	        	  category = "음식점";
	          }  %>
	          	
	        
            <section>
                <div class="item" style="width: 300px; height: 300px; margin-top: 50px; float: left; margin-left: 50px; margin-bottom: 50px;">
                    <div class="img" >
                        <a href="<%=contextPath%>/placeDetailView.pl?index=<%=i%>"><img  src="<%=contextPath%>/<%=list.get(i).getTitleImg()%>"></a>
                    </div>
                    <div class="description">
                    	<div class="description_no" ><%=list.get(i).getPlaceNo() %></div>
                        <div class="description_title">제목 : <%=list.get(i).getPlaceTitle() %></div>
                        <div class="description_sub1">분류 : <%=category %></div>
						<div class="btnClass"><button onclick="location.href ='<%=contextPath%>/courseSelect.pl?pNo=<%=list.get(i).getPlaceNo()%>'">코스담기</button></div>
						<div class="description_sub2">좋아요 <%=list.get(i).getLikeCount() %></div>
                    </div>

                </div>
            </section>
        <%} %>
    </div>

	<script>

		$(function(){
			//$(".wrap").find(".description_no").css("color","red");
			$(".btnClass").click(function(){
				let str = $(this).siblings(".description_no").html();
			
			})
		})
				
	</script>



</body>
</html>