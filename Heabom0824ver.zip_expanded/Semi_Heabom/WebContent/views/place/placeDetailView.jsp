<%@page import="com.heabom.common.model.vo.File"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.heabom.place.model.vo.Place"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
     	Place place = (Place)request.getAttribute("placeInfo");
    	ArrayList<File> fileList = (ArrayList<File>)request.getAttribute("fileList");
    	
    	//System.out.println(place);
    	//System.out.println(fileList.get(0).getFilePath());
    
     	
    %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .wrap {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        padding: 0;
        width: 1900px;
        margin: 50px auto;
        background-color: #ffffff;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        display: flex;
        overflow: hidden;
    }
    .place-img {
        width: 50%;
        position: relative;
    }
    .place-img img {
        width: 80%;
        height: 100%;
        object-fit: cover;
        margin-left: 60px;
    }
    .place-description {
        width: 50%;
        padding: 40px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        border-bottom: 1px solid #e5e5e5;
        padding: 10px 0;
        text-align: left;
    }
    th {
        font-size: 16px;
        color: #777;
        padding-right: 20px;
    }
    td {
        font-size: 20px;
        color: #333;
    }
    td a {
        color: #007BFF;
        text-decoration: none;
    }
    .review-section {
            width: 1900px;
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            max-width: 800px;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        .review {
            border-bottom: 1px solid #e5e5e5;
            padding: 20px 0;
        }
        .review:last-child {
            border-bottom: none;
        }
        .review-author {
            font-weight: bold;
            margin-bottom: 10px;
        }
        .review-text {
            color: #555;
            margin-bottom: 10px;
        }
        .review-img {
            width: 100px;
            height: 80px;
            border-radius: 8px;
            margin-bottom: 5px;
        }
        .review-date {
            font-size: 12px;
            color: #aaa;
        }
        .report {
        font-size: 12px;
        color: #007BFF;
        cursor: pointer;
        margin-top: 5px;
        text-decoration: underline;
        }

            .review-form {
            margin-bottom: 20px;
        }
        .review-form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .review-form button {
            padding: 5px 10px;
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .review-form button:hover {
            background-color: #0056b3;
        }
        .review-form {
            margin: auto;
            width: 900px;
        }
        .review-form textarea {
            resize: none;
        }
    </style>
</head>
<body>
    <%@ include file="../common/header.jsp" %>
    <h1 align="center"><%=place.getPlaceTitle()%></h1>
    <div class="wrap">
        <div class="place-img" style="border: 1px solid black;">
            <img src="<%=place.getTitleImg()%>">
        </div>
        <div class="place-description">
            <table>
                <tr>
                    <th>등록일</th>
                    <td><%=place.getMakeDate()%></td>
                </tr>
                <tr>
                    <th>번호</th>
                    <td><%=place.getPhone() %></td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td><%=place.getAddress() %></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><%=place.getPlaceContent() %></td>
                </tr>
                <tr>
                    <th>오픈시간</th>
                    <td><%=place.getStartTime() %>시</td>
                </tr>
                <tr>
                    <th>닫는시간</th>
                    <td><%=place.getEndTime() %>시</td>
                </tr>
                <tr>
                    <th>별점</th>
                    <td><%=place.getStarPoint() %></td>
                </tr>
                <tr>
                    <th>홈페이지</th>
                    <td><a href="<%=place.getPlaceUrl()%>">사이트 이동</a></td>
                </tr>
                <tr>
                    <th>예상소요시간</th>
                    <td><%=place.getUseTime() %></td>
                </tr>
                <tr>
                    <th>예상소요비용</th>
                    <td><%=place.getUsePrice() %></td>
                </tr>
            </table>
        </div>
    </div>

    <h1 align="center">ì¬ì©ì íê¸°</h1>

    <form class="review-form" action="#" method="post" enctype="multipart/form-data">
        <textarea name="review-text" rows="4" placeholder="ë¦¬ë·°ë¥¼ ìì±í´ì£¼ì¸ì."></textarea>
        <input type="file" name="review-image">
        <button type="submit">ë¦¬ë·° ë±ë¡íê¸°</button>
    </form>

    <div class="review-section">
        <div class="review">
            <div class="review-author">user01</div>
            <div class="review-text">ì´ ì¥ìë ì ë§ ì¢ìì´ì! ë¤ìì ë ë°©ë¬¸íê³  ì¶ë¤ì.</div>
            <img src="img/ìì¸ìµë¬´ì.jpg" alt="User Image" class="review-img">
            <div class="review-date">2023-08-24</div>
            <div class="report">ì ê³ íê¸°</div>
        </div>
        
        <div class="review">
            <div class="review-author">user02</div>
            <div class="review-text">ë¶ìê¸°ë ì¢ê³ , ì§ìë¤ë ì¹ì í´ì. ì¶ì²í©ëë¤!</div>
            <img src="path/to/image.jpg" alt="User Image" class="review-img">
            <div class="review-date">2023-08-23</div>
            <div class="report">ì ê³ íê¸°</div>
        </div>

    </div>
</body>
</html>