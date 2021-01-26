<%@page import="product.ProductMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="biddingMgr" class="order.BiddingMgr" scope="session" />
<jsp:useBean id="order" class="order.OrderBean" />
<jsp:useBean id="productMgr" class="product.ProductMgr" />
<jsp:setProperty property="*" name="order"/>

<%

String flag = request.getParameter("flag");
String id = (String)session.getAttribute("idKey");

if(id == null) {
	response.sendRedirect("../member/login.jsp"); 
}else{
	if(flag == null){ 
		order.setId(id); 
		biddingMgr.insertOrder(order);  
%>
		<script>
		alert("주식 입찰 성공!");
		location.href="orderlist.jsp";
		</script>

<%
	}
	
}

%>