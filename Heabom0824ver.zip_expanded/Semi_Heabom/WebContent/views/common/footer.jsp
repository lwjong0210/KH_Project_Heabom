<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        
        footer {
            box-sizing: border-box;
            background-color: #f9f9f9;
            padding: 20px 0;
            /* position: fixed; */
            bottom: 0;
            width: 1900px;
            border-top: 1px solid #e5e5e5;
        }

        .footer-content {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 15px; 
        }

        .footer-title, .footer-customer-service {
            font-size: 24px;
            margin: 0; 
        }

        .footer-text, .footer-contact, .footer-hours {
            font-size: 14px;
            margin: 10px 0; 
        }

        .footer-copyright, .footer-links {
            font-size: 14px;
            margin-top: 10px; 
            white-space: nowrap; 
            overflow: hidden;   
        }


        .left-content, .right-content {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 100%;
        }

        .right-content {
            text-align: right;
        }

    </style>
</head>
<body>
    <footer>
        <div class="footer-content">
            <div class="left-content">
                <h1 class="footer-title">해봄</h1>
                <p class="footer-text">
                    회사명 : 해봄(주) 대표이사 : 이원종
                </p>
                <p class="footer-text">
                    주소 : 서울시 강남구 역삼동
                </p>
                <div class="footer-copyright">
                    COPYRIGHT © 2023 heabom ALL RIGHT RESERVED
                </div>
            </div>

            <div class="right-content">
                <h1 class="footer-customer-service">고객센터 02-6925-0227</h1>
                <p class="footer-contact">이메일 : 123@naver.com</p>
                <p class="footer-hours">평일 10:00 ~ 18:00</p>
                <div class="footer-links">
                    서비스 이용약관 | 전자금융거래 약관 | 개인정보 처리방침 | 면책 공고 | 개인정보 수집항목
                </div>
            </div>
        </div>
    </footer>
</body>
</html>
