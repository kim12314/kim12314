<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="net.cart.db.CartBean"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<style>

/* .main {
   min-width: 320px;
   max-width: 850px;
   padding: 50px;
   margin: 0 auto;
   background: #ffffff;
} */


/*라디오버튼 숨김*/
input {
   display: none;
}
 
/*꾸미기!*/

  table {
  text-align : center;
    width: 50%;
    border: 0px ;
   /* border-collapse: collapse;*/
  }
  th, td {
    border: 0px ;
    padding: 10px;
  }

th{
 background:#F4F4FF;
}

.btn {
  border: 2px solid black;
  background-color: white;
  color: black;
  padding: 14px 28px;
  font-size: 16px;
  cursor: pointer;
}
.default {
  border-color: #e7e7e7;
  color: black;
}

.default:hover {
  background: #e7e7e7;
}

</style>

<title>Document</title>
</head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".btn").click(function(){
			var result = confirm('정말 삭제 하시겠습니까?');
			if(result){
				<%-- <a href="CartDeleteAction.co?cartNum=<%=cartbean.getCart_num()%>" --%>
				location.href = ""
			}else{
				
			}
		});
	});
</script>
<body>
<%
   List<CartBean> beans = (List<CartBean>)session.getAttribute("cartbean");
%>


   
<br><br><br><br><br><br>

      <div>
         <div>
            <div>
               <h1>
                  <span><b>SHOPPING CART</b></span>
               </h1>
            </div>
            
            <div class="description">
               <div class="member ">
                         <table summary="" class="cart">
                           
                           
                           <thead>
                              <tr>
                                 <th scope="col"><h4>상품코드</h4></th>
                                 <th scope="col"><h4>이미지</h4></th>
                                 <th scope="col"><h4>상품이름</h4></th>
                                 <th scope="col"><h4>판매가</h4></th>
                                 <th scope="col"><h4>수량</h4></th>
                                 <th scope="col"><h4>합계</h4></th>
                                 <th scope="col"><h4>취소</h4></th>
                              </tr>
                              <% for(CartBean cartbean : beans){%>
                              <tr>   
                                 <td><%= cartbean.getCart_code() %></td>
                                 <td><img src="<%= cartbean.getCart_image() %>" style="width:250px; height:auto;" /></td>                                 <td><%= cartbean.getCart_name() %></td>
                                 <td><%= cartbean.getCart_price() %>원</td>
                                 <td><%= cartbean.getCart_count() %></td>
                                 <td><%= cartbean.getCart_sum() %>원</td>
                                 <td><button class ="btn default" id="deletebutton" data-num="<%= cartbean.getCart_num()%>">삭제</button></td>
                              </tr>
                              
                              <%} %>
                              
                           </thead>
                        </table>
                        <br> <br>
                 
<div>
               <h1>
                  <span><b>결제예정 금액</b></span>
               </h1>
            </div>
                           <table >
                           <thead>
                           <th><h4>총 상품금액</h4></th>
                           <th><h4>배송비</h4></th>
                           <th><h4>결제예정 금액</h4></th>
                           </thead> 
                           <% int sum=0; %>
                           
                           <%for(CartBean cartbean : beans){
                              
                              sum+=cartbean.getCart_sum();
                           }
                           %>
                           
                           <tr>
                           <td><%=sum %>원</td>
                           <td><%= 2500 %>원</td>
                           <td><%= sum+2500%>원</td>
                           </tr>
                           </table>
                        </th>
                     

               </div>



               <!-- 이용안내 -->
               <div>
               <br><br><br>
                  <div class="table">
                     <h2>▼장바구니 이용안내▼</h2>
                     
                        <li>[기본배송비] 기본배송비는  2500원 입니다.</li>
                        <li>[쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.</li>
                        <li>[전체상품주문하기] 버튼을 누르시면 전체상품을 주문 하실 수 있습니다.</li>
                        <li>[선택상품주문하기] 버튼을 누르시면 선택상품을 주문 하실 수 있습니다.</li>
                     
                     
                     <form action="cart_list.jsp" method="post">
                        <input type="submit" value="결제하기" />
                     </form>
                  </div>
                  <br> <br>
                  <!-- 주문 버튼 -->
                  <div align="center"
                     class="">
                     <a href="#" onclick="Basket.orderAll(this)">
                     <img src="image/1.jpg" alt="전체상품주문" width="160" height="45"/></a>&nbsp;&nbsp;
                      <a href="#"
                        onclick="Basket.orderSelectBasket(this)">
                     <img src="image/2.jpg" alt="선택상품주문" width="160" height="45"/></a>&nbsp;&nbsp;<span class="gRight">
                     <a href="ProductInfoAction.po?category=ORIGINAL"><img src="image/3.jpg" alt="쇼핑계속하기" width="160" height="45"/></a>&nbsp;&nbsp;
                     </span>
                  </div>
               </div>
            </div>
         </div>
      </div>
</body>
</html>