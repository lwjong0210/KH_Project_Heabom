<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String contextPath = request.getContextPath();
    %>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    
    
        <style>
            #yak{
                border: 1px solid black; background-color: white; 
                width: 100%; height: 50px; line-height: 50px; 
                text-align: center; 
                border-radius: 0px; 
                margin: auto;
                cursor: pointer;
                 /*이거 중요*/
            }
            p{
                
                border: 0px solid lightgray;
                background-color: white;
                width: 100%;
                height: 100%;
                margin: auto;
                margin-top: 5px;
                padding: 10px;
                box-sizing: border-box;
                display: none;
                z-index: 30;
               
            }
    
              #wrap{
                width: 1900px;
                height: 800px;
                border: 0px solid black;
                box-sizing: border-box;
                margin: auto;
                margin-top: 30px;
    
            }
            div{
                border: 0px solid black;
                float: left;
                height: 100%;
                box-sizing: border-box;
            }
            #header{
                float: none;
                height: 10%;
                box-sizing: border-box;
            }
            #header_1{
               
               height: 100%;
               width: 8%;
            }
            #header_2{
                height: 100%;
                width: 92%;
            }
            #content{
                float: none;
                height: 90%;
                background-color: rgb(252, 252, 252);
            }
            #div1{
                width: 30%;
                
               
            }
            #div2{
                width: 40%;
                box-sizing: border-box;
                
            }
            #div3{
                width: 30%;
                
            }
    
            #div1-1{
                width: 95%;
    
            } 
            #div1-2{
                width: 5%;
                background-color: rgb(255, 232, 236);
            }
    
    
    
            #div2>div{
                
               float: none;
               border: 0px solid black;
               width: 100%;
            }
    
    
            #div2-1{
                height: 30%;
                
                box-sizing: border-box;
            }
    
     
    
            #div2-2{
                height: 70%;
                box-sizing: border-box;
            }
            
         
            img{
                width: 100%;
                height: 70%;
            }
    
        
        #enroll-form table{
           
            margin: auto;
            width: 45%;
            background-color: white;
            
        } 
        
        #enroll-form input{
            margin: 10px;
            background-color: white;
           
           
        }
    
        input{
    
             border-top: none;
             border-left: none;
             border-right: none;
             
         }
    
    
         button{
            
            border-radius: 30px;
            
         }
    
        </style>
    </head>
    <body>
        <div id="wrap">
    
            <div id="header">
                <div id="header_1"><img src="02_CSS3/resources/image/KakaoTalk_20230804_183210092.png" alt=""></div>
                <div id="header_2"></div>
            </div>
    
    
            <div id="content">
                <div id = "div1">
                    <div id="div1-1"></div>
                    <div id="div1-2"></div>
                </div>
        
        
                <div id = "div2">
                    
                    <div id ="div2-1">
                         <div id = "yak">회원가입 약관읽기</div>
                            <p>약관 어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구
                                어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구
                                어쩌구저쩌구어쩌구저쩌구<br><br>
                                
                                <input type="checkbox" id = "check">동의합니다</p>
                    </div>
                  
                    <div id ="div2-2">
                        <form id = "enroll-form" action="<%=contextPath%>/insert.me" method="post"  enctype="multipart/form-data">
            
           <!-- enctype="multipart/form-data" -->  
                            <table border="1">
                                <tr>
                                    
                                    <td><input type="text" name="userId" maxlength="12" placeholder="아이디"  size = 40  required ></td>
                                    <!-- <td><button type="button" onclick="idCheck();">중복확인</button></td> -->
                                </tr>
                                <tr>
                                    
                                    <td><input type="password" name="userPwd"  placeholder="비번" size = 40  maxlength="15" required></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    
                                    <td><input type="password" placeholder="비번확인" size = 40  maxlength="15" required></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    
                                    <td><input type="text" name="userName" placeholder="이름" size = 40  maxlength="6" required></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    
                                    <td><input type="text" name="phone" size = 40  placeholder=" 전화번호- 포함해서 입력"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    
                                    <td><input type="email" size = 40  placeholder="이메일" name="email"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    
                                    <td><input type="text" size = 40  placeholder="mbti" name="mbti"></td>
                                    <td></td>
                                </tr>
                            </tr>
                            <tr>
                                
                                <td><input type="text" size = 40  placeholder="닉네임" name="nickName"></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td><input type="file" name = "upfile">프사</td>
                            </tr>
                            
                                <tr>
                                    <th> <button id="hi" type="submit" disabled>회원가입</button><button type="reset" >초기화</button></th>
                                   
                                </tr>
            
                                
                            </table>
                
                        </form>
                    </div>
    
                </div> 
    
                <div id = "div3"></div>
            </div>
           
        </div>
    
    
        <script>
            $(function(){
               
    
                
    
                $("#enroll-form").css('display','none');
                $("#yak").click(function(){
                    //클릭한 요소의 바로 뒤 요소 기억나지? 동위!
                    //같은레벨에 있는거 알쥐
                    //보여지는 상태면 안보이게 안보이는 상태면 보여지게 하자
                    const p = $(this).next(); //p는 jquery방식으로 선택된 요소를 담아둘때 앞에 $를 붙일떄도 있음
                    //뭐 없어도 됨
    
                    if(p.css("display") == "none"){ //속성명만 주면 반환한다! 굿 잘 했어 none 에 큰따옴표가 필요하네..
                        //none 도 하나의 속성이라서 큰따옴표가 필요해
    
                        //기존건 닫히고 지금것만 열리게 하고 싶어? ㅇㅋㅇㅋ
                        $(this).siblings("p").slideUp();
    
                        p.slideDown();
                    }else{
                        p.slideUp();
                    }
                    //p.slideToggle(); //위에껄 통합한게 toggle좋네
                
                    //slide가 굉장히 세련된다. 토스같네
    
                })
    
            })
    
            $("#check").click(function(){
                    $("#enroll-form").css('display','block');
    
                    if ( $("#check").is(':checked')){
                        $("#hi").attr('disabled',false);
                       
                    }else{
                        $("#hi").attr('disabled',true);
                    }
    
                    
                })
    
         
        </script>
    </body>
    </html>