<%@page import="com.heabom.common.model.service.MainService"%>
<%@page import="com.heabom.place.model.vo.Place"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.heabom.admin.controller.BannerListController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Place> bannerList = new ArrayList<Place> ();
    
	bannerList = new MainService().selectPlaceList();//메인 배너에 띄울 장소들 가져왔어용
	int nullCheck = 0; 
	System.out.println(bannerList);
	//for (int i = 0 ; i < bannerList.size(); i++){
   	//	System.out.println(bannerList.get(i));
	//}
	String contextPath2 = request.getContextPath();
	
	
	String pNo1 = null;
	String pNo2 = null;
	String pNo3 = null;
	String titleImg1 =null;
	String titleImg2 = null;
	String titleImg3 = null;
	
	
	if(!bannerList.isEmpty()){
	
	if (bannerList.size() == 1){
		pNo1 = bannerList.get(0).getPlaceNo();
		titleImg1 = bannerList.get(0).getTitleImg();
	}
	else if (bannerList.size() == 2){
		pNo1 = bannerList.get(0).getPlaceNo();
		pNo2 = bannerList.get(1).getPlaceNo();
		titleImg1 = bannerList.get(0).getTitleImg();
		titleImg2 = bannerList.get(1).getTitleImg();
	}else if (bannerList.size() == 3){
		pNo1 = bannerList.get(0).getPlaceNo();
		pNo2 = bannerList.get(1).getPlaceNo();
		pNo3 = bannerList.get(2).getPlaceNo();
		titleImg1 = bannerList.get(0).getTitleImg();
		titleImg2 = bannerList.get(1).getTitleImg();
		titleImg3 = bannerList.get(2).getTitleImg();
	}
	nullCheck = 1 ;
	System.out.println(titleImg1);
	}

    %>





<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Heabom</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<style>
* {
	/*
            box-sizing: border-box;
            border: 1px solid red;
            */
	
}


div {
	/*
            box-sizing: border-box;
            border: 0px solid black;
            */
	
}

#content {
	box-sizing: border-box;
}

#content_1 {
	float: left;
	height: 600px;
	/*
            box-sizing: border-box;
            border: 1px solid red;
            */
	background-color: rgba(255, 201, 201, 0.5);
}
/*
        #content_2{
            float: left;
            height: 10%;
            width: 70%;
            box-sizing: border-box;
            
          
        }
        */
#best {
	text-decoration: none;
	color: black;
	font-weight: 900;
	width: 500px;
	height: 500px;
}

#main .img {
	border-radius: 0.325rem;
	height: 100%;
	width: 100%;
}

/* #main {
	width: 1500px;
	height: 720px;
	box-sizing: border-box;
}
 */
.text {
	margin: 0px;
	color: black;
	font-size: xx-large;
	font-weight: 700;
	color: black;
}
</style>
</head>
<body>

	<div class="container-fluid mt-5">

		<div class="row" style="height: 65vh;">

			<div class="col-md-5" id="content_1"
				style="height: 100%">
				<div style="height: 60%; align-items: center;" class="d-flex">
					<div style="text-align: center;">
						<span id="placeTitle" style="font-size: xx-large;"
							class="badge badge-dark"></span>
						<p class="mt-4 mb-0" style="font-size: x-large;" id="placeContent"></p>
					</div>
				</div>
				<div class="d-flex"
					style="height: 30%; align-items: center; text-align: center;">
					<div style="width: 50%; font-size: large;">
						🚩 <span id="placeAddress"> </span>
					</div>
					<div style="width: 50%; font-size: large;">
						☎️ <span id="placePhone"></span>
					</div>
				</div>
				<div id="div3" style="height: 10%"></div>
			</div>

			<div class="col-md-7 p-4" id="content_2"
				style="height: 100%; background-color: #f0f0f0">
				<div id="main" style="height: 100%; width: 100%;">
					<a href='<%=contextPath2%>/movebest.mi?pNo=<%=pNo1%>'> </a>
				</div>

			</div>
		</div>
	</div>



	<script>
        $(function(){
        	
            let i = 1 ; 
            
            let placeTitles = [
            	"<%=bannerList.get(0).getPlaceTitle() %>",
            	"<%=bannerList.get(1).getPlaceTitle() %>",
            	"<%=bannerList.get(2).getPlaceTitle() %>"
            ];
            
            let placeContents = [
            	"<%=bannerList.get(0).getPlaceContent()%>",
            	"<%=bannerList.get(1).getPlaceContent()%>",
            	"<%=bannerList.get(2).getPlaceContent()%>"
            ];
            
           	let placeAddress = [
           		"<%=bannerList.get(0).getAddress()%>",
           		"<%=bannerList.get(1).getAddress()%>",
           		"<%=bannerList.get(2).getAddress()%>"
           	];
           	
           	let placePhone = [
           		"<%=bannerList.get(0).getPhone()%>",
           		"<%=bannerList.get(1).getPhone()%>",
           		"<%=bannerList.get(2).getPhone()%>"
           	]
            
            let bests = [
            " <p class = 'text'>오늘의 첫번째 HEABOM 추천 장소는?&nbsp;&nbsp;&gt;&gt;</p>",
            " <p class = 'text'>오늘의 두번째 HEABOM 추천 장소는?&nbsp;&nbsp;&gt;&gt;</p>",
            " <p class = 'text'>오늘의 세번째 HEABOM 추천 장소는?&nbsp;&nbsp;&gt;&gt;</p>",

            ]

            $("#div3").html(bests[0]);
            $("#placeTitle").html(placeTitles[0]);
            $("#placeContent").html(placeContents[0]);
            $("#placeAddress").html(placeAddress[0]);
            $("#placePhone").html(placePhone[0]);


                setInterval (function(){
                    $("#div3").html(bests[i]);
                    $("#placeTitle").html(placeTitles[i]);
                    $("#placeContent").html(placeContents[i]);
                    $("#placeAddress").html(placeAddress[i]);
                    $("#placePhone").html(placePhone[i]);
                    i++ ; 
                    if(i == 3){
                        i = 0 ; 
                    }
                
                },3000);
        
       

		

        //형꺼
        
		//분기 개빡세누 ㅋㅋ		
       let arr = []; 

    	if (<%=nullCheck%>== 0){
 
             arr = [
              "<a href = '<%=contextPath2%>/movebest.mi?pNo=<%=pNo1%>'><img  src='' class='img'>게시글없음</a>",
              "<a href = '<%=contextPath2%>/movebest.mi?pNo=<%=pNo2%>'><img  src='' class='img'>게시글없음</a>",
              "<a href = '<%=contextPath2%>/movebest.mi?pNo=<%=pNo3%>'><img  src='' class='img'>게시글없음</a>"

            ];
    	}else{

	        arr = [
	          "<a href = '<%=contextPath2%>/placeDetailView.pl?pno=<%= pNo1.substring(2) %>'><img src='<%=contextPath2%><%=titleImg1%>' class='img'></a>",
	          "<a href = '<%=contextPath2%>/placeDetailView.pl?pno=<%= pNo2.substring(2) %>'><img src='<%=contextPath2%><%=titleImg2%>' class='img'></a>",
	          "<a href = '<%=contextPath2%>/placeDetailView.pl?pno=<%= pNo3.substring(2) %>'><img src='<%=contextPath2%><%=titleImg3%>' class='img'></a>"

				];
			}

			let j = 1;

			$("#main").html(arr[0]);
			setInterval(function() {
				$("#main").html(arr[j]);
				j++;
				if (j == arr.length) {
					j = 0;
				}
			}, 3000);

		})
	</script>
	<%@ include file="footer.jsp"%>
</body>
</html>