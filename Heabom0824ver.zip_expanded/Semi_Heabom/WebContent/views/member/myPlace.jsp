<%@page import="com.heabom.member.model.vo.Member"%>
<%@page import="com.heabom.place.model.vo.Place"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Place> plist = (ArrayList<Place>)request.getAttribute("plist");
	// 장소번호, 장소제목, 장소 내용, 만든날짜, 조회수, 별점, 해시태그
	Member loginMember =  (Member)session.getAttribute("loginMember");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
    .yj_myPlace_area{
        border: 0px solid;
        height: auto;
        width: 532px;
        margin: auto;
        margin-top: 10px;
        margin-left: 817px;
        background-color: white;
        padding: 20px;
        border-radius: 20px;
    }

    .yj_myPlace_detail{
    height: auto;
    width: auto;
    border: 1px solid lightgray;
    padding: 10px;
    margin-bottom: 5px;
    }

    .yj_myPlace_detail img{
        height: 100%;
        width: 100%;
    }

    .text_limit {
        width: 300px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;  /* 말줄임 적용 */
        font-size: larger;
    }

    .detail_tb div {
        cursor: pointer;
    }
    .detail_tb img:hover{
        cursor: pointer;
        opacity: 0.7;
    }

    .text_limit a {
        color: blue;
        font-size: small;
        font-weight: bolder;
    }
    .text_limit a:hover {
        color: yellowgreen;
    }
    .text_limit:hover{
        color: darkgray;
    }


    </style>
</head>
<body>
    <div class="yj_myPlace_area" align="cneter">
    <% if(plist.isEmpty()) { %>
        <div class="yj_myPlace_detail">
            <table border="0" class="detail_tb">
                <tr>
                    <td height="40" width="350" colspan="4"><strong><%=loginMember.getNickname() %>님의 핫한 장소 해봄과 함께 하세요.</strong></td>
                </tr>
            </table>
        </div>
    <% } else { %>
   	<% for(Place p : plist) { %>
        <div class="yj_myPlace_detail">
            <table border="0" class="detail_tb">
                <tr>
                    <td rowspan="4" width="300" height="130">
                        <img src="https://mediahub.seoul.go.kr/wp-content/uploads/2015/01/ff3e50a3a7011272d25652517be9489d.jpg" alt="">
                    </td>
                    <td rowspan="4" width="10"></td>
                    <td height="40" width="350" colspan="4"><div class="text_limit"><strong><%=p.getPlaceTitle() %></strong></div></td>
                </tr>
                <tr>
                    <td height="30" width="350" colspan="4"><div class="text_limit"><%=p.getPlaceContent() %></div></td>
                </tr>
                <tr>
                    <td height="20" width="350" colspan="4">
                        <div class="text_limit" >
                        	<% if(p.getHashtagName() != null) {%>
	                        	<% String[] hList = p.getHashtagName().split(","); %>
	                        	<% for(int i = 0; i<hList.length; i++) {%>
	                        		<a href="#">#<%= hList[i] %></a>
	                            <% } %>
                            <% }else{ %>
                            	<a href="#">#등록된 태그가 없습니다.</a>
                            <% } %>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td width="120" style="text-align: center; font-size: smaller;"><%=p.getMakeDate() %></td>
                    <td width="80" style="text-align: center; font-size: smaller;">조회수: <%=p.getStarPoint() %></td>
                    <td width="150" style="text-align: center; font-size: smaller;">별점: <%=p.getViewCount() %></td>
                </tr>
            </table>
        </div>
     <% } %>
     <% } %>
    </div>
</body>
</html>