<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

    <style>
        div {
            box-sizing: border-box;
        }

        .wrap {
            width: 1000px;
            margin: auto;
            height: auto;
        }

        /* 캐러셀 관련 */
        .carousel {
            width: 1000px;
            height: 500px;

        }

        .carousel-inner {
            width: 100%;
            height: 100%;

        }

        .carousel-item {
            text-align: center;
            width: 100%;
            height: 100%;
            background-color: lightgray;

        }

        .carousel-inner>div>img {
            width: auto;
            height: 100%;
        }

        /* 캐러셀 관련 끝*/

        /* 글쓰기 글자 폼 */
        #write-text {
            width: 1000px;
            height: 60px;
            font-size: 30px;
            line-height: 19px;
        }

        #write-text>div {
            padding-top: 10px;
            width: 100%;
            height: 100%;
            border-bottom: 3px solid gray;
        }

        /* 글쓰기 글자 폼 끝 */



        /* 글쓰기 폼 */

        .write_post_area {
            width: auto;
            height: auto;
        }

        #write_post_header {
            width: 100%;
            height: 50px;
        }

        #write_post_header>div {
            float: left;
            height: 100%;
            text-align: center;
            padding-bottom: 10px;
        }

        #write_post_header>div>* {
            height: 100%;
            width: 100%;
        }

        #write_post_title_area {
            width: 70%;
            padding-right: 10px;
        }

        #select_notice_area {
            width: 30%;
        }

        #write_poster_footer {
            height: 35px;
            width: 100%;
        }

        #write_poster_footer>div {
            float: right;
        }

        #writer_poster_submit {
            height: 100%;
        }

        #admin_private {
            height: 100%;
            margin-right: 10px;
        }

        #notice_check {
            position: relative;
            top: 2px;

        }

        #notice_check_text {
            position: relative;

        }

        .note-resizebar {
            display: none;
        }

        .note-statusbar {
            display: none;
        }

        /* 해시태그 관련 */
        span {
            box-sizing: border-box;
            /*border: 1px solid black;*/
            float: left;
        }

        #input_tag {
            height: auto;
            overflow: auto;
        }

        #input_tag>span {
            height: 100%;
            width: auto;
        }

        #input_tag>span>* {
            float: left;
            line-height: 22px;
        }

        #input_tag>span>span {
            font-size: 14px;
            height: 100%;
            margin-left: 5px;
        }

        #input_tag>span>div input {
            height: 20px;
            border: 0px;
            width: 70px;

        }

        #input_tag>span>div input:focus {
            outline: none;
        }

        .tag_input_area button {
            background-color: white;
            border: 0px;

        }

        /* 해시태그 관련 끝 */

        /* 글쓰기 폼 끝 */
    </style>
</head>

<body>
<%@include file = "../common/header.jsp" %>
    <div class="wrap">

        <div id="demo" class="carousel slide" data-ride="carousel" style="padding: 20px 10px ;">

            <!-- Indicators -->
            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
            </ul>

            <!-- The slideshow -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="resources/img/1mj3112000b8kyfpd5FC3_Z_640_10000_R5.png_.webp" alt="Los Angeles">
                    <div class="carousel-caption">
                        <h3>워터밤</h3>
                        <p>놀러와~~~~~</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="resources/img/285632_356327_475.jpg" alt="Chicago">
                    <div class="carousel-caption">
                        <h3>화로축제</h3>
                        <p>흠냐링~</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="resources/img/5n90r48nlara9vx.png" alt="New York">
                    <div class="carousel-caption">
                        <h3>뮤직축제</h3>
                        <p></p>
                    </div>
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>

        </div>



        <div id="write-text"z style="padding: 10px;">
            <div>
                글쓰기
            </div>
        </div>
        <div class="write_post_area" style="padding: 10px;">
            <form action="https://naver.com" method="post">
                <div id="write_post_header">
                    <div id="write_post_title_area">
                        <input type="text" id="write_post_title" placeholder="제목을 입력하세요." required>
                    </div>
                    <div id="select_notice_area">
                        <select name="" id="select_notice">
                            <option value="">자유게시판</option>
                            <option value="">공지사항</option>
                            <option value="">Q & A</option>
                            <option value="">...</option>
                        </select>
                    </div>
                </div>
                <textarea id="summernote" name="editordata"></textarea>
                <div id="input_tag" style="margin-top: 10px;">
                    <span class="parent_span">
                        <span>#</span>
                        <div class="tag_input_area">
                            <input class="tag_input" type="text" maxlength="50" placeholder="태그입력">
                            <button type="button" class='delete_tag'>x</button>
                        </div>
                    </span>
                </div>
                <div id="write_poster_footer" style="margin-top: 10px;">
                    <div id="writer_poster_submit">
                        <input type="button" value="등록" onclick="$(this).attr('type','submit')">
                    </div>
                    <div id="admin_private">
                        <input type="checkbox" id="notice_check">
                        <label for="notice_check" id="notice_check_text" style="font-size: 11px;">상단고정</label>
                    </div>
                </div>
            </form>
        </div>
        <script>
            /* 해시태그 스크립트 */
            $(function () { 
            
                $(document).on('keydown', '.tag_input', function () {
                    $(this).css('width', 20);
                    let value = $(this).val();
                    $('.tag_input_area').append('<div class="virtual">' + value + '</div>')
    
                    let inputWidth = $(this).siblings('.virtual').width()
                    $(this).css('width', inputWidth + 15);
                    $('.virtual').remove();
    
                })
                $(document).on('click', '.delete_tag', function () {
                    let tagLength = $('.tag_input').length;
                    let ti = $('.tag_input').get()  
                    console.log($(this).prev().val())
                    console.log(ti[tagLength-1].value)
                    console.log($("button").index(this))
                    console.log(tagLength-1)
                    if(($(".delete_tag").index(this)==tagLength-1) && (ti[tagLength-1]).value==''){    // 지금누른 버튼이 마지막 인덱스의 버튼일떄
                        $(this).prev().val('');
                    }else{
                        $(this).parent().parent().remove();
                    }
                })
                
                $(document).on('change', '.tag_input', function () {
                        
                        let tagLength = $('.tag_input').length;
                        let ti = $('.tag_input').get()  
                        if(ti[tagLength-1].value != ''){
                            $(document).on('click', '.delete_tag', function () {
                                return;
                            })
    
                            $('#input_tag').append("<span class='parent_span'><span>#</span><div class='tag_input_area'><input class='tag_input' type='text' maxlength='50' placeholder='태그입력'><button type='button' class='delete_tag'>x</button></div></span>");
                            $('.tag_input')[tagLength].focus();
                        }
                })
                
            })
        </script>


        <script>
            /* 글쓰기 폼 스크립트 */
            $(function () {

                $('#summernote').summernote({
                    minHeight: '500px',
                    placeholder: '내용을 입력하세요.',
                    tabsize: 2,
                });
            })
        </script>


    </div>

</body>

</html>