<%@page import="web_pro6.SangpumDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="connMaria" class="web_pro6.ConnMaria"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>**상품 자료**</h2>
방법 1 : 전통적인 방법<br>
<table border="1">
	<tr>
		<th>코드</th><th>품명</th><th>수량</th><th>단가</th>
	</tr>
	<%
	ArrayList<SangpumDto> list = connMaria.getDataAll();
	for(SangpumDto s:list){
	%>
	<tr>
		<td><%=s.getCode() %></td>
		<td><%=s.getSang() %></td>		
		<td><%=s.getSu() %></td>		
		<td><%=s.getDan() %></td>
	</tr>
	<%
	}
	%>		
</table>
<br>
방법2 : EL + JSTL<br>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table border="1">
	<tr>
		<th>코드</th><th>품명</th><th>수량</th><th>단가</th>
	</tr>
	<c:forEach var="a" items="<%=list %>">
	<tr>
		<td>${a.code }</td>
		<td>${a.sang }</td>
		<td>${a.su }</td>
		<td>${a.dan }</td>					
	</tr>
	</c:forEach>

</table>
</body>
</html>