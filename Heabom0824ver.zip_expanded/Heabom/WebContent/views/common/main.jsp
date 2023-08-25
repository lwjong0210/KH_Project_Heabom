<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <style>
        #wrap{
            width: 1900px;
            height: auto;
            border: 0px solid black;
            box-sizing: border-box;
            margin: auto;
            margin-top: 30px;
           
        }
        div{
            border: 0px solid black;
           
            
           
        }
        #header{
           width: 100%;
           height: 10%;
           box-sizing: border-box;
        }
        #header_1{
            float: left;
            width: 10%;
            height: 100%;
            box-sizing: border-box;
            background-color: white;
        }
        #header_2{
            float: left;
            width: 90%;
            height: 100%;
            box-sizing: border-box;
            background-color: white;
        }
        #content{
            width: 100%;
            height: 90%;
            box-sizing: border-box;
            
            
            
            
        }
        #content_1{
            float: left;
            height: 100%;
            width: 30%;
            box-sizing: border-box;
            font-size: 15px;
            padding-top: 400px;
            background-color: pink;
            
        }
        #content_2{
            float: left;
            height: 100%;
            width: 70%;
            box-sizing: border-box;
            
          
        }
        
        #div1{
            border: 1px solid black;
            width: 300px;
            height: 300px;
            box-sizing: border-box;
            border-radius: 40px;
        }
        #div2{
            border: 0px solid black;
            height: 20%;
            border-radius: 10px;
           
        }
        #div3{
            border: 0px solid black;
            height: 50%;
            border-radius: 10px;
            text-align: center;
        }
        #div4{
            border: 0px solid black;
            height: 30%;
            
            text-align: center;
            background-color: white;
            
        }
        #best{
            text-decoration: none;
            color: black;
            font-weight: 900;
            
        }
        a{
            text-decoration: none; 
            color: black; 
            font-weight: bold; 
            font-size: 50px; 
            cursor: pointer;}

        .button{
            /*버튼 위치 조정해보자*/
        }



        img {
        height: 100%;
        width: 100%;
        cursor: pointer;
       
       
      }
      #main {
        width: 100%;
        height: 100%;
        box-sizing: border-box;
      
      }





        
      #navigator{width: 1000px; height: 40px;} /*안가져갈꺼지롱*/
        
        #navi{
            list-style-type: none; /*li는 기본적으로 padding margin을 꽤 가지고 있다*/
            padding: 0;
            margin: 0;
            height: 100%;
        }
        #navi>li{
            float: left;
            
            width: 20%;
            height: 100%;
            text-align: center;
        }
        #navi a{
            
            text-decoration: none;
            color: rgb(0, 0, 0);
            font-size: 30px;
            font-weight: 900;
            width: 100%;
            height: 100%; /*인라인은 width와 heigth무시되는거 알지*/
            display: block;
            /*vertical-align: middle; /*외 안되 display 블록때문에 버티컬 온라인은 못씀*/
            line-height: 35px; /*내리자*/
            padding-top: 40px;
        }
        #navi a:hover { /*a: hover = 올라갈때*/
            color: orangered;
        }
        #navi>li>ul{
            list-style-type: none;
            padding: 0;
            display: none;
        }

        #navi>li>ul a {
            font-size: 15px;
            /*display: none; /*숨겨놓자 마우스 올리면 하게*/
        }

        /*존나중요*/
        #navi>li>ul:hover+a{display: block}

        #navi>li>a:hover+ul{display: block;} /*이게중요*/
        #navi>li>ul:hover{display: block;}







    </style>
</head>
<body>
    <div id="wrap">
    

        <div id="content">
            <div id="content_1">
                
                    <div id="div2">
                        <button class = "button" id = "leftBtn"> < </button>
                        
                        <button class = "button" id = "rightBtn"> > </button>
                    </div>
                    <div id="div3"></div>
                    <div id="div4"></div>;
                
            </div>
            <div id="content_2">
                <div id="main"></div>
            </div>
        </div>
    </div>






    <script>
        $(function(){
            let i = 1 ; 
            
            
            
            let bests = [
            " <a id='best1'  href='http://www.naver.com'>금주의 베스트게시물1  </a>",
            " <a id='best2'  href='http://www.naver.com'>금주의 베스트게시물2 </a>",
            " <a id='best3'  href='http://www.naver.com'>금주의 베스트게시물3 </a>",
            " <a id='best4'  href='http://www.naver.com'>금주의 베스트게시물4 </a>",
            " <a id='best5'  href='http://www.naver.com'>금주의 베스트게시물5 </a>",
            " <a id='best6'  href='http://www.naver.com'>금주의 베스트게시물6 </a>",
            ]
            console.log(bests);
            $("#div3").html(bests[0]);


                setInterval (function(){
                    $("#div3").html(bests[i] );
                    i++ ; 
                    if(i == 6){
                        i = 0 ; 
                    }
                
                },3000);
        })


        //형꺼
        

        let i = 1;
        let arr = [
          "<img src='https://www.gangnam.go.kr/upload/editor/2020/12/29/b03f9390-fed9-41fc-874c-81f4d6b200f8.jpg'>",
          "<img src='https://a.cdn-hotels.com/gdcs/production47/d1059/04077388-e2a5-4952-88d6-4cd6ffe07710.jpg'>",
          "<img src='https://a.cdn-hotels.com/gdcs/production97/d1351/a274bc26-9643-4bae-a91f-cebaf7f9fa56.jpg'>",
          "<img src='https://a.cdn-hotels.com/gdcs/production19/d1764/0fdc6746-e0a8-4abc-929e-e4a3e237b95b.jpg'>",
          "<img src='https://korean.miceseoul.com/humanframe/theme/mice/assets/images/spot/img_spot_view_04_0.jpg'>",
          "<img src='01_HTML5/resources/image/flower3.PNG'>",
        ];
        $("#main").html(arr[0]);
        setInterval(function () {
          $("#main").html(arr[i]);
          i++;
          if (i == arr.length) {
            i = 0;
          }
        }, 3000);






    </script>

</body>
</html>