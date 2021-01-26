<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주식선물 거래소 /최고수익/비밀보장</title>
<link type="text/css" rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/script.js"></script>
</head>
<body style="topmargin:20px;">
<table style="width: 90%">
  <tr>
  	<td style="font-size: 20px; text-align:center;">주식 선물 거래소</td>
  </tr>
</table>

<%@ include file="guest_top.jsp" %>
<table style="width: 90%">
<% if(memid != null){ %>
	<tr >
		<td >
			<br><br>
			<h5><%=memid %>님! 방문을 환영합니다.</h5>
			<br><br>
		</td>
	</tr>
<%}else{ %>
	<tr style="text-align: center;">
			<td><h3>고객님 어서오세요<br>로그인 후 이용바랍니다</h3></td>
	</tr>
<%}%>
</table>

<%@ include file="guest_bottom.jsp" %>
</body>
</html>