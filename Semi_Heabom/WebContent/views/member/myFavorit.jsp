<%@page import="com.heabom.place.model.vo.Place"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Place> flist = (ArrayList<Place>)request.getAttribute("fList");
	String fContextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
    .yj_myFavorit_area{
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

    .yj_myFavorit_detail{
    height: auto;
    width: auto;
    border: 1px solid lightgray;
    padding: 10px;
    margin-bottom: 5px;
    }

    .yj_myFavorit_detail img{
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

    .detail_tb div, .detail_tb img{
        cursor: pointer;
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
    <div class="yj_myFavorit_area" align="center">
    <% for(Place p : flist) { %>
        <div class="yj_myFavorit_detail">
            <table border="0" class="detail_tb">
                <tr>
                    <td rowspan="4" width="300" height="130">
                        <img src="<%=fContextPath %><%=p.getTitleImg()%>" alt="">
                    </td>
                    <td rowspan="4" width="10"></td>
                    <td height="40" width="350" colspan="4"><div class="text_limit"><strong><%=p.getPlaceTitle() %></strong></div></td>
                </tr>
                <tr>
                    <td height="30" width="350" colspan="4"><div class="text_limit"><%=p.getPlaceContent() %></div></td>
                </tr>
                <tr>
                    <td height="20" width="350" colspan="4"><div class="text_limit" ><a href="">지역 : <%=p.getLocationName() %></a></div></td>
                </tr>
                <tr>
                    <td width="120" style="text-align: center; font-size: smaller;">작성일: <%=p.getStrMakeDate() %></td>
                    <td width="80" style="text-align: center; font-size: smaller;">좋아요: <%=p.getLikeCount() %></td>
                    <td width="150" style="text-align: center; font-size: smaller;">
                    별점: 
                    <% for(int i = 0; i<p.getStarPoint(); i++) { %>
                    ⭐
                    <% } %> 
                    </td>
                </tr>
            </table>
        </div>
        <% } %>
    </div>
</body>
</html>