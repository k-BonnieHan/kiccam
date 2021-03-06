<%@page import="order.OrderDto"%>
<%@page import="product.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="orderMgr" class="order.BiddingMgr" />
<jsp:useBean id="productMgr" class="product.ProductMgr" />

<%
	OrderDto order = orderMgr.getOrderDetail(request.getParameter("no"));
ProductDto product = productMgr.getProduct(order.getProduct_no());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문관리 : 관리자</title>
<link type="text/css" rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/script.js"></script>
</head>
<body style="margin-top: 20px">
	<%@include file="admin_top.jsp"%>
	<form action="orderproc_admin.jsp" name="detailFrm">
		<table style="width: 90%">
			<tr>
				<td>고객 아이디 : <%=order.getId()%></td>
				<td>주 문 번 호 : <%=order.getNo()%></td>
				<td>상 품 번 호 : <%=order.getProduct_no()%></td>
				<td>상 품 명 : <%=product.getName()%></td>
			</tr>
			<tr>
				<td>입 찰 가 격 : <%=product.getPrice()%></td>
				<td>주 문 수 량 : <%=order.getQuantity()%></td>
				<td>주 문 일 자 : <%=order.getSdate()%></td>
			</tr>
			
			<tr>
				<td colspan="5" style="text-align: center;">입찰상태 : <select
					name="state">
						<option value="1">입찰완료</option>
						<option value="2">심사중</option>
						<option value="3">낙찰</option>
						<option value="4">탈락</option>
				</select> <script type="text/javascript">
					document.detailFrm.state.vaule =
				<%=order.getState()%>
					
				</script>
				</td>
			</tr>
			<tr>
			<td colspan="4" style="text-align: center;">
				<input type="button" value=" 수  정  " onclick="orderUpdate(this.form)"> /
				<input type="button" value=" 삭  제  " onclick="orderDelete(this.form)"> 				
				<input type="hidden" name="no" value="<%=order.getNo() %>">
				<input type="hidden" name="flag">
			</td>
			</tr>
		</table>
	</form>

	<%@include file="admin_bottom.jsp"%>

</body>
</html>