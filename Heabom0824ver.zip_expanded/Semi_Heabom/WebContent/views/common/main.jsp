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
        /* #wrap{
            width: 1900px;
            height: auto;
            border: 0px solid black;
            box-sizing: border-box;
            margin: auto;
            margin-top: 30px;
           
        } */
        div{
            border: 1px solid black;

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
            " <a id='best1' href='http://www.naver.com'>금주의 베스트게시물1  </a>",
            " <a id='best2'  href='http://www.naver.com'>금주의 베스트게시물2 </a>",
            " <a id='best3'  href='http://www.naver.com'>금주의 베스트게시물3 </a>",
            " <a id='best4'  href='http://www.naver.com'>금주의 베스트게시물4 </a>",
            " <a id='best5'  href='http://www.naver.com'>금주의 베스트게시물5 </a>",
            " <a id='best6' href='http://www.naver.com'>금주의 베스트게시물6 </a>",
            ]
            


            console.log(bests);
            $("#div3").html(bests[0]);


                setInterval (function(){
                    $("#div3").html(bests[i]);
                    i++ ; 
                    if(i == 6){
                        i = 0 ; 
                    }
                
                },1000);
        
       



        //형꺼
        

        let j = 1;
        let arr = [
          "<img class='best' src='https://www.gangnam.go.kr/upload/editor/2020/12/29/b03f9390-fed9-41fc-874c-81f4d6b200f8.jpg' >",
          "<img class='best' src='https://a.cdn-hotels.com/gdcs/production47/d1059/04077388-e2a5-4952-88d6-4cd6ffe07710.jpg' >",
          "<img class='best' src='https://a.cdn-hotels.com/gdcs/production97/d1351/a274bc26-9643-4bae-a91f-cebaf7f9fa56.jpg' >",
          "<img class='best' src='https://a.cdn-hotels.com/gdcs/production19/d1764/0fdc6746-e0a8-4abc-929e-e4a3e237b95b.jpg' >",
          "<img class='best' src='https://korean.miceseoul.com/humanframe/theme/mice/assets/images/spot/img_spot_view_04_0.jpg' >",
          "<img class='best' src='https://i.pinimg.com/236x/a8/a8/e4/a8a8e48b4fe56c83cf8fa07800cfa48a.jpg'>",
        ];
        $("#main").html(arr[0]);
        setInterval(function () {
          $("#main").html(arr[j]);
          j++;
          if (j == arr.length) {
            j = 0;
          }
        }, 1000);

        $(".best").click(function(){
            location.href = "http://www.daum.net"
        })


    })




    </script>

</body>
</html>