<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>해봄</title>
    <style>
#catagory-bar {
  display: flex;
  gap: 32px;
  padding: 20px 40px 0;
  overflow: auto;
}
#catagory-bar::-webkit-scrollbar {
  display: none;
}
.active-img {
  display: none;
}
.catagory-button{
  color: #717171;
  font-size: 12px;
  font-weight: 600;
  cursor: pointer;
}
.catagory-button img {
  width: 28px;
}
.catagory-button:hover {
  color: #000000;
  border-bottom: 2px solid #DDDDDD;
}
#active-catagory-button{
  color: #000000;
  border-bottom: 2px solid #000000;
}
#active-catagory-button .active-img {
  display: inline-block;
}
#active-catagory-button .inactive-img {
  display: none;
} 

.wrap {
  width: 1900px;
  text-align: center;
}

main {
    display: flex;
    justify-content: center;
    padding: 20px 80px;
}

section {
    display: grid;
    grid-template-columns: repeat(4, 308px);
    justify-content: center;
    align-items: center;
    box-sizing: border-box;
    gap: 40px 24px;
}

.item {
    cursor: pointer;
}

.img {
  position: relative;
  width: 308px;
  height: 293px;
  overflow: hidden;
  border-radius: 23px;
}

.img img {
    width: 100%;
    height: 100%;
    transition: color 0.25s, border-color 0.25s, box-shadow 0.25s, transform 0.25s;
}

.img img:hover {
  box-shadow: 0 0.5em 0.5em -0.4em #6b6b6b;
  transform: translateY(-0.2em);
}

.description {
  margin-top: 13px;
  display: flex;
  flex-direction: column;
  gap: 3px;
  font-size: 15px;
  color: rgb(34, 34, 34);
}

.description>.description_title {
    font-weight: bold;
}
    </style>
</head>
<body>
    <%@include file = "../common/header.jsp" %>
    <h1 align="center">종로구</h1>
    <div class="wrap">
        <main>
            <section>
                <div class="item">
                    <div class="img">
                        <a href="#"><img src="img/간판없는가게.jpg" alt="간판없는가게"></a>
                    </div>
                    <div class="description">
                        <div class="description_title">간판없는가게</div>
                        <div class="description_sub1">식당</div>
                        <div class="description_sub2">조회수:</div>
                    </div>
                </div>
    
                <div class="item">
                    <div class="img">
                        <a href="#"><img src="img/리차드하우스 연남.jpg" alt="리차드하우스"></a>
                    </div>
                    <div class="description">
                        <div class="description_title">리차드하우스</div>
                        <div class="description_sub1">식당</div>
                        <div class="description_sub2">조회수:</div>
                    </div>
                </div>
    
                <div class="item">
                    <div class="img">
                        <a href="#"><img src="img/바빌리안테이블.jpg" alt="바빌리안테이블"></a>
                    </div>
                    <div class="description">
                        <div class="description_title">바빌리안테이블</div>
                        <div class="description_sub1">식당</div>
                        <div class="description_sub2">조회수:</div>
                    </div>
                </div>
    
                <div class="item">
                    <div class="img">
                        <a href="#"><img src="img/서울앵무새.jpg" alt="서울앵무새"></a>                   
                    </div>
                    <div class="description">
                        <div class="description_title">서울앵무새</div>
                        <div class="description_sub1">카페</div>
                        <div class="description_sub2">조회수:</div>
                    </div>
                </div>
    
                <div class="item">
                    <div class="img">
                        <a href="#"><img src="img/세상의모든아침.jpg" alt="세상의모든아침"></a>
                    </div>
                    <div class="description">
                        <div class="description_title">세상의모든아침</div>
                        <div class="description_sub1">카페</div>
                        <div class="description_sub2">조회수:</div>
                    </div>
                </div>
    
                <div class="item">
                    <div class="img">
                        <a href="#"><img src="img/이태리이층집.jpg" alt="이태리이층집"></a>
                    </div>
                    <div class="description">
                        <div class="description_title">이태리이층집</div>
                        <div class="description_sub1">카페</div>
                        <div class="description_sub2">조회수:</div>
                    </div>
                </div>
    
                <div class="item">
                    <div class="img">
                        <a href="#"><img src="img/익선애뜻.jpg" alt="익선애뜻"></a>
                    </div>
                    <div class="description">
                        <div class="description_title">익선애뜻</div>
                        <div class="description_sub1">호프</div>
                        <div class="description_sub2">조회수:</div>
                    </div>
                </div>
    
                <div class="item">
                    <div class="img">
                        <a href="#"><img src="img/일떼라쪼당산본점.jpg" alt="일떼라쪼당산본점"></a>
                    </div>
                    <div class="description">
                        <div class="description_title">일떼라쪼당산본점</div>
                        <div class="description_sub1">호프</div>
                        <div class="description_sub2">조회수:</div>
                    </div>
                </div>
            </section>
        </main>
    </div>
</body>
</html>