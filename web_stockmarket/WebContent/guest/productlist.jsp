<%@page import="product.ProductDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productMgr" class="product.ProductMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
<link type="text/css" rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/script.js"></script>
</head>
<body>
<br>
★ 최고의 수익률을 보장합니다 ★
<p/>
<%@include file="guest_top.jsp" %>
<table style="width: 90%">
  <tr>
  	<th>상품명</th><th>시작가</th><th>재고량</th><th>상세보기</th>
  </tr>
  <%
  ArrayList<ProductDto> list = productMgr.getProductAll();
  for(ProductDto p:list){
  %>
  <tr style="text-align: center;">
    <td>
    	<img src="../upload/<%=p.getImage() %>"  width="80"/>
    	<%=p.getName() %>
    </td>
    <td>
    	<%=p.getPrice() %>
    </td>
    <td>
    	<%=p.getStocks() %>
    </td>
    <td>
    	<a href="javascript:productDetail_guest('<%=p.getNo() %>')">보기</a>
    </td>
  </tr>
  <%	  
  }
  %>
</table>
<br>
<div style="text-align:center;">
<a href="guest_index.jsp" >[메인으로]</a>
</div>
<%@include file="guest_bottom.jsp" %>

<form action="productdetail_g.jsp" name="detailFrm" method="post">
 <input type="hidden" name="no">
</form>
</body>
</html>



