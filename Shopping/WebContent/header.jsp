
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link rel="stylesheet" href="css/style.css"/>
</head>
<body>
   <div   class="header"> 

   <%if(session.getAttribute("id")!=null) {%>
      <%if(session.getAttribute("id").equals("admin")){ %>

      <ul>
      <li><a href="AdminPage.mo">ADMINPAGE</a>
         <ul>
            <li><a href="ProductListAction.po">상품 리스트</a></li>

            <li><a href="MemberListViewAction.mo">회원리스트</a></li>

            <li><a href="Product_list.po">매출현황</a></li>

            <li><a href="Product_list.po" id="current">배송리스트</a>
         </ul></li>

      <%}%>
       <li>
       		<a id="logout">LOGOUT</a>
       		<script type="text/javascript">
         	$(document).ready(function(){
         		$("#logout").click(function(){
         			var result = confirm("Are you sure LOGOUT?");
         			if(result){
         				location.href="MemberLogoutAction.mo";
         			}
         		});
         	});
         </script> 
       </li>
   <%}else{ %>   
      <li>   <a href="MemberLoginForm.mo">LOGIN</a></li>
           
   <%} %>
         </ul>
   </div>

   <div id="index">
      <a href="main.po"><img src="image/h1Logo.png" width="200px"
         height="70px"></a>
   </div>




   

   <div class="menubar">


      <ul>
       <li><a href="aboutmaxim.jsp">ABOUT MAXIM</a></li>
       
         <li><a href="media.jsp">MEDIA</a></li>
         
         <li><a href="NewsListAction.ne">NOTICE</a></li>
         
         <%List<String> cate = (List<String>)session.getAttribute("productcate"); %>
         <li><a href="#" id="current">PRODUCT</a>
            <ul>
           		<%for(int i=0;i<cate.size();i++){ %>
                	<li><a href="ProductInfoAction.po?category=<%=cate.get(i) %>"><%=cate.get(i) %></a></li>
                <%} %>
            </ul>
         </li>
         
         <li><a href="#">CUSTOMER</a>
         <ul><%if(session.getAttribute("id")!=null) {%>
         
         <li><a href="CartListAction.co">CART</a></li>
         <li><a href="#">ORDER</a></li>
         <li><a href="#">MYSHOPPING</a></li>
         
        
   <%}else{ %>   
       <li><a href="MemberLoginForm.mo">LOGIN</a></li>
               <li><a href="MemberAddView.mo">JOIN</a></li>
   <%} %>
           <li><a href="BoardList.bo">Q&A</a></li>
          
            </ul>
         </li>
      </ul>
   </div>
</body>
</html>
