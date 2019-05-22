<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<style>



h1 {
   padding: 50px 0;
   font-weight: 400;
   text-align: center;
}

p {
   margin: 0 0 20px;
   line-height: 1.5;
}

.main {
   min-width: 320px;
   max-width: 850px;
   padding: 50px;
   margin: 0 auto;
   background: #ffffff;
}

section {
   display: none;
   padding: 20px 0 0;
   border-top: 1px solid #ddd;
}

/*라디오버튼 숨김*/
input {
   display: none;
}

label {
   display: inline-block;
   margin: 0 0 -1px;
   padding: 15px 25px;
   font-weight: 600;
   text-align: center;
   color: #bbb;
   border: 1px solid transparent;
}

label:hover {
   color: #2e9cdf;
   cursor: pointer;
}

/*input 클릭시, label 스타일*/
input:checked+label {
   color: #555;
   border: 1px solid #ddd;
   border-top: 2px solid #2e9cdf;
   border-bottom: 1px solid #ffffff;
}

#tab1:checked ~ #content1, #tab2:checked ~ #content2 {
   display: block;
}


</style>

<title>Document</title>
</head>
<body>
<div id="login_div"><jsp:include page="header.jsp"></jsp:include></div>



   <div class="main">


      <div>
         <div>
            <div>
            <br><br><br><br>

                     <br>

                        <table>
                         
                         <div class="cf">
                           <h1>▼ABOUT MAXIM▼</h1>
                           <button onclick="location.href = this.src='image/all.PNG'" title="클릭하시면 All로 이동됩니다.">
                           <img src="image/bAll.PNG" onmouseover="this.src='image/cAll.PNG'"
                           onmouseout="this.src='image/bAll.PNG'"></button>&nbsp;
                           
                           <button onclick="location.href = this.src='image/cam.jpg'" title="클릭하시면 맥심 브랜드 캠페인으로 이동됩니다.">
                           <img src="image/bBrand.PNG" onmouseover="this.src='image/cBrand.PNG'"
                           onmouseout="this.src='image/bBrand.PNG'"></button>&nbsp;
                           
                           <button onclick="location.href = this.src='image/kanuu.PNG'" title="클릭하시면 카누로 이동됩니다.">
                           <img src="image/bKANU.PNG" onmouseover="this.src='image/cKANU.PNG'"
                           onmouseout="this.src='image/bKANU.PNG'"></button>&nbsp;
                           
                           <button onclick="location.href = this.src='image/iceco.PNG'" title="클릭하시면 아이스 커피믹스로 이동됩니다.">
                           <img src="image/bice.PNG" onmouseover="this.src='image/cice.PNG'"
                           onmouseout="this.src='image/bice.PNG'"></button>&nbsp;
                           
                           <button onclick="location.href = this.src='image/cr.PNG'" title="클릭하시면 맥심 기타로 이동됩니다.">
                           <img src="image/bect.PNG" onmouseover="this.src='image/cect.PNG'"
                           onmouseout="this.src='image/bect.PNG'"></button>

                         <h1>▼MAXIM CF 바로가기▼</h1>
                           
                           <a href="https://www.youtube.com/watch?v=SgBlM62D3d0">
                           <img src="image/gongu.gif" width="850px" height="550px"></a><br><br><br>
                           <a href="https://www.youtube.com/watch?v=1dU9UMQ2P3U">
                           <img src="image/gian.gif" width="850px" height="550px"></a>
                           <br><br><br>
                           <a href="https://www.youtube.com/watch?v=1S-P8YlW7Lo">
                           <img src="image/maiximumi.gif" width="850px" height="550px"></a>
                           <br><br><br><br><br><br><br><br><br>
                        </table>

                  
               </div>               
                  </div>
               </div>
            </div>   
</body>
</html>