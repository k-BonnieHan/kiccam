<%@page import="product.ProductDto"%>
<%@page import="order.OrderDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="orderMgr" class="order.BiddingMgr" />
<jsp:useBean id="productMgr" class="product.ProductMgr" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문관리:관리자</title>
<link type="text/css" rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/script.js"></script>
</head>
<body style="margin-top: 20px">
<%@include file="admin_top.jsp" %>
<table style="width: 90%">
  <tr style="background-color: violet;color: white;">
  	<th>주문번호</th><th>주문자</th><th>상품명</th><th>주문수</th><th>입찰가격</th><th>주문일</th><th>주문상태</th><th>보기</th>
  </tr>
  <%
  ArrayList<OrderDto> list = orderMgr.getOrderAll(); 
  if(list.size() == 0){
  %>
  <tr><td colspan="8">주문 내역이 없습니다</td></tr>
  <%	  
  }else{
	  for(int i = 0; i < list.size(); i++){
		  OrderDto order = list.get(i);
		  ProductDto product = productMgr.getProduct(order.getProduct_no());
  %>
  <tr style="text-align: center;">
  	<td><%=order.getNo() %></td>
  	<td><%=order.getId() %></td>
  	<td><%=product.getName() %></td>
  	<td><%=order.getQuantity() %></td>
  	<td><%=order.getPrice() %></td>
  	<td><%=order.getSdate() %></td>
  	<td>
  	<%
  		switch(order.getState()){
    	case "1":out.println("입찰완료"); break;
    	case "2":out.println("심사중"); break;
    	case "3":out.println("낙찰"); break;
    	case "4":out.println("탈락");break;
    	default:out.println("접수중");
    	}
  	%>
  	</td>
  	<td>
  		<a href="javascript:orderDetail('<%=order.getNo() %>')">상세보기</a>
  	</td>
  </tr>
  <%
	  }
  }
  %>
</table>
<%@include file="admin_bottom.jsp" %>

<form action="orderdetail.jsp" name="detailFrm" method="post">
  <input type="hidden" name="no">
</form>
</body>
</html>






