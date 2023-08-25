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
    <h1 align="center">장소 상세 페이지</h1>
    <div class="wrap">
        <div class="place-img">
            <img src="img/간판없는가게.jpg" alt="간판없는가게">
        </div>
        <div class="place-description">
            <table>
                <tr>
                    <th>작성 날짜</th>
                    <td>2023-08-24</td>
                </tr>
                <tr>
                    <th>전화 번호</th>
                    <td>010-1234-5678</td>
                </tr>
                <tr>
                    <th>상세 주소</th>
                    <td>서울특별시 강남구</td>
                </tr>
                <tr>
                    <th>장소 설명</th>
                    <td>여기는 간판 없는 가게입니다.</td>
                </tr>
                <tr>
                    <th>영업 시작 시간</th>
                    <td>09:00</td>
                </tr>
                <tr>
                    <th>영업 종료 시간</th>
                    <td>22:00</td>
                </tr>
                <tr>
                    <th>별점</th>
                    <td>⭐⭐⭐⭐</td>
                </tr>
                <tr>
                    <th>홈페이지 주소</th>
                    <td><a href="http://naver.com" target="_blank">http://naver.com</a></td>
                </tr>
                <tr>
                    <th>장소 소요 시간</th>
                    <td>2시간</td>
                </tr>
                <tr>
                    <th>1인 예상 비용</th>
                    <td>20,000원</td>
                </tr>
            </table>
        </div>
    </div>

    <h1 align="center">사용자 후기</h1>

    <form class="review-form" action="#" method="post" enctype="multipart/form-data">
        <textarea name="review-text" rows="4" placeholder="리뷰를 작성해주세요."></textarea>
        <input type="file" name="review-image">
        <button type="submit">리뷰 등록하기</button>
    </form>

    <div class="review-section">
        <div class="review">
            <div class="review-author">user01</div>
            <div class="review-text">이 장소는 정말 좋았어요! 다음에 또 방문하고 싶네요.</div>
            <img src="img/서울앵무새.jpg" alt="User Image" class="review-img">
            <div class="review-date">2023-08-24</div>
            <div class="report">신고하기</div>
        </div>
        
        <div class="review">
            <div class="review-author">user02</div>
            <div class="review-text">분위기도 좋고, 직원들도 친절해요. 추천합니다!</div>
            <img src="path/to/image.jpg" alt="User Image" class="review-img">
            <div class="review-date">2023-08-23</div>
            <div class="report">신고하기</div>
        </div>

    </div>
</body>
</html>